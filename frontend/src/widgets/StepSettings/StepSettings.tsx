import { FC, useState } from "react";
import { Card, TextField } from "@mui/material";
import { Controller, useForm } from "react-hook-form";
import Button from "@mui/material/Button";
import Box from "@mui/material/Box";
import { AggregateArgs } from "@shared/services/web3/web3.service.ts";
import { UIArg } from "@entities/index.ts";
import { MultiInput } from "@features/MultiInput/MultiInput.tsx";

export const StepSettings: FC<{
  defaultValues: AggregateArgs;
  onSubmit: (data: AggregateArgs) => void;
}> = ({ defaultValues, onSubmit: handleOnSubmit }) => {
  const { handleSubmit, register, control } = useForm<AggregateArgs>({ defaultValues });
  const [inputs] = useState<UIArg[]>(defaultValues.args);

  const onSubmit = (data: AggregateArgs) => {
    console.log({ formData: [data] });

    handleOnSubmit(data);
  };

  const genInput = (name: keyof AggregateArgs) => (
    <TextField label={name} variant="outlined" {...register(name)} />
  );

  // const addInput = () => {
  //   setInputs((state) => [
  //     ...state,
  //     {
  //       id: String(state.length),
  //       name: String(state.length),
  //       value: "",
  //     },
  //   ]);
  // };

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <Card sx={{ padding: 2, display: "flex", flexDirection: "column", gap: 2 }}>
        {genInput("to")}
        {genInput("value")}
        {genInput("func")}
        <Controller
          render={({ field }) => <MultiInput inputs={inputs} {...field} />}
          name={"args"}
          control={control}
        />
        <Box sx={{ display: "flex", justifyContent: "flex-end" }}>
          <Button variant="contained" type={"submit"}>
            Add
          </Button>
        </Box>
      </Card>
    </form>
  );
};
