import { FC, useCallback } from "react";
import { useNavigate } from "react-router-dom";

import Container from "@mui/material/Container";
import { Card, TextField } from "@mui/material";
import Button from "@mui/material/Button";
import Box from "@mui/material/Box";
import { loginHelmet } from "@shared/helmets/main.ts";
import { withHelmet } from "@shared/hocs";
import { useUser } from "@shared/services/user/user.service.ts";
import { RoutesNames } from "@shared/constants/routes-names.ts";

const Login: FC = () => {
  const { login } = useUser();

  const navigate = useNavigate();

  const handleConnect = useCallback(async () => {}, []);

  const handleLogin = useCallback(async () => {
    await login();

    navigate(RoutesNames.Home);
  }, []);

  return (
    <Container
      sx={{
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        height: "100%",
      }}
    >
      <Card sx={{ display: "flex", flexDirection: "column", gap: 3, padding: 3 }}>
        <TextField label="Email" variant="outlined" />
        <TextField label="Password" variant="outlined" />
        <Box sx={{ display: "flex", justifyContent: "space-between" }}>
          <Button variant="outlined" onClick={handleConnect}>
            Connect
          </Button>
          <Button variant="contained" onClick={handleLogin}>
            Login
          </Button>
        </Box>
      </Card>
    </Container>
  );
};

export default withHelmet(Login)(loginHelmet);
