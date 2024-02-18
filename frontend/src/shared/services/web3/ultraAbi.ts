import aaveAbi from "./aaveAbi.json";
import ERC20abi from "./ERC20abi.json";
import saleslAbi from "./saleslAbi.json";

export const ultraAbi = [...aaveAbi, ...ERC20abi, ...saleslAbi];
