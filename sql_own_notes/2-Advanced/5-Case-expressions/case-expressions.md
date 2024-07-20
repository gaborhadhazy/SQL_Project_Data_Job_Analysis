# CASE Expression
- A `CASE` expression is a way to apply conditional logic to a query. It allows you to evaluate a series of conditions and return a value once a condition is met.

```sql
SELECT
    CASE
        WHEN condition1 THEN result1
        WHEN condition2 THEN result2
        ELSE result3
    END
FROM table;
``` 

```sql
SELECT
    CASE
        WHEN column_name = 'Value1' THEN 'Description for Value1'
        WHEN column_name = 'Value2' THEN 'Description for Value2'
        ELSE 'Description for other values'
    END AS column_descripton
FROM table;
``` 

- `CASE` - begins the `CASE` expression.
- `WHEN` - evaluates a condition and returns a result if the condition is true.
- `THEN` - specifies the result to return if the condition is true.
- `ELSE` - specifies the result to return if no conditions are true.
- `END` - ends the `CASE` expression.

Here is an example: 

```sql
SELECT
    COUNT(job_id) as number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location LIKE '%New York%' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category
```

In this example, we are counting the number of job postings for Data Analysts and categorizing them based on their location. If the job location is 'Anywhere', we categorize it as 'Remote'. If the job location contains 'New York', we categorize it as 'Local'. Otherwise, we categorize it as 'Onsite'.