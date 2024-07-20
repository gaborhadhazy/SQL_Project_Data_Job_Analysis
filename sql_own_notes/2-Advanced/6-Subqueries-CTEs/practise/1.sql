/*
 Identify the top 5 skills that are most frequently mentioned in job postings. Use a subquery to find the skill IDs with the highest counts in the skills_job_dim table and then join this result with the skills_dim table to get the skill names.
 */
SELECT
    skills_dim.skills AS skill,
    skill_counts.skill_count
FROM
    (
        SELECT
            DISTINCT skill_id,
            COUNT(*) AS skill_count
        FROM
            skills_job_dim
        GROUP BY
            skill_id
        ORDER BY
            skill_count DESC
    ) AS skill_counts
    JOIN skills_dim ON skills_dim.skill_id = skill_counts.skill_id