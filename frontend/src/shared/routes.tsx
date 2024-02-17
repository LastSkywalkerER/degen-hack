import { createBrowserRouter } from "react-router-dom";
import { lazy } from "react";

import { RouteGuard } from "@features/RouteGuard/RouteGuard.tsx";
import { Roles } from "@entities/Users.ts";
import { RoutesNames } from "./constants/routes-names";

const Home = lazy(() => import("../pages/Home/Home"));
const Login = lazy(() => import("../pages/Login/Login"));
const Layout = lazy(() => import("./layout/layout"));

export const routes = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    children: [
      {
        path: RoutesNames.LoginPage,
        element: <Login />,
      },
      {
        path: RoutesNames.Home,
        element: <Home />,
      },
      {
        path: RoutesNames.App,
        element: (
          <RouteGuard accessibleRoles={[Roles.Admin, Roles.User]}>
            <div>App</div>
          </RouteGuard>
        ),
      },
    ],
  },
]);
