/*
  Warnings:

  - You are about to drop the column `company_email` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `company_employee` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `company_location` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `company_logo` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `company_name` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `company_started` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `company_website` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `facebook_link` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `job_apply_link` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `job_description` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `job_experience` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `job_location` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `job_type` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `linkedin_link` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `skills` on the `companies` table. All the data in the column will be lost.
  - You are about to drop the column `companiesId` on the `users` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[companyEmail]` on the table `Companies` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `companyDescription` to the `Companies` table without a default value. This is not possible if the table is not empty.
  - Added the required column `companyName` to the `Companies` table without a default value. This is not possible if the table is not empty.
  - Added the required column `companyUrl` to the `Companies` table without a default value. This is not possible if the table is not empty.
  - Added the required column `currentHiringRole` to the `Companies` table without a default value. This is not possible if the table is not empty.
  - Added the required column `established` to the `Companies` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hireFreshers` to the `Companies` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hireInterns` to the `Companies` table without a default value. This is not possible if the table is not empty.
  - Added the required column `officeLocation` to the `Companies` table without a default value. This is not possible if the table is not empty.
  - Added the required column `totalEmployees` to the `Companies` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `users` DROP FOREIGN KEY `Users_companiesId_fkey`;

-- DropIndex
DROP INDEX `Companies_company_email_key` ON `companies`;

-- DropIndex
DROP INDEX `Companies_company_name_key` ON `companies`;

-- DropIndex
DROP INDEX `Users_user_image_key` ON `users`;

-- AlterTable
ALTER TABLE `companies` DROP COLUMN `company_email`,
    DROP COLUMN `company_employee`,
    DROP COLUMN `company_location`,
    DROP COLUMN `company_logo`,
    DROP COLUMN `company_name`,
    DROP COLUMN `company_started`,
    DROP COLUMN `company_website`,
    DROP COLUMN `facebook_link`,
    DROP COLUMN `job_apply_link`,
    DROP COLUMN `job_description`,
    DROP COLUMN `job_experience`,
    DROP COLUMN `job_location`,
    DROP COLUMN `job_type`,
    DROP COLUMN `linkedin_link`,
    DROP COLUMN `skills`,
    ADD COLUMN `companyCareersUrl` VARCHAR(191) NULL,
    ADD COLUMN `companyDescription` VARCHAR(191) NOT NULL,
    ADD COLUMN `companyEmail` VARCHAR(191) NULL,
    ADD COLUMN `companyFacebook` VARCHAR(191) NULL,
    ADD COLUMN `companyLinkedin` VARCHAR(191) NULL,
    ADD COLUMN `companyLogo` VARCHAR(191) NULL,
    ADD COLUMN `companyName` VARCHAR(191) NOT NULL,
    ADD COLUMN `companyUrl` VARCHAR(191) NOT NULL,
    ADD COLUMN `currentHiringRole` VARCHAR(191) NOT NULL,
    ADD COLUMN `established` VARCHAR(191) NOT NULL,
    ADD COLUMN `hireFreshers` BOOLEAN NOT NULL,
    ADD COLUMN `hireInterns` BOOLEAN NOT NULL,
    ADD COLUMN `officeLocation` VARCHAR(191) NOT NULL,
    ADD COLUMN `totalEmployees` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `users` DROP COLUMN `companiesId`,
    MODIFY `user_role` VARCHAR(255) NULL DEFAULT 'User';

-- CreateTable
CREATE TABLE `workType` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `workType` VARCHAR(255) NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `companiesId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `primaryTechStack` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `techStack` VARCHAR(255) NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `companiesId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Companies_companyEmail_key` ON `Companies`(`companyEmail`);

-- AddForeignKey
ALTER TABLE `workType` ADD CONSTRAINT `workType_companiesId_fkey` FOREIGN KEY (`companiesId`) REFERENCES `Companies`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `primaryTechStack` ADD CONSTRAINT `primaryTechStack_companiesId_fkey` FOREIGN KEY (`companiesId`) REFERENCES `Companies`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
