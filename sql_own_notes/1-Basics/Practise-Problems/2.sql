/*
 Look for non-senior data analyst or business analyst roles
 - Only get job titles that include either Data or Business
 - Also include those with Analyst in any part of the title
 - Dont include any job titles with Senior followed by any character
 */
SELECT
    job_title_short AS title,
    job_location AS location,
    salary_year_avg AS salary
FROM
    job_postings_fact
WHERE
    (
        job_title LIKE '%Data%'
        OR job_title LIKE '%Business%'
    )
    AND job_title LIKE '%Analyst%'
    AND job_title NOT LIKE '%Senior%'