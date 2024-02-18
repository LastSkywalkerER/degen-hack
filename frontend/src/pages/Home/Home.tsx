import { FC } from "react";

import Container from "@mui/material/Container";
import Typography from "@mui/material/Typography";
import { mainHelmet } from "@shared/helmets/main.ts";
import { withHelmet } from "@shared/hocs";

const Home: FC = () => {
  return (
    <Container
      sx={{
        width: "100%",
        height: "100%",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
      }}
    >
      <Typography variant={"h6"}>
        With minds as bright as our spirits, we believe in turning wild ideas into reality
      </Typography>
    </Container>
  );
};

export default withHelmet(Home)(mainHelmet);
