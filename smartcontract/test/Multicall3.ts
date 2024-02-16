import { loadFixture, ethers, expect, upgrades, anyValue } from "./setup";
import { Multicall3, } from "../typechain-types";
import usdcJson from "../UsdcLodestar.json";

// constants
const Abi = [
    "function mint(uint mintAmount) external returns (uint)",
    "function borrow(uint borrowAmount) external returns (uint)",
];
// Tests
describe("Multicall", function () {
    async function deployFixture() {
        const [
            owner,
            admin,
            ...otherAccounts
        ] = await ethers.getSigners();

        const Multicall = await ethers.getContractFactory("Multicall3");
        const multicall = (await upgrades.deployProxy(Multicall, [
        ])) as Multicall3;
        await multicall.deployed();

        return {
            multicall,
            owner,
            admin,
            otherAccounts,
        };
    }

    describe("aggregate", function () {
        it("Should aggregate", async function () {
            const { multicall } = await loadFixture(deployFixture);

            const signer = await ethers.getImpersonatedSigner("0xb32754fb72f300fc9bba952947e381a3f9121039");

            const USDC = await ethers.getContractAt(usdcJson, "0x4C9aAed3b8c443b4b634D1A189a5e25C604768dE");

            await USDC.connect(signer).approve(USDC.address, 2);

            const iface = new ethers.utils.Interface(Abi);
            const encodedSupplyData = iface.encodeFunctionData('mint', [1]);
            const encodedBorrowData = iface.encodeFunctionData('borrow', [1]);

            const supply: Multicall3.CallStruct =
            {
                target: "0x4C9aAed3b8c443b4b634D1A189a5e25C604768dE",
                callData: encodedSupplyData
            };

            const borrow: Multicall3.CallStruct =
            {
                target: "0x9365181A7df82a1cC578eAE443EFd89f00dbb643",
                callData: encodedBorrowData
            };

            const tx = await multicall.connect(signer).aggregate([supply, borrow]);

            console.log(tx);
        });
    });
});
