import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import "./app/index.css";
import { Index } from "./app";
import reportWebVitals from "./reportWebVitals";

// eslint-disable-next-line import/no-named-as-default-member
const root = createRoot(document.getElementById("root") as HTMLElement);

root.render(
  <StrictMode>
    <Index />
  </StrictMode>,
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
