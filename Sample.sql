USE projectdb;

CREATE TABLE IF NOT EXISTS `Sample_data` (
    `study_id` INT NOT NULL,
    `patient_id` INT NOT NULL,
    `id` INT NOT NULL,
    `material` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT FOREIGN KEY (`study_id`) REFERENCES `Study_data` (`id`),
    CONSTRAINT FOREIGN KEY (`patient_id`) REFERENCES `Patient_data` (`id`)
);
INSERT INTO `Sample_data` VALUES (66,47298,12130,'stool'),
	(66,56274,56254,'stool'),
	(66,19644,45477,'stool'),
	(66,29895,65349,'stool'),
	(28,52127,94301,'stool'),
	(28,68930,21100,'stool'),
	(28,83664,53207,'stool'),
	(28,52432,43441,'stool'),
	(28,11143,29792,'stool'),
	(28,26477,93328,'stool'),
	(28,95169,50685,'stool'),
	(28,59999,33591,'stool'),
	(28,88087,43283,'stool'),
	(28,11850,22714,'stool'),
	(4,46241,73337,'stool'),
	(4,83648,31508,'stool'),
	(4,67700,62492,'stool'),
	(4,51260,55253,'stool'),
	(4,10763,82748,'stool');
