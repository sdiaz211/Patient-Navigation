USE projectdb;

CREATE TABLE IF NOT EXISTS `Study_data` (
    `id` INT NOT NULL,
    `researcher` VARCHAR(50) NOT NULL UNIQUE KEY,
    `num_target_patients` INT NOT NULL,
    `num_recorded_patients` INT NOT NULL,
    `num_target_samples` INT NOT NULL,
    `num_samples_collected` INT NOT NULL,
    PRIMARY KEY (`id`),
    CHECK (`num_recorded_patients` <= `num_target_patients`),
    CHECK (`num_samples_collected` <= `num_target_samples`)
);
INSERT INTO `Study_data` VALUES (66,'Ross',7,5,12,4),
	(28,'Brown',12,11,22,10),
	(4,'Nguyen',18,6,30,5);
