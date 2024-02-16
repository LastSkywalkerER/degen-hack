import { FC } from "react";

import { mainHelmet } from "@shared/helmets/main.ts";
import { withHelmet } from "@shared/hocs";

const Home: FC = () => {
  return <div>Landing</div>;
};

export default withHelmet(Home)(mainHelmet);
