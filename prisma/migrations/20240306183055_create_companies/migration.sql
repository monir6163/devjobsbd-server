-- CreateTable
CREATE TABLE `Companies` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `company_name` VARCHAR(255) NOT NULL,
    `company_location` VARCHAR(255) NULL,
    `company_started` VARCHAR(255) NULL,
    `company_employee` INTEGER NULL,
    `company_email` VARCHAR(255) NULL,
    `company_website` VARCHAR(255) NULL,
    `job_apply_link` VARCHAR(255) NULL,
    `facebook_link` VARCHAR(255) NULL,
    `linkedin_link` VARCHAR(255) NULL,
    `skills` VARCHAR(500) NULL,
    `job_description` VARCHAR(500) NULL,
    `job_type` ENUM('Full_Time', 'Part_Time', 'Internship', 'Contract', 'Freelance') NOT NULL,
    `job_location` ENUM('Remote', 'Onsite', 'Hybrid') NOT NULL,
    `job_experience` ENUM('Fresher', 'Intern', 'Mid_Level', 'Senior_Level', 'Director', 'Executive') NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Companies_company_name_key`(`company_name`),
    UNIQUE INDEX `Companies_company_started_key`(`company_started`),
    UNIQUE INDEX `Companies_company_email_key`(`company_email`),
    UNIQUE INDEX `Companies_company_website_key`(`company_website`),
    UNIQUE INDEX `Companies_job_apply_link_key`(`job_apply_link`),
    UNIQUE INDEX `Companies_facebook_link_key`(`facebook_link`),
    UNIQUE INDEX `Companies_linkedin_link_key`(`linkedin_link`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
