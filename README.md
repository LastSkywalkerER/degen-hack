## Abstract

**Integration of DeFi into the Banking Sector**

The banking industry is currently undergoing a significant transformation, with a growing inclination towards integrating Decentralized Finance (DeFi) mechanisms. This shift stems from the realization that DeFi offers a plethora of advantages, including enhanced transparency, improved security, and increased efficiency through blockchain technology. Traditional banks are exploring various strategies to incorporate DeFi, aiming to leverage blockchain's immutable ledger for more secure and transparent transactions, and to offer their clients a wider array of financial products that are typically characteristic of the DeFi ecosystem, such as yield farming, staking, and liquidity provision. The challenge, however, lies in reconciling the regulated environment of traditional banking with the decentralized and open nature of blockchain networks. Banks are experimenting with ways to interact with public blockchains, exploring partnerships with blockchain projects, and developing proprietary blockchain solutions or adopting existing ones to facilitate this integration.

**Trend Towards Real World Asset Tokenization**

Concurrently, there is a notable trend in the development of projects related to the tokenization of real-world assets (RWA). This movement represents a significant step towards bridging the gap between traditional financial markets and the digital economy, offering a novel approach to asset management, investment, and ownership. Through tokenization, assets such as real estate, art, and commodities are converted into digital tokens on a blockchain, making them easily divisible, accessible, and transferrable. This democratizes access to investment opportunities, previously reserved for the wealthy or institutional investors, and streamlines the processes involved in buying, selling, and managing assets. Projects focusing on RWA tokenization are proliferating, driven by the promise of increased liquidity, transparency, and efficiency. As this trend continues to evolve, it is expected to play a crucial role in the integration of traditional financial structures with the burgeoning world of DeFi, further blurring the lines between these previously distinct domains.

## Inspiration

One of the team members, who is also an educator in cryptocurrency and DeFi, faced a major challenge in teaching these complex subjects. Throughout teaching over 3,000 students, they were constantly challenged to effectively utilize complex DeFi concepts such as collateralization, loan-to-value (LTV) ratios, and the health factor. Traditional teaching methods often proved inadequate to simply utilize the dynamic nature of DeFi markets and the practical implications of these processes.

## Problems

**Lack of User Knowledge in DeFi:** A significant barrier to the integration of DeFi within the traditional banking system is the general lack of knowledge among users about interacting with the DeFi ecosystem. For DeFi to seamlessly merge with banking services, it's crucial to develop simple, understandable, and transparent tools that can facilitate this integration. The challenge intensifies when considering projects related to tokenizing real-world assets, which aim to attract not only crypto-savvy users but also those from conventional financial backgrounds. Our clients frequently express a desire to extend their services beyond the existing DeFi ecosystem to include users unfamiliar with cryptocurrency, indicating a clear demand for bridging these worlds.

**Technical Complexities for Non-Crypto Users:** Addressing the needs of traditional users to interact with tokenized assets requires significant technical ingenuity. The current DeFi infrastructure is predominantly designed for users already familiar with cryptocurrencies and blockchain technology. To accommodate traditional users, developers face the challenge of creating interfaces and interaction mechanisms that are accessible to those without prior knowledge of cryptocurrencies, all while maintaining the security, transparency, and efficiency inherent to blockchain technology.

**Infrastructure Readiness for Banks:** For banks to start engaging with DeFi and tokenized assets, a more prepared and compatible infrastructure is necessary. The gap between the highly regulated banking environment and the decentralized nature of blockchain technology presents a considerable challenge. Our solution aims to address this by developing an application that simplifies blockchain interactions for everyday users, making cryptocurrency use intuitive, secure, and user-friendly.

## Proposed solution

Our proposed solution aims to integrate the DeFi ecosystem with traditional banking services, catering to the emerging needs of both sectors. We envision a platform that bridges the gap between sophisticated DeFi protocols and the traditional financial system, making it possible for users without prior blockchain experience to engage with tokenized real-world assets (RWA) and DeFi products. The core of our solution focuses on simplifying the complexities of DeFi for a broader audience, including non-crypto native users, while ensuring the security, transparency, and efficiency of blockchain technology.

