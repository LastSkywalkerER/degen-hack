import { FC, useState } from "react";
import { Helmet } from "react-helmet";

export interface ComponentHelmetProps {
  setHelmetTitle?: (title: string) => void;
}

export interface HelmetOptions {
  title?: string;
  openGraphTitle?: string;
  openGraphDescription?: string;
  description?: string;
  image?: string;
  author?: string;
  keywords?: string;
  url?: string;
  favicon?: string;
}

export const withHelmet =
  <T extends Record<string, string>>(Component: FC<T>) =>
  (options: HelmetOptions = {}): FC<T> =>
  (props: T) => {
    const {
      description,
      image,
      openGraphTitle,
      openGraphDescription,
      author,
      keywords,
      url,
      favicon,
    } = options;
    const [title, setTitle] = useState(options.title);

    return (
      <>
        <Helmet>
          {favicon && <link rel="icon" href={favicon} />}
          {author && <meta name="author" content={author} />}

          {title && <title>{title}</title>}
          {openGraphTitle && <meta property="og:title" content={openGraphTitle} />}

          <meta name="twitter:card" content="summary_large_image" />

          {description && <meta name="description" content={description} />}
          {openGraphDescription && <meta name="og:description" content={openGraphDescription} />}

          {image && <meta property="og:image" content={image} />}
          {image && <meta property="og:image:width" content="968" />}
          {image && <meta property="og:image:height" content="544" />}
          {image && <meta property="twitter:image" content={image} />}

          {keywords && <meta name="keywords" content={keywords} />}
          {title && <meta property="og:site_name" content={title} />}
          {url && <meta property="og:url" content={url} />}

          {/* <meta name="viewport" content="width=device-width, initial-scale=1" />
          <meta name="theme-color" content="#000000" />
          <meta name="msapplication-TileColor" content="#da532c" />

          <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />
          <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png" />
          <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png" />
          <link rel="manifest" href="/site.webmanifest" />
          <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5" />

          <link href="https://fonts.googleapis.com/css?family=Press Start 2P" rel="stylesheet" />
          <link href="https://fonts.googleapis.com/css?family=VT323" rel="stylesheet" />

          <link rel="manifest" href="%PUBLIC_URL%/manifest.json" /> */}
        </Helmet>
        <Component {...props} setHelmetTitle={setTitle} />
      </>
    );
  };
