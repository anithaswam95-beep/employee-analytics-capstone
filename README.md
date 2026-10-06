# Employee Analytics Capstone

**SQL capstone project on employee analytics and department performance.**

End-to-end SQL analytics on employee + department data: workforce overview, compensation analysis,
department performance, and 46 practice exercises including DAX-to-SQL translations.
Built in Databricks (Spark SQL / Delta Lake), exported as a runnable notebook.

- **Notebook:** [`notebooks/employee_analytics.ipynb`](notebooks/employee_analytics.ipynb) (194 cells)
- **Dataset setup:** [`sql/setup_sample_data.sql`](sql/setup_sample_data.sql) — recreate the sample tables anywhere
- **Key queries:** [`sql/key_queries.sql`](sql/key_queries.sql) — the 8 most portfolio-relevant queries, standalone

## Business questions answered

1. Headcount & average salary by department — where is the workforce concentrated?
2. Who earns above the company average? (subquery filtering)
3. Department report: headcount, avg / min / max salary per department (joins + aggregation)
4. Top earner per department (window functions: `ROW_NUMBER`, `RANK`, `QUALIFY`)
5. Salary tiers + running total (`CASE WHEN` + `SUM OVER`)
6. Salary gap analysis — who earns more than their peers? (self-join / correlated subquery)
7. Month-over-month-style growth with `LAG`, moving averages, YTD totals (window chaining)
8. Year-over-year and YTD patterns (DAX `SAMEPERIODLASTYEAR` / `TOTALYTD` translated to SQL)

## Results (sample data: 7 employees, 4 departments)

| Finding | Value |
|---|---|
| Largest departments | IT & HR (2 employees each) |
| Highest avg salary | IT & Finance (~$85,000) |
| Top earner overall | David (IT, $90,000) |
| Above-average earners | David, Lisa — via subquery vs company mean |
| NULL handling | Tom (no department) surfaced with `LEFT JOIN` + `COALESCE` |

## Skills demonstrated

- **Core SQL:** `SELECT`, `WHERE` (`IN`, `BETWEEN`, `LIKE`), `ORDER BY`/`LIMIT`, `DISTINCT`, `IS NULL`, `COALESCE`, `CASE WHEN`
- **Joins:** `INNER`, `LEFT`, `RIGHT`, `FULL OUTER`, self-join, `CROSS JOIN`, semi/anti joins, `USING`
- **Aggregation:** `GROUP BY`, `HAVING`, `COUNT`/`AVG`/`MAX`/`MIN`, `GROUPING SETS`/`ROLLUP`/`CUBE`, conditional aggregation
- **Subqueries & CTEs:** scalar, `IN`, `EXISTS`, correlated, recursive CTEs (org-chart depth)
- **Window functions:** `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`/`LEAD`, `SUM`/`AVG OVER`, `QUALIFY`, chaining
- **Set ops:** `UNION` / `UNION ALL` / `INTERSECT` / `EXCEPT`
- **Semi-structured:** `ARRAY_*`, `MAP_*`, JSON/`VARIANT`, `EXPLODE`, `PIVOT`/`UNPIVOT`
- **Delta Lake:** time travel (`VERSION AS OF`), `SHALLOW CLONE`, `DESCRIBE HISTORY`, `MERGE INTO` upserts, views
- **DAX to SQL:** `CALCULATE`, `ALL`, `RANKX`, `TOPN`, `SAMEPERIODLASTYEAR`, `TOTALYTD`, `DIVIDE`, `SUMX`, `ALLEXCEPT`, `DISTINCTCOUNT`, `EARLIER`, `DATESBETWEEN`, + 16 more

## How to run

**Option A — Databricks (original):** import `notebooks/employee_analytics.ipynb` into any workspace and run top to bottom.

**Option B — any Spark SQL / Databricks SQL warehouse:** run [`sql/setup_sample_data.sql`](sql/setup_sample_data.sql), then [`sql/key_queries.sql`](sql/key_queries.sql).

**Option C — preview without running:** open the notebook directly on GitHub — all 194 cells render with outputs.

## Repo structure

```
employee-analytics-capstone/
├── notebooks/
│   └── employee_analytics.ipynb   # Full capstone notebook (194 cells, with outputs)
├── sql/
│   ├── setup_sample_data.sql      # Sample employees + departments tables
│   └── key_queries.sql            # 8 standalone highlight queries
├── requirements.txt               # (Optional) view notebook locally with Jupyter
└── README.md
```

## Environment

- Databricks (Spark SQL, Delta Lake) — original authoring environment
- Python 3.x + Jupyter (optional, for local `.ipynb` viewing only — no Python code required)

## Author

**anithaswam95-beep** — https://github.com/anithaswam95-beep

