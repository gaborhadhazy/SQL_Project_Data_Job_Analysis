/*
 Write a query to find the job_location with the highest average salary_year_avg. The result should include the job location, the average salary, and the count of job postings for that location.
 Application: Average Salary and Count of Job Postings by Location with Highest Average Salary
 */
SELECT
    job_location,
    AVG(salary_year_avg) AS avg_salary,
    COUNT(*) AS job_count
FROM
    job_postings_fact
GROUP BY
    job_location
ORDER BY
    avg_salary DESC
LIMIT
    1;