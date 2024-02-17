import { FC, ReactNode } from "react";
import { Navigate } from "react-router-dom";
import { RoutesNames } from "@shared/constants/routes-names.ts";
import { useUser } from "@shared/services/user/user.service.ts";

export const RouteGuard: FC<{
  children: ReactNode | ReactNode[];
  loginRoute?: RoutesNames;
}> = ({ loginRoute = RoutesNames.Home, children }) => {
  const { user } = useUser();

  if (!user) return <Navigate to={loginRoute} />;

  if (user) return children;
};
