import { MigrationInterface, QueryRunner } from 'typeorm';

export class AddStrategy1708194487088 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
          INSERT INTO "Strategy" (title, "isPublic", "isActive")
          VALUES
            ('Strategy 1', true, false),
            ('Strategy 2', true, false),
            ('Strategy 3', true, false),
            ('Strategy 4', true, false),
            ('Strategy 5', true, false),
            ('Strategy 6', true, false)
        `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
          DELETE FROM "Strategy"
          WHERE title IN ('Strategy 1', 'Strategy 2', 'Strategy 3');
        `);
  }
}
