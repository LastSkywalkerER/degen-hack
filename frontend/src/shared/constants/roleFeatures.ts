import { Roles } from "@entities/Users.ts";

export enum UserFeatures {
  CanAddUser = "canAddUser",
}

export const roleFeatures: Record<Roles, UserFeatures[]> = {
  admin: [UserFeatures.CanAddUser],
  user: [],
};

export const availableRoles = Object.keys(roleFeatures) as Roles[];
