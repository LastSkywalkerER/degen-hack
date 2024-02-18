import { FC, SyntheticEvent } from "react";
import { TextField } from "@mui/material";
import { UIArg } from "@entities/index.ts";

export const MultiInput: FC<{
  inputs: UIArg[];

  value?: UIArg[];
  onChange: (args: UIArg[]) => void;
}> = ({ value, inputs, onChange }) => {
  const handleChangeSingleInput =
    (id: number) => (e: SyntheticEvent<HTMLTextAreaElement | HTMLInputElement>) => {
      const newValue = inputs.map((oldValue, index) => {
        if (oldValue.id !== id) return value ? value[index] : oldValue;

        return {
          ...(value ? value[index] : oldValue),
          value: e.currentTarget.value,
        };
      });

      onChange(newValue);
    };

  return inputs
    .filter(({ type }) => type === "userValue")
    .map(({ name, id }) => (
      <TextField
        key={id}
        label={name}
        variant="outlined"
        value={value?.find((value) => value.id === id)?.value}
        onChange={handleChangeSingleInput(id)}
      />
    ));
};