To accomplish this, we are developing an application that leverages smart contract technology to facilitate interaction with various DeFi protocols and tokenized assets. This application will serve as a gateway for users to engage in DeFi activities, such as lending, borrowing, and investing in tokenized assets, through a user-friendly interface. The application aims to reduce the technical barriers and high transaction costs typically associated with blockchain transactions, offering a streamlined and cost-effective experience for users.

## What it does

It is both a mobile and web app designed to meet the needs of different users, from beginners to experienced investors, to simplify the interaction I have with the DeFi market.  The mobile app simultaneously serves as a crypto wallet, combining DeFi's predefined and customizable strategies into a single entity. This dual presence is done in order to give users a choice, as experienced users will predetermine to use Metamask and novices the mobile app.

The core functionality is to provide users with the ability to build sophisticated investment strategies using pre-configured components. This flexibility allows banks to offer their clients off-the-shelf components to build strategies, adhering only to interactions that comply with local laws and risk tolerance. We understand that users have different attitudes towards risk, which is why our platform is designed to accommodate a wide range of investment profiles.

Moreover, our ecosystem includes off-the-shelf strategies carefully assembled, calculated and prepared by banking professionals and investment advisors. This offers a unique value proposition by embedding DeFi's secure and simple investment capabilities into banking applications for ordinary users, eliminating the need for technical knowledge or dealing with the complexities typically associated with blockchain investments.

In essence, our ecosystem bridges the gap between traditional banking and the DeFi market by providing a safe and convenient platform for ordinary investors to explore the potential of DeFi investments without technical hurdles.

## Key Components of the Solution

Smart Contract with Multi-Call Functionality: The foundation of our platform is a smart contract designed to interact with multiple DeFi protocols in a single transaction. This multi-call functionality enables users to execute complex DeFi strategies more efficiently, reducing the gas costs associated with multiple transactions.

Backend Configuration for Trading Strategies: A robust backend system will configure and manage trading strategies, informing the smart contracts about which protocols to interact with and the parameters of these interactions.

Web and Mobile Applications: User-friendly web and mobile applications will provide access to the platform, allowing users to connect their non-custodial cryptocurrency wallets, such as MetaMask, and engage with the platform's offerings. The applications will feature intuitive interfaces to display various components of the user's strategy, making it accessible for users with limited blockchain knowledge.

Integration with Real-World Asset (RWA) Tokenization: The platform will facilitate the tokenization of real-world assets, enabling users to invest in and manage these assets through DeFi protocols. This component bridges the gap between traditional asset investment and the emerging digital asset ecosystem.

Trading Strategy Sharing and Customization: Users will have the ability to create, share, and follow investment strategies within the platform. A dedicated section for curated strategies will allow users to adopt proven strategies, with the option to incorporate specific commissions for strategy creators.

## How we built it

There were so many tasks that all specialists of the team worked in parallel in order to meet the deadline. Our strategy was to keep in constant communication with the team.

## Challenges we ran into

- It is difficult to make Multicall through Flutter

- Sepolia TestNet works terribly

## Accomplishments that we're proud of

- We have added a smart contract factory function to SIRA, so that new RWA assemblies can now be recreated and work together with SIRA.

- We were able to implement the Multicall feature through Flutter.

- We thought for a long time about which RWA assets to add to our application and realized that it is quite difficult to find quality smart contracts. That's why we used our own RWA protocol at first.

- Then we rewrote SIRA to work with our token, which is a tokenized version of the NATO ammunition. 

- Our mobile developer took the task of making a simple user experience too literally and created a mobile app with a built-in wallet. And we also wondered, what's taking him so long to work on authorization?

## What we learned

Figured out how to run SIRA contracts. 

We managed to add Fuse blockchain

Learned how to do Multicall with Flutter

## What's next for Strategic Finance

- We want to reach out to banks and fintech organizations and offer them to build such a solution into their application

- We plan to add a payment gateway

- We want to add account abstraction

- We want to add more blockchains and steps to create strategies

- Our tokens know how to work with SoulBound tokens that store people's identity information (in encrypted form), we want to teach SIRA how to work with identity through SoulBound tokens. This will also require integration with a KYC provider that will store the original data. 
