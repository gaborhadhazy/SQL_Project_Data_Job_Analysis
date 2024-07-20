# Introduction
📊 Explore the data job landscape! This project zeroes in on data analyst positions, highlighting 💼 high-paying roles, 🚀 essential skills, and 📈 where strong demand aligns with lucrative salaries in the data analytics field.

🔍 Want to see the SQL queries? Find them here: [project_sql folder](/project_sql/)
# Background
Motivated by the need to better navigate the data analyst job market, this project was created to identify high-paying and in-demand skills, making it easier for others to find ideal jobs.

The data is sourced this [SQL Course](https://lukebarousse.com/sql), which is filled with insights on job titles, salaries, locations, and essential skills.

### The questions I aimed to address with my SQL queries were:
1. Which data analyst jobs offer the highest pay?
2. What skills are essential for these high-paying roles?
3. Which skills are currently most sought after for data analysts?
4. What skills correlate with higher salaries?
5. Which skills are the most beneficial to learn?

# Tools I Used
To thoroughly explore the data analyst job market, I leveraged several essential tools:

- **SQL**: The foundation of my analysis, enabling me to query the database and uncover crucial insights.
- **PostgreSQL**: The selected database management system, perfect for managing the job posting data.
- **Visual Studio Code**: My preferred editor for database management and running SQL queries.
- **Git & GitHub**: Vital for version control and sharing my SQL scripts and analyses, facilitating collaboration and project tracking.

# Data Analysis
Each SQL query was designed to answer a specific question, providing valuable insights into the data analyst job market. Here are the SQL queries I used:

### 1. Top Paying Data Analyst Jobs
To uncover the best-paying data analyst positions, I filtered job listings by average annual salary and location, specifically targeting remote roles. This query highlights the lucrative opportunities in this field.

```sql
SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
Summary of Top Data Analyst Jobs in 2023:
- **Wide Salary Range**: Top 10 data analyst roles offer salaries from $184,000 to $650,000, showcasing substantial earning potential.
- **Diverse Employers**: High salaries are offered by companies like SmartAsset, Meta, and AT&T, indicating demand across various industries.
- **Varied Job Titles**: The job titles range from Data Analyst to Director of Analytics, reflecting the breadth of roles within the field.

![Top Paying Roles](./sql_own_notes/assets/1_top_paying_roles.png)
*Bar graph visualizing the salaries for the top 10 data analyst positions, generated from my SQL query results*

### 2. Skills Required for Top Paying Jobs
To identify the skills needed for the highest-paying positions, I linked job postings with skills data, revealing what employers seek for well-compensated roles.

```sql
WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```

Summary of Most Sought-After Skills for Top Paying Jobs in 2023:
- **SQL** is the most requested, appearing in 8 out of 10 jobs.
- **Python** is also highly desired, with 7 mentions.
- **Tableau** is frequently required, listed in 6 jobs.
Other notable skills include **R**, **Snowflake**, **Pandas**, and **Excel**.

![Top Paying Roles](./sql_own_notes/assets/2_top_paying_roles_skills.png)
*Bar graph showing the frequency of skills for the top 10 highest paying data analyst jobs, based on my SQL query results*

### 3. Skills Correlated with Higher Salaries

This query identifies the skills most commonly listed in job postings, highlighting areas of high demand.

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```

Summary of Most Demanded Skills for Data Analysts in 2023:
- **SQL** and **Excel** remain critical, emphasizing their importance in data handling and analysis.
- **Programming** and **Visualization Tools** like **Python**, **Tableau**, and **Power BI** are essential, reflecting the need for technical skills in data storytelling and decision-making.

| Skills   | Demand Count |
|----------|--------------|
| SQL      | 7291         |
| Excel    | 4611         |
| Python   | 4330         |
| Tableau  | 3745         |
| Power BI | 2609         |

*Table showing the demand for the top 5 skills in data analyst job postings*

### 4. Skills Associated with Higher Salaries
Analyzing average salaries linked to various skills reveals which ones offer the highest pay.

```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```

**Summary of Top Paying Skills for Data Analysts**:
- **High Demand for Big Data & ML Skills**: Proficiency in big data (PySpark, Couchbase) and machine learning tools (DataRobot, Jupyter) commands top salaries.
- **Software Development & Deployment**: Skills in tools like GitLab, Kubernetes, and Airflow are highly valued.
- **Cloud Computing Expertise**: Knowledge of cloud platforms (Elasticsearch, Databricks, GCP) significantly enhances earning potential.

| Skills        | Average Salary ($) |
|---------------|-------------------:|
| pyspark       |            208,172 |
| bitbucket     |            189,155 |
| couchbase     |            160,515 |
| watson        |            160,515 |
| datarobot     |            155,486 |
| gitlab        |            154,500 |
| swift         |            153,750 |
| jupyter       |            152,777 |
| pandas        |            151,821 |
| elasticsearch |            145,000 |

*Table showing the average salary for the top 10 paying skills for data analysts*

### 5. Optimal Skills to Learn
By combining demand and salary data, this query identifies skills that are both highly demanded and well-paid, providing strategic insights for skill development.

```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

| Skill ID | Skills     | Demand Count | Average Salary ($) |
|----------|------------|--------------|-------------------:|
| 8        | go         | 27           |            115,320 |
| 234      | confluence | 11           |            114,210 |
| 97       | hadoop     | 22           |            113,193 |
| 80       | snowflake  | 37           |            112,948 |
| 74       | azure      | 34           |            111,225 |
| 77       | bigquery   | 13           |            109,654 |
| 76       | aws        | 32           |            108,317 |
| 4        | java       | 17           |            106,906 |
| 194      | ssis       | 12           |            106,683 |
| 233      | jira       | 20           |            104,918 |

*Table showing the most optimal skills for data analysts, sorted by salary*

**Summary of the Most Optimal Skills for Data Analysts in 2023**:
- **High-Demand Programming Languages**: Python and R are highly demanded, with average salaries around $101,397 and $100,499, respectively.
- **Cloud Tools and Technologies**: Skills in Snowflake, Azure, AWS, and BigQuery are in high demand with high average salaries, reflecting the importance of cloud platforms.
- **Business Intelligence and Visualization Tools**: Tableau and Looker are critical, with average salaries around $99,288 and $103,795, respectively.
- **Database Technologies**: Traditional and NoSQL databases like Oracle and SQL Server are essential, with average salaries ranging from $97,786 to $104,534.

# What I Learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **🧩 Complex Query Crafting:** Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
- **📊 Data Aggregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
- **💡 Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions

### Insights
From the analysis, several general insights emerged:

1. **Top-Paying Data Analyst Jobs:** The highest-paying jobs for data analysts that allow remote work offer a wide range of salaries, the highest at $650,000!
2. **Skills for Top-Paying Jobs:** High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
3. **Most In-Demand Skills:** SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. **Skills with Higher Salaries:** Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.
5. **Optimal Skills for Job Market Value:** SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

### Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.
