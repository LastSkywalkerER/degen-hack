import { loadFixture, ethers, expect, upgrades, anyValue } from "./setup";
import { Multicall3, StableCoin, Multicall2 } from "../typechain-types";

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
const abi2 = ["function transferFrom(address from, address to, uint amount)",]
// Tests
describe("Multicall", function () {
    async function deployFixture() {
        const [
            owner,
            admin,
            rec,
            ...otherAccounts
        ] = await ethers.getSigners();

        const Multicall = await ethers.getContractFactory("Multicall3");
        const multicall = (await upgrades.deployProxy(Multicall, [
        ])) as Multicall3;
        await multicall.deployed();

        // const Multicall = await ethers.getContractFactory("Multicall2");
        // const multicall = (await upgrades.deployProxy(Multicall, [
        // ])) as Multicall2;
        // await multicall.deployed();

        const StableCoin = await ethers.getContractFactory("StableCoin");
        const stableCoin = (await upgrades.deployProxy(StableCoin, [
            "STT",
            "STT"
        ])) as StableCoin;
        await stableCoin.deployed();

        return {
            multicall,
            stableCoin,
            rec,
            owner,
            admin,
            otherAccounts,
        };
    }

    describe("aggregate", function () {
        it("Should aggregate", async function () {
            const { owner, multicall, rec, stableCoin } = await loadFixture(deployFixture);

            const iface = new ethers.utils.Interface(abi2);
            const encodedSupplyData = iface.encodeFunctionData("transferFrom", [owner.address, rec.address, 1]);
            // const encodedBorrowData = iface.encodeFunctionData('borrow', ["0x94a9D9AC8a22534E3FaCa9F4e7F2E2cf85d5E4C8", 1, 1]);

            const supply: Multicall3.CallStruct =
            {
                target: stableCoin.address,
                callData: encodedSupplyData
            };

            // const borrow: Multicall3.CallStruct =
            // {
            //     target: "0x6Ae43d3271ff6888e7Fc43Fd7321a503ff738951",
            //     callData: encodedBorrowData
            // };

            console.log(supply.callData);


            await stableCoin.approve(owner.address, 1);
            await stableCoin.approve(multicall.address, 2);

            const tx = await multicall.aggregate([supply]);

            // console.log(tx);
        });
    });
});
