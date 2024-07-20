/*
    In the job_posting_fact table get the columns job_id, job_title_short, job_location, job_via, and salary_year_avg columns. And only look at the rows where the job_title_short is 'Data Engineer'
*/

SELECT
	job_location,
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM job_postings_fact
WHERE 
	job_title_short = 'Data Engineer'
    AND
    job_location != ''
ORDER BY 
	job_location ASC