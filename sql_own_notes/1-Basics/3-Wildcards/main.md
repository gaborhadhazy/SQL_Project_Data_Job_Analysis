# Wildcards
- Used to substitute one or more characters in a string.
- Wildcards are used with the `LIKE` operator.
- All of this (i.e `LIKE`, `%` and `_`) is used in the `WHERE` clause.

## %
- The percent sign `%` represents zero, one, or multiple characters.
- For example, `LIKE '%a%'` finds any values that have an `a` in any position. 

```sql
SELECT
    job_id,
    job_title,
    job_title_short,
    job_location,
    job_via
FROM
    job_postings_fact
WHERE 
	job_title LIKE '%Analyst%'
```

In the above query, we are looking for all the job titles that have the word `Analyst` in them. We are using the `%` wildcard to represent any characters before or after the word `Analyst`.

If we want to find all the job titles that start with the word `Analyst`, we can use the following query:

```sql
SELECT
    job_id,
    job_title,
    job_title_short,
    job_location,
    job_via
FROM
    job_postings_fact
WHERE 
    job_title LIKE 'Analyst%'
```

If we want to find all the job titles that end with the word `Analyst`, we can use the following query:

```sql
SELECT
    job_id,
    job_title,
    job_title_short,
    job_location,
    job_via
FROM
    job_postings_fact
WHERE 
    job_title LIKE '%Analyst'
```

```sql
SELECT
    job_id,
    job_title,
    job_title_short,
    job_location,
    job_via
FROM
    job_postings_fact
WHERE 
	job_title LIKE '%Business%Analyst%'
```

## _

- The underscore `_` represents a single character.

```sql
SELECT
    job_id,
    job_title,
    job_title_short,
    job_location,
    job_via
FROM
    job_postings_fact
WHERE 
	job_title LIKE '%Business_Analyst%'
```

In the above query, we are looking for all the job titles that have the word `Business` followed by a single character followed by the word `Analyst`. We are using the `_` wildcard to represent a single character. We are using the `%` wildcard to represent any characters before or after the word `Business` and `Analyst`.
