import { Outlet } from "react-router-dom";

import Container from "@mui/material/Container";
import { useUser } from "@shared/services/user/user.service.ts";
import { Header } from "@features/Header/Header.tsx";

const Layout = () => {
  const { logout } = useUser();

  return (
    <Container
      disableGutters
      sx={{
        display: "flex",
        flexDirection: "column",
        height: "100vh",
        width: "100%",
      }}
    >
      <Header />
      <Outlet />
    </Container>
  );
};

export default Layout;
