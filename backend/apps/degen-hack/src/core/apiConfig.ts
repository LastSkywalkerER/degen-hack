const apiConfigBase = {
  prefix: '/api',
  version: '/v1',
};
export const basePath = `${apiConfigBase.prefix}${apiConfigBase.version}`;
export const apiConfig = {
  cryptoAuth: {
    authLogin: `${basePath}/crypto/auth`,
    verifyMessage: `${basePath}/crypto/verify`,
    refreshToken: `${basePath}/crypto/refresh-token`,
    logout: `${basePath}/crypto/logout`,
  },
  user: {
    getUser: `${basePath}/user`,
  },
  token: {
    getTokensInfo: `${basePath}/tokens-info`,
  },
  strategy: {
    getAllSteps: `${basePath}/strategy/steps/public`,
    getStepById: `${basePath}/strategy/step/:id`,
    addPublicStrategy: `${basePath}/strategy/public`,
    addUserStrategy: `${basePath}/strategy/user`,
    getCurrentUserStrategies: `${basePath}/strategy/user/all`,
    getPublicStrategies: `${basePath}/strategy/public/all`,
    getStrategyById: `${basePath}/strategy/:id`,
  },
};
