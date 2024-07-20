/*
 Write a query to list all job  postings along with their corresponding company names and the total number of required skills. 
 Use the job_posting_fact, company_dim, and skills_job_dim tables.
 
 Application: List All Job Postings Along with Their Corresponding Company Names and the Total Number of Required Skills
 */
SELECT
    job_postings.job_id,
    job_postings.job_title,
    companies.name AS company_name,
    COUNT(skills_to_job.skill_id) AS total_skills
FROM
    job_postings_fact AS job_postings
    LEFT JOIN company_dim AS companies ON job_postings.company_id = companies.company_id
    LEFT JOIN skills_job_dim AS skills_to_job ON job_postings.job_id = skills_to_job.job_id
GROUP BY
    job_postings.job_title,
    companies.name