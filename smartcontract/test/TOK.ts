import { loadFixture, ethers, expect, upgrades, SignerWithAddress } from "./setup";
import { TokenFactory, BaseToken, TOK } from "../typechain-types";
import { usdcAddress } from "../constants";

// constants
const deployToken = async function (
    tokenFactory: TokenFactory,
): Promise<BaseToken> {
    const deployTx = await tokenFactory.deployToken(
        "TST",
        "TST",
        "ipfs://test"
    );

    const { events } = await deployTx.wait();
    const { address } = events!.find(Boolean);

    return ethers.getContractAt("BaseToken", address);
}
// Tests
describe("TOK", function () {
    async function deployFixture() {
        const [
            owner,
            tokenReceiver,
            admin,
            balanceController,
            newMinter,
            minter,
            ...otherAccounts
        ] = await ethers.getSigners();

        const TokenFactory = await ethers.getContractFactory("TokenFactory");
        const tokenFactory = (await upgrades.deployProxy(TokenFactory, [
        ])) as TokenFactory;
        await tokenFactory.deployed();

        const TOK = await ethers.getContractFactory("TOK");
        const tok = (await upgrades.deployProxy(TOK, [
            usdcAddress
        ])) as TOK;
        await tok.deployed();

        const token = await deployToken(tokenFactory);

        await token.mint(10000);

        return {
            tokenFactory,
            tok,
            token,
            tokenReceiver,
            newMinter,
            owner,
            admin,
            minter,
            balanceController,
            otherAccounts,
        };
    }

    describe("createOrder", function () {
        it("Should work", async function () {
            const { tok, token, tokenReceiver } = await loadFixture(deployFixture);

            // await (
            //     await usdcContract
            //         .connect(tokenReceiver)
            //         .approve(primarySales.address, 20)
            // ).wait();

            // const tx = await tok.connect(tokenReceiver).createOrder(1, token.address, 100);
        });
    });
});
