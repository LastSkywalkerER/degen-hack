import { IsNotEmpty } from 'class-validator';

export class StepDto {
  @IsNotEmpty()
  id: number;

  @IsNotEmpty()
  address: string;

  title: string;

  @IsNotEmpty()
  func: string;

  @IsNotEmpty()
  data: {
    id: number;
    name: string;
    value: string;
  }[];
}
