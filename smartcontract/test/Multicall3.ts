import { loadFixture, ethers, expect, upgrades, anyValue } from "./setup";
import { Multicall3, } from "../typechain-types";

// constants
const Abi = [
    `function supply(
        address asset,
        uint256 amount,
        address onBehalfOf,
        uint16 referralCode
      ) public`,

    `function borrow(
        address asset,
        uint256 amount,
        uint256 interestRateMode,
        uint16 referralCode,
        address onBehalfOf
      ) public`,
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
            const { owner, multicall } = await loadFixture(deployFixture);

            const iface = new ethers.utils.Interface(Abi);
            const encodedSupplyData = iface.encodeFunctionData('supply', ["", 1]);
            const encodedBorrowData = iface.encodeFunctionData('borrow', ["0x94a9D9AC8a22534E3FaCa9F4e7F2E2cf85d5E4C8", 1, 1]);

            const supply: Multicall3.CallStruct =
            {
                target: "0x6Ae43d3271ff6888e7Fc43Fd7321a503ff738951",
                callData: encodedSupplyData
            };

            const borrow: Multicall3.CallStruct =
            {
                target: "0x6Ae43d3271ff6888e7Fc43Fd7321a503ff738951",
                callData: encodedBorrowData
            };

            const tx = await multicall.connect(owner).aggregate([supply, borrow]);

            console.log(tx);
        });
    });
});
