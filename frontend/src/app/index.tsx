import { FC, memo, Suspense, useEffect } from "react";
import { RouterProvider } from "react-router-dom";

import { CssBaseline } from "@mui/material";
import {
  ThirdwebProvider,
  useNetworkMismatch,
  useSigner,
  useSwitchChain,
  useWallet as useThirdwebWallet,
} from "@thirdweb-dev/react";
import { Sepolia } from "@thirdweb-dev/chains";
import { withHelmet } from "@shared/hocs";
import { useUser } from "@shared/services/user/user.service";
import { usePolling } from "@shared/services/polling/polling.service.ts";
import { useWallet } from "@shared/services/wallet/wallet.service.ts";
import { env } from "@shared/config/environment.ts";
import { routes } from "../shared/routes";
import { mainHelmet } from "../shared/helmets/main";

import { FCWithChildren } from "../types";

export const Index: FC = withHelmet(() => {
  return (
    <AppWrapper>
      <RouterProvider router={routes} />
    </AppWrapper>
  );
})(mainHelmet);

const InitialWrapper: FC<FCWithChildren> = ({ children }) => {
  const { getActiveUser, logout } = useUser();
  const signer = useSigner();
  const wallet = useThirdwebWallet();
  const isMismatch = useNetworkMismatch();
  const switchChain = useSwitchChain();
  const { init: initWallet } = useWallet();
  const { init } = usePolling();

  useEffect(() => {
    getActiveUser();
    init();
    initWallet(signer);
  }, [signer]);

  useEffect(() => {
    isMismatch && switchChain(Sepolia.chainId);
  }, [isMismatch]);

  useEffect(() => {
    wallet?.on("change", logout);
    wallet?.on("disconnect", logout);

    return () => {
      wallet?.off("change", logout);
      wallet?.off("disconnect", logout);
    };
  }, [wallet]);

  return children;
};

const AppWrapper: FC<FCWithChildren> = memo(({ children }) => {
  return (
    <Suspense>
      <ThirdwebProvider activeChain={Sepolia} clientId={env.CLIENT_ID}>
        <CssBaseline />
        <InitialWrapper>{children}</InitialWrapper>
      </ThirdwebProvider>
    </Suspense>
  );
});
