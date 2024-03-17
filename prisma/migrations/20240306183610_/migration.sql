/*
  Warnings:

  - A unique constraint covering the columns `[company_logo]` on the table `Companies` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `companies` ADD COLUMN `company_logo` VARCHAR(255) NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Companies_company_logo_key` ON `Companies`(`company_logo`);
