import { Outlet } from "react-router-dom";

import Container from "@mui/material/Container";
import { Header } from "@features/Header/Header.tsx";

const Layout = () => {
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
