USE projectdb;

CREATE TABLE IF NOT EXISTS `Study_2`(
SELECT *
FROM(
SELECT
	p.study_id, p.age, second_combined.data, second_combined.type
FROM(
SELECT
	s.study_id, s.patient_id, first_combined.data, first_combined.type
FROM
(SELECT 
	t.aliquot_id, a.sample_id, t.type, t.data
FROM test_data t 
JOIN aliquot_data a on t.aliquot_id = a.id) first_combined
JOIN sample_data s on first_combined.sample_id = s.id) second_combined
JOIN patient_data p on second_combined.patient_id = p.id) final_table
WHERE final_table.study_id = 28)
ORDER BY age ASC