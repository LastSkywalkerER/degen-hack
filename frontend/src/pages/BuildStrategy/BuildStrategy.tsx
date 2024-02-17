import { FC, SyntheticEvent, useState } from "react";

import Container from "@mui/material/Container";
import { Card, TextField } from "@mui/material";
import { Controller, useForm } from "react-hook-form";
import Button from "@mui/material/Button";
import Box from "@mui/material/Box";
import { buildStrategyHelmet } from "@shared/helmets/main.ts";
import { withHelmet } from "@shared/hocs";
import { AggregateArgs, useWeb3 } from "@shared/services/web3/web3.service.ts";

export interface MultiInputProps {
  name: string;
  id: string;
  value: string;
}

const MultiInput: FC<{
  inputs: MultiInputProps[];

  value?: MultiInputProps[];
  onChange: (args: MultiInputProps[]) => void;
}> = ({ value, inputs, onChange }) => {
  const handleChangeSingleInput =
    (id: string) => (e: SyntheticEvent<HTMLTextAreaElement | HTMLInputElement>) => {
      const newValue = inputs.map((oldValue, index) => {
        if (oldValue.id !== id) return value ? value[index] : oldValue;

        return {
          ...(value ? value[index] : oldValue),
          value: e.currentTarget.value,
        };
      });

      onChange(newValue);
    };

  return inputs.map(({ name, id }) => (
    <TextField
      key={id}
      label={name}
      variant="outlined"
      value={value?.find((value) => value.id === id)?.value}
      onChange={handleChangeSingleInput(id)}
    />
  ));
};

const BuildStrategy: FC = () => {
  const { handleSubmit, register, control } = useForm<AggregateArgs>();
  const { tryAggregate } = useWeb3();
  const [inputs, setInputs] = useState<MultiInputProps[]>([
    {
      id: "0",
      name: "0",
      value: "",
    },
  ]);

  const onSubmit = (data: AggregateArgs) => {
    console.log({ formData: [data] });
    tryAggregate([data]);
  };

  const genInput = (name: keyof AggregateArgs) => (
    <TextField label={name} variant="outlined" {...register(name)} />
  );

  const addInput = () => {
    setInputs((state) => [
      ...state,
      {
        id: String(state.length),
        name: String(state.length),
        value: "",
      },
    ]);
  };

  return (
    <Container
      sx={{
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        justifyContent: "center",
      }}
    >
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
          <Box sx={{ display: "flex", justifyContent: "space-between" }}>
            <Button variant="outlined" onClick={addInput}>
              add
            </Button>
            <Button variant="contained" type={"submit"}>
              Send
            </Button>
          </Box>
        </Card>
      </form>
    </Container>
  );
};

export default withHelmet(BuildStrategy)(buildStrategyHelmet);
