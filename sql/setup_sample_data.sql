-- Setup: sample employees + departments (Databricks / Spark SQL)
-- Run this first, then key_queries.sql or the full notebook.

CREATE OR REPLACE TEMP VIEW employees AS
SELECT * FROM VALUES
  (1, 'John',   'IT',      80000),
  (2, 'Mary',   'HR',      70000),
  (3, 'David',  'IT',      90000),
  (4, 'Lisa',   'Finance', 85000),
  (5, 'Robert', 'Sales',   65000),
  (6, 'Sarah',  'HR',      75000),
  (7, 'Tom',    NULL,      60000)
AS t(employee_id, name, department, salary);

CREATE OR REPLACE TEMP VIEW departments AS
SELECT * FROM VALUES
  ('IT', 'David'),
  ('HR', 'Lisa'),
  ('Sales', 'Robert'),
  ('Finance', 'Lisa')
AS t(department, manager);
