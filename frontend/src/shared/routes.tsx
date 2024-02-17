import { createBrowserRouter, Navigate, Outlet } from "react-router-dom";
import { lazy } from "react";

import { RouteGuard } from "@features/RouteGuard/RouteGuard.tsx";
import { RoutesNames } from "./constants/routes-names";

const Home = lazy(() => import("../pages/Home/Home"));
const BuildStrategy = lazy(() => import("../pages/BuildStrategy/BuildStrategy"));
const MyStrategies = lazy(() => import("../pages/MyStrategies/MyStrategies"));
const Layout = lazy(() => import("./layout/layout"));

export const routes = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    children: [
      {
        path: RoutesNames.Home,
        element: <Home />,
      },
      {
        path: RoutesNames.App,
        element: (
          <RouteGuard>
            <Outlet />
          </RouteGuard>
        ),
        children: [
          {
            path: RoutesNames.App + RoutesNames.BuildStrategy,
            element: <BuildStrategy />,
          },
          {
            path: RoutesNames.App + RoutesNames.MyStrategy,
            element: <MyStrategies />,
          },
          {
            path: RoutesNames.App,
            element: <Navigate to={RoutesNames.App + RoutesNames.BuildStrategy} />,
          },
        ],
      },
    ],
  },
]);
