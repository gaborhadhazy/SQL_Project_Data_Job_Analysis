/*
 Write a query to retrieve the list of job titles and the corresponding company names for all job postings that mention 'Data Scientist' in the job title. Use the job_posting_fact and company_dim tables for this query.
 Application: Retrieve Job Titles and Corresponding Company Names for All Job Postings that Mention 'Data Scientist' in the Job Title
 */
SELECT
    job_postings.job_id,
    job_postings.job_title,
    companies.name AS company_name
FROM
    job_postings_fact AS job_postings
    LEFT JOIN company_dim AS companies ON job_postings.company_id = companies.company_id
WHERE
    job_title LIKE '%Data%Scientist%'