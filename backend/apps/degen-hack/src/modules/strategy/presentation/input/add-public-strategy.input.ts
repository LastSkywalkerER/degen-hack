import { IsNotEmpty } from 'class-validator';

import { StepDto } from './step.dto';

export class AddPublicStrategyDto {
  @IsNotEmpty()
  title: string;

  steps: StepDto[];
}
