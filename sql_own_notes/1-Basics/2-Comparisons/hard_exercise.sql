/*
 Get the job details for BOTH 'Data Analyst' or 'Business Analyst' positions
 - For Data Analyst I want jobs only > $100k
 - For Business Analyst I want jobs only > $70k
 Only include jobs located in eitehr
 - Boston, MA
 - Anywhere
 */
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg,
    job_schedule_type
FROM
    job_postings_fact
WHERE
    job_location IN('Boston, MA', 'Anywhere')
    AND (
        (
            job_title_short = 'Data Analyst'
            AND salary_year_avg > 100000
        )
        OR (
            job_title_short = 'Business Analyst'
            AND salary_year_avg > 70000
        )
    )