import axios, { AxiosError } from "axios";
import { useStore } from "@shared/services/store/store.service.ts";
import { useUser } from "@shared/services/user/user.service.ts";
import { env } from "@shared/config/environment.ts";
import { useGlobalModal } from "@shared/services/modals/modal.service.ts";

const axiosInstance = axios.create({
  baseURL: env.BE_URL,
  // headers: { "Content-Type": "application/json" },
});

axiosInstance.interceptors.request.use(
  (config) => {
    const accessToken = useStore.getState().accessToken;

    if (accessToken) {
      config.headers.Authorization = `Bearer ${accessToken}`;
    }

    return config;
  },
  (error) => {
    return Promise.reject(error);
  },
);

axiosInstance.interceptors.response.use(
  (response) => {
    return response;
  },
  async (error: AxiosError) => {
    if (error?.response?.status === 401) {
      const { refresh, logout } = useUser.getState();

      try {
        await refresh();
      } catch (error) {
        useGlobalModal.getState().setError(error as Error);

        await logout();
      }
    }

    return Promise.reject(error?.response?.data || error);
  },
);

export default axiosInstance;
