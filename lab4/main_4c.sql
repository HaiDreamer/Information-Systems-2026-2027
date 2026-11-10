use employees;
-- 4c --
-- create view
-- CREATE VIEW DeptManagerNames AS
-- SELECT employees.emp_no,
-- CONCAT(employees.first_name, ' ', employees.last_name) AS manager_name,
-- dept_manager.dept_no,
-- departments.dept_name
-- FROM dept_manager
-- JOIN employees on dept_manager.emp_no = employees.emp_no
-- JOIN departments on dept_manager.dept_no = departments.dept_no;

-- Who have the same name as the managers of the “Finance” department?
-- SELECT DISTINCT CONCAT(e.first_name, ' ', e.last_name) AS full_name FROM employees e
-- JOIN DeptManagerNames dm ON CONCAT(e.first_name, ' ', e.last_name) = dm.manager_name
-- WHERE dm.dept_name = 'Finance';

-- Who in the “Production” department were hired after the promotion of the last manager in that department?
-- select concat(e.first_name, ' ', e.last_name) as full_name, e.hire_date from employees e 
-- JOIN dept_emp de ON de.emp_no = e.emp_no
-- JOIN departments d ON d.dept_no = de.dept_no
-- where e.hire_date > (
--     SELECT dm.from_date
--     FROM DeptManagerNames dmn
--     JOIN dept_manager dm ON dm.emp_no = dmn.emp_no AND dm.dept_no = dmn.dept_no
--     WHERE dmn.dept_name = 'Production'
--     ORDER BY dm.from_date DESC
--     LIMIT 0, 1
-- ) and d.dept_name = 'Production';

-- Find the average salary of each department, from highest to lowest.
-- select d.dept_name, avg(s.salary) from departments d
-- join dept_emp de on d.dept_no = de.dept_no
-- join salaries s on de.emp_no = s.emp_no
-- where s.to_date = '9999-01-01'
-- group by d.dept_name
-- order by avg(s.salary) desc;

-- Find the average salary for each type of Engineer, from highest to lowest.
-- select title, avg(s.salary) as avg_salary from titles t
-- join salaries s on s.emp_no = t.emp_no
-- where t.title like '%Engineer%'
-- group by title
-- order by avg_salary desc;

