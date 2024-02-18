import { FC, useEffect } from "react";

import Container from "@mui/material/Container";
import Box from "@mui/material/Box";
import { myStrategyHelmet } from "@shared/helmets/main.ts";
import { withHelmet } from "@shared/hocs";
import { StrategyCard } from "@widgets/StrategyCard/StrategyCard.tsx";
import { useStrategy } from "@shared/services/strategy/strategy.service";

const MyStrategies: FC = () => {
  const { getCurrentUserStrategies, userStrategies } = useStrategy();

  useEffect(() => {
    getCurrentUserStrategies();
  }, []);

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
        {userStrategies.map((props) => (
          <StrategyCard key={props.title} {...props} isPublic={false} />
        ))}
      </Box>
    </Container>
  );
};

export default withHelmet(MyStrategies)(myStrategyHelmet);
