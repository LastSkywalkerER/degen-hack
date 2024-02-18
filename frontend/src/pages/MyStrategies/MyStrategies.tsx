import { FC, useEffect } from "react";

import Container from "@mui/material/Container";
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
        flexWrap: "wrap",
        gap: 5,
        padding: 8,
      }}
    >
      {userStrategies.map((props) => (
        <StrategyCard key={props.title} {...props} isPublic={false} />
      ))}
    </Container>
  );
};

export default withHelmet(MyStrategies)(myStrategyHelmet);
