/*
 Write a query to retrieve job titles, company names, and the count of unique skills for job postings in each location. Use the job_posting_fact, company_dim, and skills_job_dim tables.
 Application: Retrieve Job Titles, Company Names, and the Count of Unique Skills for Job Postings in Each Location:
 */
SELECT
    job_postings.job_title_short,
    companies.name AS company_name,
    job_postings.job_location,
    COUNT(DISTINCT skills_to_job.skill_id) AS unique_skills_count
FROM
    job_postings_fact AS job_postings
    LEFT JOIN company_dim AS companies ON job_postings.company_id = companies.company_id
    LEFT JOIN skills_job_dim AS skills_to_job ON job_postings.job_id = skills_to_job.job_id
GROUP BY
    job_postings.job_title_short,
    companies.name,
    job_postings.job_location;