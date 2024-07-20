/*
 Question: What are the most optimal skills to learn (aka high demand and high salary)?
 - Identify skills in high demand and associated with high salaries for Data Analyst positions.
 - Focuses on roles with specified salaries, regardless of location
 - Why? It reveals the skills that are most valuable in the job market, offering insights into career development.
 */
SELECT
  skills_dim.skill_id,
  skills_dim.skills,
  COUNT(skills_job_dim.job_id) AS demand_count,
  ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM
  job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
  AND job_work_from_home = TRUE
GROUP BY
  skills_dim.skill_id
HAVING
  COUNT(skills_job_dim.job_id) > 10
ORDER BY
  demand_count DESC,
  avg_salary DESC
LIMIT
  25;