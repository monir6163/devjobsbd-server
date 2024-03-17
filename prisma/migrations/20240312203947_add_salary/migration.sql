/*
  Warnings:

  - Made the column `workType` on table `companies` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `companies` ADD COLUMN `salaryRange` VARCHAR(255) NULL,
    MODIFY `hireFreshers` BOOLEAN NULL DEFAULT false,
    MODIFY `hireInterns` BOOLEAN NULL DEFAULT false,
    MODIFY `workType` VARCHAR(255) NOT NULL;

-- AlterTable
ALTER TABLE `primarytechstack` MODIFY `techStack` VARCHAR(255) NULL;
