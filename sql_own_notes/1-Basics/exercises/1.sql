/*
"Get the unique (distinct) job locations in the job_posting_fact table. Order in alphabetical order
*/
SELECT DISTINCT
	job_location
FROM job_postings_fact
ORDER BY 
	job_location ASC