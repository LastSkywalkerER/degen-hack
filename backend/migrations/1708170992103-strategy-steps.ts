import {
  MigrationInterface,
  QueryRunner,
  Table,
  TableForeignKey,
} from 'typeorm';

export class StrategySteps1708170992103 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.createTable(
      new Table({
        name: 'StrategyStep',
        columns: [
          {
            name: 'id',
            type: 'int',
            isPrimary: true,
            isGenerated: true,
            generationStrategy: 'increment',
          },
          { name: 'title', type: 'varchar', isNullable: true },
          { name: 'address', type: 'varchar' },
          { name: 'func', type: 'varchar' },
          { name: 'icon', type: 'varchar', isNullable: true },
          { name: 'data', type: 'varchar' },
          { name: 'isPublic', type: 'boolean', isNullable: true },
          { name: 'serialNumber', type: 'decimal', isNullable: true },
          { name: 'strategyId', type: 'int' },
        ],
      }),
      true,
    );

    await queryRunner.createForeignKey(
      'StrategyStep',
      new TableForeignKey({
        columnNames: ['strategyId'],
        referencedColumnNames: ['id'],
        referencedTableName: 'Strategy',
        onDelete: 'CASCADE',
      }),
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropForeignKey(
      'StrategyStep',
      'FK_StrategyStep_Strategy',
    );
    await queryRunner.dropTable('StrategyStep', true);
  }
}
