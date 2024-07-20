/*
 Write a query to find the top 5 job_title_short with the highest average salary_year_avg, but only if they have more than 50 job postings. The result should include the job title, the average salary, and the count of job postings.
 
 Appplication: Top 5 Job Titles with Highest Average Salary and More Than 50 Postings:
 */
SELECT
    job_title_short,
    AVG(salary_year_avg) AS avg_salary,
    COUNT(*) AS job_postings
FROM
    job_postings_fact
GROUP BY
    job_title_short
HAVING
    job_postings >= 50
ORDER BY
    avg_salary DESC
LIMIT
    5;