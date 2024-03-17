/*
  Warnings:

  - You are about to drop the column `workType` on the `companies` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `companies` DROP COLUMN `workType`;

-- CreateTable
CREATE TABLE `workType` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `workType` VARCHAR(255) NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `companiesId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `workType` ADD CONSTRAINT `workType_companiesId_fkey` FOREIGN KEY (`companiesId`) REFERENCES `Companies`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
