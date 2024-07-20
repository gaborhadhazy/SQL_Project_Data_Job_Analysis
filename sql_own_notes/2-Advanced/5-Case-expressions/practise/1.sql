/*
 Question:  Write a query to classify job postings based on the average yearly salary (salary_year_avg). If the salary is greater than $100,000, classify it as 'High Salary'. If the salary is between $50,000 and $100,000, classify it as 'Medium Salary'. Otherwise, classify it as 'Low Salary'. Return the count of job postings in each salary category.
 */
SELECT
    COUNT(job_id) AS job_count,
    CASE
        WHEN salary_year_avg > 100000 THEN 'High Salary'
        WHEN salary_year_avg BETWEEN 50000
        AND 100000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM
    job_postings_fact
GROUP BY
    salary_category