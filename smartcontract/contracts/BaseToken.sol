// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {AccessControlUpgradeable} from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import {PausableUpgradeable} from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import {ERC165Checker} from "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";

import {ERC20Upgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import {ERC20BurnableUpgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";

import {IAllowedList} from "./SIRA/IAllowedList.sol";

/**
 * @title Base Token
 *
 * The contract which represents custom token implementation for deploying
 * similar tokens with role system. Each token can be minted only to
 * balance controller wallet.
 */
contract BaseToken is
    Initializable,
    ERC20Upgradeable,
    ERC20BurnableUpgradeable,
    AccessControlUpgradeable,
    PausableUpgradeable,
    OwnableUpgradeable
{
    bytes32 public constant DEPLOYER_ROLE = keccak256("DEPLOYER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    IAllowedList public allowedList;

    // Contract URI
    string public contractURI;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    /**
     * @dev Initializes the contract with the required parameters.
     *
     * @param name_ The token name.
     * @param symbol_ The token symbol.
     * @param contractURI_ The contract URI.
     */
    function initialize(
        string calldata name_,
        string calldata symbol_,
        string calldata contractURI_,
        address allowedList_
    ) external initializer {
        require(bytes(contractURI_).length > 0, "Empty contract URI");
        require(allowedList_ != address(0), "LOL");

        __Ownable_init();
        __Pausable_init();
        __AccessControl_init();
        __ERC20_init(name_, symbol_);
        __ERC20Burnable_init();

        allowedList = IAllowedList(allowedList_);
        contractURI = contractURI_;

        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(DEPLOYER_ROLE, msg.sender);
    }

    /**
     * @dev Processes token mint.
     * Can only be run on a balance controller wallet.
     *
     * @param amount The amount of tokens.
     */
    function mint(uint256 amount) external onlyRole(MINTER_ROLE) {
        require(amount != 0, "Zero token amount");

        _mint(msg.sender, amount);
    }

    function isInAllowedList(address _address) external view {
        _isInAllowedList(_address);
    }

    function checkAllowedList(address _address) external view returns (bool) {
        return allowedList.checkAllowedList(_address);
    }

    function _isInAllowedList(address _address) internal view {
        require(allowedList.checkAllowedList(_address), "EquityToken: address is not on allowed list");
    }

    /**
     * @dev Processes token transfer.
     *
     * @param from The from address.
     * @param to The to address.
     * @param amount The amount of tokens.
     * @return The bool flag of transfer success.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual override whenNotPaused returns (bool) {
        return super.transferFrom(from, to, amount);
    }

    /**
     * @dev Processes token transfer.
     *
     * @param to The to address.
     * @param amount The amount of tokens.
     * @return The bool flag of transfer success.
     */
    function transfer(address to, uint256 amount) public virtual override whenNotPaused returns (bool) {
        return super.transfer(to, amount);
    }

    /**
     * @dev Processes token burn.
     *
     * @param amount The amount of tokens.
     */
    function burn(uint256 amount) public virtual override onlyRole(DEPLOYER_ROLE) {
        super.burn(amount);
    }

    /**
     * @dev Processes token burn.
     *
     * @param account The account address.
     * @param amount The amount of tokens.
     */
    function burnFrom(address account, uint256 amount) public virtual override onlyRole(DEPLOYER_ROLE) {
        super.burnFrom(account, amount);
    }

    /**
     * @notice Pauses the contract.
     */
    function pauseContract() external onlyRole(MINTER_ROLE) {
        _pause();
    }

    /**
     * @notice Returns token decimals.
     */
    function decimals() public pure override returns (uint8) {
        return 6;
    }

    /**
     * @notice Unpauses the contract.
     */
    function unpauseContract() external onlyRole(DEPLOYER_ROLE) {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        super._beforeTokenTransfer(from, to, amount);

        require(allowedList.checkAllowedList(to), "EquityToken: address is not on allowed list");
        require(!paused(), "EquityToken: token transfer while paused");
    }
}
