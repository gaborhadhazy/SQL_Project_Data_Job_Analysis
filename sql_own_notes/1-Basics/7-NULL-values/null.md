# NULL values
- NULL values are used to represent missing or unknown data. A field with no value.
- NULL is not the same as an empty string or a zero value.
- The following commands are used within a `WHERE` or `HAVING` clause

```sql
SELECT
    job_title_short,
    job_location,
	job_via,
    salary_year_avg
FROM
	job_postings_fact
WHERE
	salary_year_avg IS NOT NULL
ORDER BY 
	salary_year_avg
```

- In the above query, we are selecting the `job_title_short`, `job_location`, `job_via`, and `salary_year_avg` columns from the `job_postings_fact` table. We are filtering the result set to only include rows where the `salary_year_avg` column is not NULL. This is useful when we want to filter out rows with NULL values in a column.
