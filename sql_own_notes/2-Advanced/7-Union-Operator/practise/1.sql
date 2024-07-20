/*
 Find jobs from the first quater that have a salary greater than 70k
 - Combine job posting tables from the first quater of 2023 (January, February, March)
 - Gets job postings with average salary greater than 70k
 */
SELECT
  quarter_jobs.job_title_short,
  quarter_jobs.job_location,
  quarter_jobs.job_via,
  quarter_jobs.job_posted_date:: DATE,
  quarter_jobs.salary_year_avg
FROM
  (
    SELECT
      *
    FROM
      january_jobs
    UNION ALL
    SELECT
      *
    FROM
      february_jobs
    UNION ALL
    SELECT
      *
    FROM
      march_jobs
  ) AS quarter_jobs
WHERE
  quarter_jobs.salary_year_avg > 70000
  AND quarter_jobs.job_title_short LIKE '%Data%Analyst%'
ORDER BY
  quarter_jobs.salary_year_avg DESC;