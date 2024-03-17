/*
  Warnings:

  - You are about to drop the `worktype` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[companyUrl]` on the table `Companies` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `worktype` DROP FOREIGN KEY `workType_companiesId_fkey`;

-- AlterTable
ALTER TABLE `companies` ADD COLUMN `workType` VARCHAR(255) NULL,
    MODIFY `companyCareersUrl` VARCHAR(255) NULL,
    MODIFY `companyDescription` VARCHAR(500) NULL,
    MODIFY `companyEmail` VARCHAR(255) NULL,
    MODIFY `companyFacebook` VARCHAR(255) NULL,
    MODIFY `companyLinkedin` VARCHAR(255) NULL,
    MODIFY `companyLogo` VARCHAR(255) NULL,
    MODIFY `companyName` VARCHAR(255) NOT NULL,
    MODIFY `companyUrl` VARCHAR(255) NOT NULL,
    MODIFY `currentHiringRole` VARCHAR(255) NULL,
    MODIFY `established` VARCHAR(255) NULL,
    MODIFY `officeLocation` VARCHAR(255) NULL,
    MODIFY `totalEmployees` VARCHAR(255) NULL;

-- DropTable
DROP TABLE `worktype`;

-- CreateIndex
CREATE UNIQUE INDEX `Companies_companyUrl_key` ON `Companies`(`companyUrl`);
