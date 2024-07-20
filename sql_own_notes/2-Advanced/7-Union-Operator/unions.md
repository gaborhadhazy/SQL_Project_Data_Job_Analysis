# UNION Operators
- UNION operator is used to combine the result-set of two or more SELECT statements.
    - `UNION` Remove duplicate rows from the result set.
    - `UNION ALL` Include duplicate rows in the result set.
- Each SELECT statement within UNION must have the same number of columns in the result sets with similar data types.


```sql
SELECT
    *
FROM
    january_jobs;

SELECT
    *
FROM
    february_jobs;

SELECT
    *
FROM
    march_jobs;
```

Since all of these three have the same columns we can combine them row wise using the UNION operator.

# UNION
- The `UNION` operator is used to combine the result-set of two or more SELECT statements.
- They need to have the same amount of columns and the data type must match
- Gets rid of duplicates

```sql
SELECT column_name
FROM table1

UNION

SELECT column_name
FROM table2;
```

```sql
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs
UNION
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs
UNION
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs;
```

# UNION ALL

- The `UNION ALL` operator is used to combine the result-set of two or more SELECT statements.
- They need to have the same amount of columns and the data type must match
- Keeps duplicates

```sql
SELECT column_name
FROM table1

UNION ALL

SELECT column_name
FROM table2;
```

