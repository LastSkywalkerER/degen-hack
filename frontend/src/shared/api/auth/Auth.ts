import axiosInstance from "@shared/config/axios.config.ts";

export class Auth {
  private static api = axiosInstance;

  public static async getMessage(address: string) {
    return Auth.api.post<{
      message: string;
    }>(`/api/v1/crypto/auth`, { address });
  }

  public static async verifySignature(address: string, signature: string) {
    return Auth.api.post<{
      success: boolean;
      accessToken: string;
      refreshToken: string;
    }>("/api/v1/crypto/verify", {
      address,
      signature,
    });
  }

  public static async refresh(refreshToken: string) {
    return Auth.api.post<{
      success: boolean;
      accessToken: string;
      refreshToken: string;
    }>("/api/v1/crypto/refresh-token", null, {
      headers: { Authorization: `Bearer ${refreshToken}` },
    });
  }

  public static async logout() {
    return Auth.api.post<{
      message: string;
    }>("/api/v1/crypto/logout");
  }
}
