import { Outlet } from "react-router-dom";
import Box from "@mui/material/Box";
import { Header } from "@widgets/Header/Header.tsx";

const Layout = () => {
  return (
    <Box
      sx={{
        width: "100%",
        height: "100vh",
        display: "flex",
        flexDirection: "column",
      }}
    >
      <Header />
      <Outlet />
    </Box>
  );
};

export default Layout;
