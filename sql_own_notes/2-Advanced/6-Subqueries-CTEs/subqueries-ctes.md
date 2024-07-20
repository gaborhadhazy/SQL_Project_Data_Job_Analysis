# Subqueries and CTEs
- Subqueries and Common Table Expressions (CTEs) are two ways to write more complex queries in SQL. They are often used to break down a complex query into simpler parts, or to perform operations that require multiple steps.
- Subqueries are for simpler queries that are nested inside a larger query. They can be used in the SELECT, FROM, WHERE, and HAVING clauses of a query.
- CTEs are temporary result sets that can be referenced within a larger query. They are defined using the WITH keyword and can be used to simplify complex queries by breaking them down into smaller, more manageable parts.

## Subqueries
- A subquery is a query that is nested inside another query. It can be used in various parts of a query, such as the SELECT, FROM, WHERE, and HAVING clauses.

```sql
SELECT *
FROM ( -- Subquery
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs-- Subquery ends here
```

Because it is within parentheses, it is going to be executed first

```sql
SELECT
    name AS company_name
FROM
    company_dim
WHERE
    company_id IN (
        SELECT
            company_id
        FROM
            job_postings_fact
        WHERE
            job_no_degree_mention = true
        ORDER BY
            company_id
    )
```

In the above example, the subquery is used in the WHERE clause to filter the results of the outer query based on the results of the subquery.
This is equivalent to the following query using a JOIN:

## CTEs (Common Table Expressions)
- defines a temporary result set that you can reference within SELECT, INSERT, UPDATE, or DELETE statements.
- Defined using the WITH keyword, followed by a name for the CTE and the query that defines it.

```sql
WITH january_jobs AS ( -- CTE
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) -- CTE ends here

SELECT *
FROM january_jobs
```

```sql
WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS job_postings_count
    FROM
        job_postings_fact
    GROUP BY
        company_id
)
SELECT
    company_dim.name AS company_name,
    company_job_count.job_postings_count
FROM
    company_dim
    LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
```

In the above example, the CTE company_job_count is used to calculate the number of job postings for each company. This result set is then joined with the company_dim table to retrieve the company name and job postings count.