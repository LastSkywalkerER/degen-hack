import axiosInstance from "@shared/config/axios.config.ts";
import { ReqAddUserStrategy, ResStep, UIStrategy } from "@entities/index";

export class Startegy {
  private static api = axiosInstance;

  public static async getPublicSteps() {
    return Startegy.api.get<ResStep[]>(`/api/v1/strategy/steps/public`);
  }

  public static async addUserStrategy({ steps, title }: ReqAddUserStrategy) {
    return Startegy.api.post<ReqAddUserStrategy>(`/api/v1/strategy/user`, {
      title,
      steps,
    });
  }

  public static async getCurrentUserStrategies() {
    return Startegy.api.get<UIStrategy[]>(`/api/v1/strategy/user/all`);
  }

  public static async getPublicStrategies() {
    return Startegy.api.get<UIStrategy[]>(`/api/v1/strategy/public/all`);
  }
}
