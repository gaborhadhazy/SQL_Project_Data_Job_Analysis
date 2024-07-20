/*
 Write a query to fetch all job postings, including their titles and the names of the skills required, 
 even if no skills are listed for a job. Ensure that the job is located in New York and offers
 health insurance. Use the job_posting_fact, skill_job_dim, and skills_dim tables.
 
 Application: Fetch All Job Postings, Including Their Titles and the Names of the Skills Required, Even If No Skills Are Listed for a Job
 */
SELECT
    job_postings.job_title,
    skills.skills AS skill
FROM
    job_postings_fact AS job_postings
    LEFT JOIN skills_job_dim AS skills_to_job ON job_postings.job_id = skills_to_job.job_id
    LEFT JOIN skills_dim AS skills ON skills_to_job.skill_id = skills.skill_id
WHERE
    job_postings.job_location LIKE '%New%York%'
    AND job_postings.job_health_insurance = 1