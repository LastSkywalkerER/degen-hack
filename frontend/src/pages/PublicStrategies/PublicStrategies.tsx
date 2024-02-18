import { FC, useEffect } from "react";

import Container from "@mui/material/Container";
import Box from "@mui/material/Box";
import { publicStrategiesHelmet } from "@shared/helmets/main.ts";
import { withHelmet } from "@shared/hocs";
import { StrategyCard } from "@widgets/StrategyCard/StrategyCard.tsx";
import { useStrategy } from "@shared/services/strategy/strategy.service";

const PublicStrategies: FC = () => {
  const { publicStrategies, getPublicStrategies } = useStrategy();

  useEffect(() => {
    getPublicStrategies();
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
        {publicStrategies.map((props) => (
          <StrategyCard key={props.title} {...props} isPublic={true} />
        ))}
      </Box>
    </Container>
  );
};

export default withHelmet(PublicStrategies)(publicStrategiesHelmet);
