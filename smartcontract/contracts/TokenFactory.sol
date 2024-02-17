// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ERC165Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/introspection/ERC165Upgradeable.sol";
import {AccessControlUpgradeable} from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import {IAccessControl} from "@openzeppelin/contracts/access/IAccessControl.sol";

import {Clones} from "@openzeppelin/contracts/proxy/Clones.sol";

import {ITokenFactory} from "./interfaces/ITokenFactory.sol";

import {IAllowedList} from "./SIRA/IAllowedList.sol";

import {BaseToken} from "./BaseToken.sol";
import {AllowedList} from "./SIRA/AllowedList.sol";

/**
 * @title Token Factory
 *
 * The contract which allows to deploy clones of ERC20 tokens and set
 * initial supply, symbol and name. Each deploy can be done only
 * from authorized multisig wallet.
 */
contract TokenFactory is ITokenFactory, Initializable, ERC165Upgradeable, AccessControlUpgradeable, OwnableUpgradeable {
    bytes32 public constant DEPLOYER_ROLE = keccak256("DEPLOYER_ROLE");

    // Address of token implementation contract
    address public tokenImplementation;
    address public allowedListImplementation;

    // Available tokens
    mapping(address token => bool) availableTokens;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    /**
     * @dev Initializes the contract with the required parameters.
     */
    function initialize() external initializer {
        __Ownable_init();
        __AccessControl_init();
        __ERC165_init();

        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(DEPLOYER_ROLE, msg.sender);

        tokenImplementation = address(new BaseToken());
        allowedListImplementation = address(new AllowedList());
    }

    /**
     * @dev Performs token deployment.
     *
     * @param name The token name.
     * @param symbol The token symbol.
     * @param contractURI The contract URI.
     * @return token The address of deployed token.
     */
    function deployToken(
        string calldata name,
        string calldata symbol,
        string calldata contractURI
    ) external onlyRole(DEPLOYER_ROLE) returns (address token, address allowedList) {
        require(bytes(contractURI).length > 0, "Empty contract URI");

        token = Clones.clone(tokenImplementation);
        allowedList = Clones.clone(allowedListImplementation);

        availableTokens[token] = true;

        AllowedList(allowedList).initialize();
        BaseToken(token).initialize(name, symbol, contractURI, allowedList);

        emit ProxyDeployed(token, name, symbol, contractURI);
    }

    /**
     * @dev Checks if token is available.
     *
     * @return The bool flag of token availability.
     */
    function isTokenAvailable(address token) external view returns (bool) {
        require(token != address(0), "Invalid token address");
        return availableTokens[token];
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(
        bytes4 interfaceId
    ) public view virtual override(AccessControlUpgradeable, ERC165Upgradeable) returns (bool) {
        return interfaceId == type(ITokenFactory).interfaceId || super.supportsInterface(interfaceId);
    }
}
