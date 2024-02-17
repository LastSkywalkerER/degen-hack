import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

import { StrategyStepEntity } from './strategy-step.entity';

@Entity('Strategy')
export class StrategyEntity {
  @PrimaryGeneratedColumn()
  readonly id: number;

  @Column({ type: 'varchar', name: 'title' })
  title: string;

  @Column({ type: 'varchar', name: 'userId', nullable: true })
  userId?: string;

  @Column({ type: 'boolean', name: 'isPublic' })
  isPublic: true | false;

  @Column({ type: 'boolean', name: 'isActive', nullable: true })
  isActive?: true | false;

  @OneToMany(() => StrategyStepEntity, (step) => step.strategy)
  steps: StrategyStepEntity[];
}
