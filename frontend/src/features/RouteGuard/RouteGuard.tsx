import { FC, ReactNode } from "react";
import { Navigate } from "react-router-dom";
import { RoutesNames } from "@shared/constants/routes-names.ts";
import { useUser } from "@shared/services/user/user.service.ts";
import { UserFeatures } from "@shared/constants/roleFeatures.ts";
import { Roles } from "@entities/Users.ts";

export const RouteGuard: FC<{
  children: ReactNode | ReactNode[];
  accessibleRoles: Roles[];
  loginRoute?: RoutesNames;
  permissions?: UserFeatures[];
}> = ({
  loginRoute = RoutesNames.LoginPage,
  children,
  accessibleRoles,
  permissions = [] as UserFeatures[],
}) => {
  const { user, isHavePermission } = useUser();

  if (!user) return <Navigate to={loginRoute} />;

  if (!isHavePermission(permissions)) return;

  if (user?.role && accessibleRoles.includes(user.role)) return children;
};
