import axiosInstance from "@shared/config/axios.config.ts";

export class Auth {
  private static api = axiosInstance;

  public static async getMessage(address: string) {
    return Auth.api.get<{ nonce: string }>(`/login-nonce/${address}`);
  }

  public static async verifySignature(address: string, signature: string) {
    return Auth.api.post<{ accessToken: string; refreshToken: string }>("/login", {
      address,
      signature,
    });
  }
}
