/*
 Write a query to calculate the total sum of salary_year_avg for each job_title_short that has at least 10 job postings. The result should include the job title and the total sum of salaries.
 
 Application: Calculate the Total Salary Sum for Each Job Title with a Minimum of 10 Job Postings
 */
SELECT
    job_title_short,
    SUM(salary_year_avg) AS total_salary_sum
FROM
    job_postings_fact
GROUP BY
    job_title_short
HAVING
    COUNT(*) >= 10;