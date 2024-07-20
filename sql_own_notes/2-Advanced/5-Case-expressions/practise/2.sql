/*
 Write a query to classify job postings based on the experience_level column. If the experience level is 'Entry Level', classify it as 'Beginner'. If it is 'Mid Level', classify it as 'Intermediate'. If it is 'Senior Level', classify it as 'Advanced'. Return the count of job postings in each experience level category.
 */
SELECT
    COUNT(job_id) AS job_count,
    CASE
        WHEN job_schedule_type LIKE '%Full-time%' THEN 'FT'
        WHEN job_schedule_type LIKE '%Part-time%' THEN 'PT'
        WHEN job_schedule_type LIKE '%Contractor%' THEN 'CT'
        ELSE 'Other'
    END AS job_type
FROM
    job_postings_fact
GROUP BY
    job_type