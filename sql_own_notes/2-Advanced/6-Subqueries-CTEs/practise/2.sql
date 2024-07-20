/*
 Retrieve the names of companies that have more than 10 job postings. Use a subquery in the WHERE clause to filter companies based on the job postings count.
 */
SELECT
    company_dim.name AS company_name,
    CASE
        WHEN job_postings_count < 10 THEN 'Small'
        WHEN job_postings_count BETWEEN 10
        AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS size_category
FROM
    (
        SELECT
            company_id,
            COUNT(*) AS job_postings_count
        FROM
            job_postings_fact
        GROUP BY
            company_id
    ) AS company_job_counts
    JOIN company_dim ON company_dim.company_id = company_job_counts.company_id;