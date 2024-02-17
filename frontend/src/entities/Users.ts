export enum Roles {
  User = "user",
  Admin = "admin",
}

export interface LoggedUser {
  address: string;
  clientId: string;
  role: Roles;
  userId: string;
  exp: number;
  iat: number;
}
