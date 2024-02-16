import axios, { AxiosError } from "axios";
import { baseURL } from "@shared/constants";
import { useStore } from "@shared/services/store/store.service.ts";
import { useUser } from "@shared/services/user/user.service.ts";

const axiosInstance = axios.create({
  baseURL,
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
  (error: AxiosError) => {
    if (error?.response?.status === 401) {
      useUser.getState().logout();
    }

    return Promise.reject(error?.response?.data || error);
  },
);

export default axiosInstance;
