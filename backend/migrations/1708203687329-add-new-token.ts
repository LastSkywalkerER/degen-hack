import { MigrationInterface, QueryRunner } from 'typeorm';

export class AddNewToken1708203687329 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    const tokenData = [
      {
        name: 'M855',
        logo: 'https://purple-eldest-crayfish-220.mypinata.cloud/ipfs/QmZQDUtnCAaYtPAZiVFpbhfZkYEtacKJkctS73HREb33vG/gho.png',
        address: '0xcf70b01F810cC997E04a61Cac915ef2821062b69',
      },
    ];

    for (const token of tokenData) {
      await queryRunner.query(
        'INSERT INTO "Tokens" ("name", "logo", "address") VALUES ($1, $2, $3)',
        [token.name, token.logo, token.address.toLowerCase()],
      );
    }
  }

  public async down(): Promise<void> {}
}
