/*
 Write a query to find the job titles and company names for all job postings that do not require any skills.
 Use the job_posting_fact, company_dim, and skills_job_dim tables.
 
 Application: Find the Job Titles and Company Names for All Job Postings that Do Not Require Any Skills
 */
SELECT
    job_postings.job_title_short,
    companies.name AS company_name
FROM
    job_postings_fact AS job_postings
    LEFT JOIN company_dim AS companies ON job_postings.company_id = companies.company_id
    LEFT JOIN skills_job_dim AS skills_to_job ON job_postings.job_id = skills_to_job.job_id
WHERE
    skills_to_job.skill_id IS NULL;