import { FieldError } from "react-hook-form";

export const errorTexts: Record<
  string,
  (params?: Record<string, string | number | undefined>) => string
> = {
  required: () => "Field required",
  maxLength: (params) => `Max length ${params?.maxLength}`,
};

export const getErrorMessage = (
  error?: FieldError,
  props?: Record<string, string | number | undefined>,
): string =>
  error
    ? errorTexts[error.message || error.type](props) || error.message || error.type || "Error"
    : "";
