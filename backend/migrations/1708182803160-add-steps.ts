import { MigrationInterface, QueryRunner } from 'typeorm';

export class AddSteps1708182803160 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
      INSERT INTO "StrategyStep" (title, address, func, icon, data, "isPublic", "serialNumber")
      VALUES
        ('Step 1', '0x6Ae43d3271ff6888e7Fc43Fd7321a503ff738951', 'borrow(address,uint256,uint256,uint16,address)', 'icon1', '[{"id":1,"name":"asset", "type":"userValue"}, {"id":2,"name":"amount", "type":"userValue"}, {"id":3,"name":"interestRateMode", "type":"const", "value":2}, {"id":4,"name":"referralCode", "type":"const", "value":0}, {"id":5,"name":"onBehalfOf", "type":"userAddress"}]', true, 1),
        ('Step 2', '0x6Ae43d3271ff6888e7Fc43Fd7321a503ff738951', 'supply(address,uint256,address,uint16)', 'icon2', '[{"id":1,"name":"asset", "type":"userValue"}, {"id":2,"name":"amount", "type":"userValue"}, {"id":3,"name":"onBehalfOf", "type":"userAddress"}, {"id":4,"name":"referralCode", "type":"const", "value":0}]', true, 1),
        ('Step 3', '0x34bD0413Da3E875D3403b5d48692715C02935F03', 'processSale(address,address,uint256)', 'icon3', '[{"id":1,"name":"saleableToken", "type":"userValue"}, {"id":2,"name":"token", "type":"userValue"}, {"id":3,"name":"amount", "type":"userValue"}]', true, 1)
    `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
      DELETE FROM "StrategyStep"
      WHERE title IN ('Step 1', 'Step 2', 'Step 3');
    `);
  }
}
