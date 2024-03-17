/*
  Warnings:

  - You are about to drop the column `currentHiringRole` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `hireFreshers` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `hireInterns` on the `companies` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `companies` DROP COLUMN `currentHiringRole`,
    DROP COLUMN `hireFreshers`,
    DROP COLUMN `hireInterns`;

-- CreateTable
CREATE TABLE `hireInternsandFreshers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `hireType` VARCHAR(255) NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `companiesId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `currentHiringRole` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `hiringRole` VARCHAR(255) NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `companiesId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `hireInternsandFreshers` ADD CONSTRAINT `hireInternsandFreshers_companiesId_fkey` FOREIGN KEY (`companiesId`) REFERENCES `Companies`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `currentHiringRole` ADD CONSTRAINT `currentHiringRole_companiesId_fkey` FOREIGN KEY (`companiesId`) REFERENCES `Companies`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
