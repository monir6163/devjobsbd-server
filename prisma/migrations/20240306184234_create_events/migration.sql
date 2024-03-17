-- CreateTable
CREATE TABLE `Events` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `event_name` VARCHAR(255) NOT NULL,
    `event_arranged_by` VARCHAR(255) NULL,
    `event_location` VARCHAR(255) NULL,
    `event_organizer_email` VARCHAR(255) NULL,
    `event_organizer_phone` VARCHAR(11) NULL,
    `event_image` VARCHAR(255) NULL,
    `event_type` VARCHAR(255) NULL,
    `event_desc` VARCHAR(500) NULL,
    `entry_fee` INTEGER NULL,
    `event_date` TIMESTAMP(0) NULL,
    `event_time` TIMESTAMP(0) NULL,
    `event_link` VARCHAR(255) NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `Events_event_name_key`(`event_name`),
    UNIQUE INDEX `Events_event_organizer_email_key`(`event_organizer_email`),
    UNIQUE INDEX `Events_event_organizer_phone_key`(`event_organizer_phone`),
    UNIQUE INDEX `Events_event_image_key`(`event_image`),
    UNIQUE INDEX `Events_event_link_key`(`event_link`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
