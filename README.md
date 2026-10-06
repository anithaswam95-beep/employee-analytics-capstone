# Employee Analytics Capstone

**SQL capstone project on employee analytics and department performance.**

End-to-end SQL analytics on employee + department data: workforce overview, compensation analysis,
department performance, and 46 practice exercises including DAX-to-SQL translations.
Built in Databricks (Spark SQL / Delta Lake), exported as a runnable notebook.

- **Notebook:** [`notebooks/employee_analytics.ipynb`](notebooks/employee_analytics.ipynb) (194 cells)
- **Dataset setup:** [`sql/setup_sample_data.sql`](sql/setup_sample_data.sql)
- **Key queries:** [`sql/key_queries.sql`](sql/key_queries.sql) — 8 standalone highlight queries

## Business questions answered

1. Headcount & average salary by department
2. Above-average earners (subquery filtering)
3. Department report: headcount, avg / min / max salary (joins + aggregation)
4. Top earner per department (window functions: ROW_NUMBER, RANK, QUALIFY)
5. Salary tiers + running total (CASE WHEN + SUM OVER)
6. Salary gap analysis (self-join / correlated subquery)
7. MoM growth with LAG, moving averages, YTD totals (window chaining)
8. YoY and YTD patterns (DAX SAMEPERIODLASTYEAR / TOTALYTD in SQL)

## Results (sample data: 7 employees, 4 departments)

| Finding | Value |
|---|---|
| Largest departments | IT & HR (2 employees each) |
| Highest avg salary | IT & Finance (~$85,000) |
| Top earner overall | David (IT, $90,000) |
| Above-average earners | David, Lisa — subquery vs company mean |
| NULL handling | Tom (no department) via LEFT JOIN + COALESCE |

## Skills demonstrated

- Core SQL: SELECT, WHERE (IN, BETWEEN, LIKE), ORDER BY/LIMIT, DISTINCT, IS NULL, COALESCE, CASE WHEN
- Joins: INNER, LEFT, RIGHT, FULL OUTER, self-join, CROSS JOIN, semi/anti joins, USING
- Aggregation: GROUP BY, HAVING, GROUPING SETS/ROLLUP/CUBE, conditional aggregation
- Subqueries & CTEs: scalar, IN, EXISTS, correlated, recursive CTEs
- Window functions: ROW_NUMBER, RANK, DENSE_RANK, LAG/LEAD, SUM/AVG OVER, QUALIFY, chaining
- Set ops: UNION / UNION ALL / INTERSECT / EXCEPT
- Semi-structured: ARRAY_*, MAP_*, JSON/VARIANT, EXPLODE, PIVOT/UNPIVOT
- Delta Lake: time travel, SHALLOW CLONE, DESCRIBE HISTORY, MERGE INTO, views
- DAX to SQL: CALCULATE, ALL, RANKX, TOPN, SAMEPERIODLASTYEAR, TOTALYTD, DIVIDE, SUMX + more

## How to run

**Option A — Databricks:** import `notebooks/employee_analytics.ipynb` and run top to bottom.

**Option B — any Spark SQL warehouse:** run `sql/setup_sample_data.sql`, then `sql/key_queries.sql`.

**Option C — preview:** open the notebook on GitHub — 194 cells render with outputs.

## Repo structure

```
employee-analytics-capstone/
├── notebooks/employee_analytics.ipynb
├── sql/setup_sample_data.sql
├── sql/key_queries.sql
├── requirements.txt
└── README.md
```

## Author

**anithaswam95-beep** — https://github.com/anithaswam95-beep

