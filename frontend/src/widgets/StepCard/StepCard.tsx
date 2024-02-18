import { FC, useState } from "react";
import Avatar from "@mui/material/Avatar";
import Typography from "@mui/material/Typography";
import Card from "@mui/material/Card";
import CardHeader from "@mui/material/CardHeader";
import CardContent from "@mui/material/CardContent";
import CardActions from "@mui/material/CardActions";
import { red } from "@mui/material/colors";
import Button from "@mui/material/Button";
import { Modal } from "@mui/material";
import Box from "@mui/material/Box";
import { UIStep } from "@entities/index.ts";
import { StepSettings } from "@widgets/StepSettings/StepSettings.tsx";
import { useStrategy } from "@shared/services/strategy/strategy.service.ts";
import { AggregateArgs } from "@shared/services/web3/web3.service.ts";

export const StepCard: FC<UIStep> = ({
  title,
  icon,
  address,
  args,
  func,
  id,
  serialNumber,
  isPublic,
}) => {
  const [isSettingsOpen, setSettingsOpen] = useState(false);
  const { selectStep } = useStrategy();

  const handleAddStep = ({ func, args, to }: AggregateArgs) => {
    selectStep({
      args,
      func,
      address: to,
      icon,
      title,
      id,
      serialNumber,
      isPublic,
    });
    setSettingsOpen(false);
  };

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
      <CardHeader
        avatar={
          <Avatar sx={{ bgcolor: red[500] }}>
            <img
              src={icon}
              alt="icon"
              style={{
                maxHeight: "100%",
                maxWidth: "100%",
                objectFit: "cover",
              }}
            />
          </Avatar>
        }
        title={title}
      />
      <CardContent>
        <Typography variant="body2" color="text.secondary">
          Contract: {address}
        </Typography>
        {args.map(
          ({ name, id, value, type }) =>
            type !== "const" && (
              <Typography key={id} variant="body2" color="text.secondary">
                {name}: {value}
              </Typography>
            ),
        )}
      </CardContent>
      <CardActions sx={{ display: "flex", justifyContent: "flex-end" }}>
        <Button variant={"contained"} onClick={() => setSettingsOpen(true)}>
          Select
        </Button>
      </CardActions>
      <Modal open={isSettingsOpen} onClose={() => setSettingsOpen(false)}>
        <Box
          sx={{
            position: "absolute" as const,
            top: "50%",
            left: "50%",
            transform: "translate(-50%, -50%)",
            width: 400,
            p: 4,
          }}
        >
          <StepSettings defaultValues={{ args, to: address, func }} onSubmit={handleAddStep} />
        </Box>
      </Modal>
    </Card>
  );
};
