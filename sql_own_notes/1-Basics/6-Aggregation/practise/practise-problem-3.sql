SELECT
    project_id,
    SUM(hours_spent * hours_rate) as project_original_cost,
    SUM(hours_spent * (hours_rate + 5)) as project_projected_cost
FROM
    invoices_fact
GROUP BY
    project_id