/*
 Write a query to calculate the percentage of job postings that offer health insurance (job_health_insurance = 'Yes') for each job_country. The result should include the country and the percentage of jobs offering health insurance.
 Application: Percentage of Jobs Offering Health Insurance by Country:
 */
SELECT
    job_location,
    (
        COUNT(
            CASE
                WHEN job_health_insurance = 1 THEN 1
            END
        ) * 100.0 / COUNT(*)
    ) AS health_insurance_percentage
FROM
    job_postings_fact
GROUP BY
    job_location
ORDER BY
    health_insurance_percentage DESC