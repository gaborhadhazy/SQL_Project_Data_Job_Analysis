/*
 Write a query to calculate the total sum of salary_year_avg for job titles containing the word 'Manager' (job_title_short LIKE '%Manager%') for each job_location 
 that has more than 5 such job postings. The result should include the job location and the total sum of salaries.
 */
SELECT
    job_location,
    SUM(salary_year_avg) as total_salary
FROM
    job_postings_fact
WHERE
    job_title_short LIKE '%Data%'
GROUP BY
    job_location
HAVING
    COUNT(*) > 5