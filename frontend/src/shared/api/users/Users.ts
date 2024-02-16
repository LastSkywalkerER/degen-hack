import axiosInstance from "@shared/config/axios.config.ts";
import { UserFromBE, UsersFilter, UserToAdd } from "@entities/Users";

export class Users {
  private static api = axiosInstance;

  public static async addUser(data: UserToAdd) {
    return Users.api.post(`/users`, data);
  }

  public static async getUsers(filter?: UsersFilter) {
    return Users.api.get<UserFromBE[]>(`/users`, { params: filter });
  }

  public static async deleteUser(id: string) {
    return Users.api.delete(`/users/${id}`);
  }

  public static async getUser(id: string) {
    return Users.api.get<UserFromBE>(`/users/${id}`);
  }

  public static async updateUser(id: string, data: Partial<UserToAdd>) {
    return Users.api.put(`/users/${id}`, data);
  }
}
