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
    type: DataType;
    name: string;
    value: string;
  }[];
}

enum DataType {
  userValue = 'userValue',
  const = 'const',
  userAddress = 'userAddress',
}
