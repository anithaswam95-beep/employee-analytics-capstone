-- Key queries: 8 portfolio highlights from the capstone notebook.
-- Requires: sql/setup_sample_data.sql (employees + departments temp views).

-- 1. Headcount & average salary by department
SELECT department, COUNT(*) AS headcount, ROUND(AVG(salary)) AS avg_salary
FROM employees
WHERE department IS NOT NULL
GROUP BY department
ORDER BY avg_salary DESC;

-- 2. Above-average earners (subquery filtering)
SELECT name, department, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;

-- 3. Department report: headcount, avg / min / max salary (joins + aggregation)
SELECT d.department, d.manager,
       COUNT(e.employee_id) AS headcount,
       ROUND(AVG(e.salary)) AS avg_salary,
       MIN(e.salary) AS min_salary, MAX(e.salary) AS max_salary
FROM departments d
LEFT JOIN employees e ON e.department = d.department
GROUP BY d.department, d.manager
ORDER BY avg_salary DESC;

-- 4. Top earner per department (window function)
SELECT name, department, salary
FROM (
  SELECT name, department, salary,
         ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rn
  FROM employees WHERE department IS NOT NULL
)
WHERE rn = 1
ORDER BY salary DESC;

-- 5. Salary tiers + running total (CASE WHEN + SUM OVER)
SELECT name, department, salary,
       CASE WHEN salary >= 85000 THEN 'High'
            WHEN salary >= 70000 THEN 'Mid'
            ELSE 'Low' END AS salary_tier,
       SUM(salary) OVER (ORDER BY salary DESC) AS running_total
FROM employees
ORDER BY salary DESC;

-- 6. Salary gap vs peers (self-join: who earns more than their dept average)
SELECT e.name, e.department, e.salary,
       ROUND(e.salary - d.avg_dept_salary) AS gap_vs_dept_avg
FROM employees e
JOIN (SELECT department, AVG(salary) AS avg_dept_salary
      FROM employees WHERE department IS NOT NULL GROUP BY department) d
  ON e.department = d.department
WHERE e.salary > d.avg_dept_salary
ORDER BY gap_vs_dept_avg DESC;

-- 7. NULL handling: employees with no department (LEFT JOIN + COALESCE)
SELECT e.name, COALESCE(e.department, 'Unassigned') AS department, e.salary
FROM employees e
LEFT JOIN departments d ON e.department = d.department
WHERE e.department IS NULL;

-- 8. Conditional aggregation: headcount by salary band per department
SELECT department,
       COUNT(*) AS headcount,
       SUM(CASE WHEN salary >= 85000 THEN 1 ELSE 0 END) AS high_earners,
       SUM(CASE WHEN salary < 70000 THEN 1 ELSE 0 END) AS low_earners
FROM employees
WHERE department IS NOT NULL
GROUP BY department
ORDER BY department;
