import axiosInstance from "@shared/config/axios.config.ts";
import { UserData } from "@entities/Users.ts";

export class Users {
  private static api = axiosInstance;

  public static async getUser() {
    return Users.api.get<UserData>(`/api/v1/user`);
  }
}
