import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

import { StrategyEntity } from './strategy.entity';

@Entity('StrategyStep')
export class StrategyStepEntity {
  @PrimaryGeneratedColumn()
  readonly id: number;

  @Column({ type: 'varchar', name: 'title', nullable: true })
  title?: string;

  @Column({ type: 'varchar', name: 'address' })
  address: string;

  @Column({ type: 'varchar', name: 'func' })
  func: string;

  @Column({ type: 'varchar', name: 'icon', nullable: true })
  icon?: string;

  @Column({ type: 'varchar', name: 'data' })
  data: string;

  @Column({ type: 'boolean', name: 'isPublic', nullable: true })
  isPublic?: true | false;

  @Column({ type: 'decimal', name: 'serialNumber', nullable: true })
  serialNumber?: number;

  @ManyToOne(() => StrategyEntity, (strategy) => strategy.steps)
  @JoinColumn({ name: 'strategyId' })
  strategy: StrategyEntity | null;
}
