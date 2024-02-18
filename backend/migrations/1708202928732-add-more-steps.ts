import { MigrationInterface, QueryRunner } from 'typeorm';

export class AddMoreSteps1708202928732 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
      INSERT INTO "StrategyStep" (title, address, func, icon, data, "isPublic", "serialNumber")
      VALUES
        ('Step 4', '0x94a9D9AC8a22534E3FaCa9F4e7F2E2cf85d5E4C8', 'approve(address,uint256)', 'icon1', '[{"id":1,"name":"spender", "type":"const", "value":"0x94a9D9AC8a22534E3FaCa9F4e7F2E2cf85d5E4C8"}, {"id":2,"name":"amount", "type":"userValue"}]', true, 1)
    `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
      DELETE FROM "StrategyStep"
      WHERE title IN ('Step 1', 'Step 2', 'Step 3');
    `);
  }
}
