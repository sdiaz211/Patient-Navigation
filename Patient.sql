USE projectdb;

CREATE TABLE IF NOT EXISTS `Patient_data` (
    `study_id` INT NOT NULL,
    `id` INT NOT NULL,
    `sex` VARCHAR(1) NOT NULL,
    `age` INT NOT NULL,
    `is_consent` VARCHAR(5) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `Patient_data` FOREIGN KEY (`study_id`) REFERENCES `Study_data` (`id`)
);
INSERT INTO `Patient_data` VALUES (66,78503,'M',32,'True'),
	(66,47298,'F',87,'True'),
	(66,56274,'F',88,'False'),
	(66,19644,'F',0,'False'),
	(66,29895,'M',91,'True'),
	(28,20195,'M',30,'True'),
	(28,52127,'F',38,'True'),
	(28,68930,'F',36,'True'),
	(28,83664,'M',91,'False'),
	(28,52432,'F',2,'False'),
	(28,11143,'M',59,'True'),
	(28,26477,'F',12,'False'),
	(28,95169,'M',55,'True'),
	(28,59999,'F',36,'False'),
	(28,88087,'M',64,'True'),
	(28,11850,'F',13,'False'),
	(4,62906,'F',26,'True'),
	(4,46241,'F',66,'True'),
	(4,83648,'F',90,'False'),
	(4,67700,'M',78,'True'),
	(4,51260,'F',11,'False'),
	(4,10763,'F',98,'True');
