import { FC, memo, Suspense, useEffect } from "react";
import { RouterProvider } from "react-router-dom";

import { CssBaseline } from "@mui/material";
import { withHelmet } from "@shared/hocs";
import { useUser } from "@shared/services/user/user.service";
import { usePolling } from "@shared/services/polling/polling.service.ts";
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
  const { getActiveUser } = useUser();
  const { init } = usePolling();

  useEffect(() => {
    getActiveUser();
    init();
  }, [getActiveUser]);

  return children;
};

const AppWrapper: FC<FCWithChildren> = memo(({ children }) => {
  return (
    <Suspense>
      <CssBaseline />
      <InitialWrapper>{children}</InitialWrapper>
    </Suspense>
  );
});
