import { FC, useEffect } from "react";

import Container from "@mui/material/Container";
import Box from "@mui/material/Box";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import { TextField } from "@mui/material";
import { buildStrategyHelmet } from "@shared/helmets/main.ts";
import { withHelmet } from "@shared/hocs";
import { UIStep } from "@entities/index.ts";
import { StepCard } from "@widgets/StepCard/StepCard.tsx";
import { useStrategy } from "@shared/services/strategy/strategy.service.ts";
import { useWeb3 } from "@shared/services/web3/web3.service.ts";

const BuildStrategy: FC = () => {
  const { steps, title, setTitle, getAllSteps, publicSteps, addUserStrategy } = useStrategy();
  const { tryAggregate } = useWeb3();

  useEffect(() => {
    getAllSteps();
  }, []);

  const handleStart = () => {
    console.log(steps, "select");
    const formSteps = steps.map(({ args, func, address, id, title }) => ({
      id,
      address,
      title,
      func,
      data: args,
    }));
    addUserStrategy({
      title: title || "",
      steps: formSteps,
    });
    // tryAggregate(
    //   steps.map(({ args, func, address }) => ({
    //     args,
    //     func,
    //     // value,
    //     to: address,
    //   })),
    // );
  };

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
        {publicSteps.map((props) => (
          <StepCard key={props.id} {...props} />
        ))}
      </Box>
      <Box
        sx={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          gap: 2,
        }}
      >
        <Button variant={"contained"} onClick={handleStart}>
          Start Complex Strategy
        </Button>
        <Button variant={"outlined"}>Public Complex Strategy</Button>
        <TextField
          label={"Strategy name"}
          value={title}
          onChange={(e) => setTitle(e.currentTarget.value)}
        />
        <Typography>
          {steps.length} in new strategy {title}
        </Typography>
      </Box>
    </Container>
  );
};

export default withHelmet(BuildStrategy)(buildStrategyHelmet);