import { FC } from "react";

import Container from "@mui/material/Container";
import Box from "@mui/material/Box";
import { myStrategyHelmet } from "@shared/helmets/main.ts";
import { withHelmet } from "@shared/hocs";
import { UIStrategy } from "@entities/index.ts";
import { mockSteps } from "@pages/BuildStrategy/BuildStrategy.tsx";
import { StrategyCard } from "@widgets/StrategyCard/StrategyCard.tsx";

const mockStrategies: UIStrategy[] = [
  {
    steps: mockSteps,
    title: "1",
  },
  { steps: mockSteps, title: "2" },
  { steps: mockSteps, title: "3" },
];

const MyStrategies: FC = () => {
  return (
    <Container
      sx={{
        display: "flex",
        gap: 5,
        height: "100%",
        flexDirection: "column",
        padding: 8,
      }}
    >
      <Box
        sx={{
          gap: 5,
          display: "flex",
          flexWrap: "wrap",
          height: "100%",
        }}
      >
        {mockStrategies.map((props) => (
          <StrategyCard key={props.title} {...props} />
        ))}
      </Box>
    </Container>
  );
};

export default withHelmet(MyStrategies)(myStrategyHelmet);
