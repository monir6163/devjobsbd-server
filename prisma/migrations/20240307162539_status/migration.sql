/*
  Warnings:

  - You are about to alter the column `status` on the `companies` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `Int`.

*/
-- AlterTable
ALTER TABLE `companies` MODIFY `status` INTEGER NULL DEFAULT 0;
