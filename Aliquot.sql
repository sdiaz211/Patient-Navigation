USE projectdb;

CREATE TABLE IF NOT EXISTS `Aliquot_data` (
    `sample_id` INT NOT NULL,
    `id` INT NOT NULL,
    `material` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT FOREIGN KEY (`sample_id`) REFERENCES `Sample_data` (`id`)
);
INSERT INTO `Aliquot_data` VALUES (12130,26697,'stool'),
	(56254,88647,'stool'),
	(45477,62034,'stool'),
	(65349,23162,'stool'),
	(94301,50837,'stool'),
	(21100,93972,'stool'),
	(53207,62750,'stool'),
	(43441,52249,'stool'),
	(29792,45148,'stool'),
	(93328,87693,'stool'),
	(50685,38165,'stool'),
	(33591,98306,'stool'),
	(43283,40575,'stool'),
	(22714,88076,'stool'),
	(73337,60164,'stool'),
	(31508,57524,'stool'),
	(62492,88029,'stool'),
	(55253,47243,'stool'),
	(82748,28458,'stool');
