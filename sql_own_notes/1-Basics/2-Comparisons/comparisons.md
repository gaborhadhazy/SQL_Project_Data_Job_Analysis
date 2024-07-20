# Comparisons
- Used within the `WHERE` or `HAVING` clauses to filter rows based on a condition. 
- The comparison operators are:
  - `=`: Equal to
  - `<>` or `!=`: Not equal to
  - `>`: Greater than
  - `<`: Less than
  - `>=`: Greater than or equal to
  - `<=`: Less than or equal to
- The Logical operators are:
  - `AND`: Both conditions must be true
  - `BETWEEN`: At least one condition must be true
  - `IN`: Negates a condition

# <> & NOT
- `<>` is the same as `!=` and means "not equal to".
- `NOT` negates a condition.

```sql
SELECT
    job_id,
    job_title_short,
    job_via,
    salary_year_avg
FROM 
	job_postings_fact
WHERE NOT
	job_via = 'via Ai-Jobs.net'
```

In the above example, we are selecting the job_id, job_title_short, job_via, and salary_year_avg columns from the job_postings_fact table. We are filtering the rows where the job_via column is not equal to 'via Ai-Jobs.net'.

# > & >=
- `>` means "greater than".
- `>=` means "greater than or equal to".

```sql
SELECT
    job_id,
    job_title_short,
    job_via,
    salary_year_avg
FROM 
	job_postings_fact
WHERE
	salary_year_avg > 50000
```

# AND
- `AND` is used to combine two conditions. Both conditions must be true for the row to be selected.
- Can have multiple `AND` conditions.

```sql
SELECT
    job_id,
    job_title_short,
    job_via,
    salary_year_avg
FROM 
	job_postings_fact
WHERE
	salary_year_avg > 100000
    AND job_title = 'Data Analyst'
ORDER BY 
	salary_year_avg DESC
```

In the above example, we are selecting the job_id, job_title_short, job_via, and salary_year_avg columns from the job_postings_fact table. We are filtering the rows where the salary_year_avg is greater than 100000 and the job_title is 'Data Analyst'. We are ordering the results by salary_year_avg in descending order.

# OR
- `OR` is used to combine two conditions. At least one condition must be true for the row to be selected.

# BETWEEN
- `BETWEEN` is used to filter rows based on a range of values.
- The range is inclusive.
- Alternative to using `>=` and `<=`.

`salary_year_avg >= 50000 AND salary_year_avg <= 100000` is the same as `salary_year_avg BETWEEN 50000 AND 100000`.

# IN
- `IN` specify multiple values in a `WHERE` clause.
- Alternative to using multiple `OR` conditions.

```sql
SELECT
    job_id,
    job_title_short,
    job_via,
    salary_year_avg
FROM 
	job_postings_fact
WHERE
	job_title_short IN ('Data Analyst', 'Data Enginner')
ORDER BY 
	salary_year_avg DESC

```

In the above example, we are selecting the job_id, job_title_short, job_via, and salary_year_avg columns from the job_postings_fact table. We are filtering the rows where the job_title_short is either 'Data Analyst' or 'Data Engineer'. We are ordering the results by salary_year_avg in descending order. It is important that the values in the `IN` clause are enclosed in parentheses and seperated by commas.