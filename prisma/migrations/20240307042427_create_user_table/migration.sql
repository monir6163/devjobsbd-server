-- DropIndex
DROP INDEX `Companies_company_logo_key` ON `companies`;

-- DropIndex
DROP INDEX `Companies_company_started_key` ON `companies`;

-- DropIndex
DROP INDEX `Companies_company_website_key` ON `companies`;

-- DropIndex
DROP INDEX `Companies_facebook_link_key` ON `companies`;

-- DropIndex
DROP INDEX `Companies_job_apply_link_key` ON `companies`;

-- DropIndex
DROP INDEX `Companies_linkedin_link_key` ON `companies`;

-- DropIndex
DROP INDEX `Events_event_image_key` ON `events`;

-- DropIndex
DROP INDEX `Events_event_link_key` ON `events`;

-- DropIndex
DROP INDEX `Events_event_name_key` ON `events`;

-- AlterTable
ALTER TABLE `companies` ADD COLUMN `status` VARCHAR(255) NULL DEFAULT 'Pending';

-- CreateTable
CREATE TABLE `Users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_name` VARCHAR(255) NULL,
    `user_email` VARCHAR(255) NOT NULL,
    `user_password` VARCHAR(255) NOT NULL,
    `user_phone` VARCHAR(11) NULL,
    `user_image` VARCHAR(255) NULL,
    `user_role` VARCHAR(255) NULL,
    `user_bio` VARCHAR(500) NULL,
    `user_location` VARCHAR(255) NULL,
    `user_skills` VARCHAR(500) NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `companiesId` INTEGER NULL,
    `eventsId` INTEGER NULL,

    UNIQUE INDEX `Users_user_name_key`(`user_name`),
    UNIQUE INDEX `Users_user_email_key`(`user_email`),
    UNIQUE INDEX `Users_user_phone_key`(`user_phone`),
    UNIQUE INDEX `Users_user_image_key`(`user_image`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Users` ADD CONSTRAINT `Users_companiesId_fkey` FOREIGN KEY (`companiesId`) REFERENCES `Companies`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Users` ADD CONSTRAINT `Users_eventsId_fkey` FOREIGN KEY (`eventsId`) REFERENCES `Events`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
