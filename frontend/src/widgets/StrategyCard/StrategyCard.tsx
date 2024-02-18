import { FC } from "react";
import Typography from "@mui/material/Typography";
import Card from "@mui/material/Card";
import CardHeader from "@mui/material/CardHeader";
import CardContent from "@mui/material/CardContent";
import CardActions from "@mui/material/CardActions";
import Button from "@mui/material/Button";
import { IStrategyCard } from "@entities/index.ts";
import { useStrategy } from "@shared/services/strategy/strategy.service";
import { useWeb3 } from "@shared/services/web3/web3.service.ts";

export const StrategyCard: FC<IStrategyCard> = ({ title, steps, isPublic }) => {
  const { addUserStrategy } = useStrategy();
  const { tryAggregate } = useWeb3();

  const handleStart = async () => {
    console.log(steps, "select");
    const formSteps = steps.map(({ data, func, address, id, title }) => ({
      id,
      address,
      title,
      func,
      data: JSON.parse(data),
    }));
    await tryAggregate(
      steps.map(({ data, func, address }) => ({
        args: JSON.parse(data),
        func,
        // value,
        to: address,
      })),
    );

    await addUserStrategy({
      title: title || "",
      steps: formSteps,
    });
  };

  return (
    <Card
      sx={{
        width: 300,
        height: 300,
        display: "flex",
        flexDirection: "column",
        justifyContent: "space-between",
      }}
    >
      <CardHeader title={title} />
      <CardContent>
        {steps
          .filter((props) => props.serialNumber !== undefined)
          .sort((a, b) => Number(a.serialNumber) - Number(b.serialNumber))
          .map(({ title, func }) => (
            <Typography key={title} variant="body2" color="text.secondary">
              {func.includes("borrow") && (
                <Typography variant="body2" sx={{ fontSize: "15px", fontWeight: "bold" }}>
                  Borrow in AAVE
                </Typography>
              )}
              {func.includes("supply") && (
                <Typography variant="body2" sx={{ fontSize: "15px", fontWeight: "bold" }}>
                  Deposit in AAVE
                </Typography>
              )}
              {func.includes("approve") && (
                <Typography variant="body2" sx={{ fontSize: "13px", fontWeight: "bold" }}>
                  Approve for buy RWA
                </Typography>
              )}
              {func.includes("process") && (
                <Typography variant="body2" sx={{ fontSize: "15px", fontWeight: "bold" }}>
                  Buy RWA
                </Typography>
              )}
              {func.includes("transfer") && (
                <Typography variant="body2" sx={{ fontSize: "15px", fontWeight: "bold" }}>
                  Transfer USDC
                </Typography>
              )}
            </Typography>
          ))}
      </CardContent>
      <CardActions sx={{ display: "flex", justifyContent: "flex-end" }}>
        {isPublic ? (
          <Button
            variant={"contained"}
            sx={{
              backgroundColor: "black",
              "&:active": {
                backgroundColor: "black",
              },
              "&:hover": {
                backgroundColor: "black",
              },
            }}
            onClick={handleStart}
          >
            Follow strategy
          </Button>
        ) : (
          <Button
            variant={"contained"}
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
            Close strategy
          </Button>
        )}
      </CardActions>
    </Card>
  );
};
