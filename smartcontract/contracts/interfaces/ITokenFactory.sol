// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title Token Factory
 *
 * @notice Factory that allows to deploy ERC20 tokens with role system.
 */
interface ITokenFactory {
    /**
     * @notice Proxy deployed event.
     * @dev Emitted when deployer performs token deployment.
     *
     * @param tokenProxy The address of deployed token.
     * @param name The name of a token.
     * @param symbol The symbol of a token.
     * @param contractURI The contract URI.
     */
    event ProxyDeployed(address indexed tokenProxy, string name, string symbol, string contractURI);

    /**
     * @notice Deploy token.
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
    ) external returns (address token);

    /**
     * @notice Checks if token is available.
     *
     * @return The bool flag of token availability.
     */
    function isTokenAvailable(address token) external view returns (bool);
}
