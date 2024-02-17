import { createBrowserRouter } from "react-router-dom";
import { lazy } from "react";

import { RouteGuard } from "@features/RouteGuard/RouteGuard.tsx";
import { RoutesNames } from "./constants/routes-names";

const Home = lazy(() => import("../pages/Home/Home"));
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
            <div>App</div>
          </RouteGuard>
        ),
      },
    ],
  },
]);
