import { FC } from "react";
import Typography from "@mui/material/Typography";
import Card from "@mui/material/Card";
import CardHeader from "@mui/material/CardHeader";
import CardContent from "@mui/material/CardContent";
import CardActions from "@mui/material/CardActions";
import Button from "@mui/material/Button";
import { UIStrategy } from "@entities/index.ts";

export const StrategyCard: FC<UIStrategy> = ({ title, steps }) => {
  return (
    <Card
      sx={{
        width: 250,
        height: 250,
        display: "flex",
        flexDirection: "column",
        justifyContent: "space-between",
      }}
    >
      <CardHeader title={title} />
      <CardContent>
        {steps.map(({ title }) => (
          <Typography key={title} variant="body2" color="text.secondary">
            {title}
          </Typography>
        ))}
      </CardContent>
      <CardActions sx={{ display: "flex", justifyContent: "flex-end" }}>
        <Button variant={"contained"}>Use</Button>
      </CardActions>
    </Card>
  );
};
