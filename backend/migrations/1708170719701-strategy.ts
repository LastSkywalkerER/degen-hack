import { MigrationInterface, QueryRunner, Table } from 'typeorm';

export class Strategy1708170719701 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.createTable(
      new Table({
        name: 'Strategy',
        columns: [
          {
            name: 'id',
            type: 'int',
            isPrimary: true,
            isGenerated: true,
            generationStrategy: 'increment',
          },
          { name: 'title', type: 'varchar' },
          { name: 'userId', type: 'varchar', isNullable: true },
          { name: 'isPublic', type: 'boolean' },
          { name: 'isActive', type: 'boolean', isNullable: true },
        ],
      }),
      true,
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable('Strategy', true);
  }
}
