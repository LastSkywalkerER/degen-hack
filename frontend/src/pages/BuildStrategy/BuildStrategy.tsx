import { FC, useEffect } from "react";

import Container from "@mui/material/Container";
import Box from "@mui/material/Box";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import { TextField } from "@mui/material";
import { buildStrategyHelmet } from "@shared/helmets/main.ts";
import { withHelmet } from "@shared/hocs";
import { StepCard } from "@widgets/StepCard/StepCard.tsx";
import { useStrategy } from "@shared/services/strategy/strategy.service.ts";
import { useWeb3 } from "@shared/services/web3/web3.service.ts";

const BuildStrategy: FC = () => {
  const { steps, title, setTitle, getAllSteps, publicSteps, addUserStrategy, addPublicStrategy } =
    useStrategy();
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

  const handlePublic = () => {
    console.log(steps, "select");
    const formSteps = steps.map(({ args, func, address, id, title }) => ({
      id,
      address,
      title,
      func,
      data: args,
    }));
    addPublicStrategy({
      title: title || "",
      steps: formSteps,
    });
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
        <TextField
          label={"Strategy name"}
          value={title}
          onChange={(e) => setTitle(e.currentTarget.value)}
        />
        <Button
          variant={"contained"}
          onClick={handleStart}
          sx={{
            backgroundColor: "black",
            "&:active": {
              backgroundColor: "black",
            },
            "&:hover": {
              backgroundColor: "black",
            },
          }}
        >
          Start Complex Strategy
        </Button>
        <Button
          variant={"outlined"}
          sx={{
            color: "black",
            border: "1px solid black",
            "&:active": {
              border: "1px solid black",
            },
            "&:hover": {
              border: "1px solid black",
            },
          }}
          onClick={handlePublic}
        >
          Public Complex Strategy
        </Button>

        <Typography>
          {steps.length} in new strategy {title}
        </Typography>
      </Box>
    </Container>
  );
};

export default withHelmet(BuildStrategy)(buildStrategyHelmet);
