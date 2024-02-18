import { FC, useEffect } from "react";

import Container from "@mui/material/Container";
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
        flexWrap: "wrap",
        gap: 5,
        padding: 8,
      }}
    >
      {publicStrategies.map((props) => (
        <StrategyCard key={props.title} {...props} isPublic={true} />
      ))}
    </Container>
  );
};

export default withHelmet(PublicStrategies)(publicStrategiesHelmet);
