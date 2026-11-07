-- Uncomment the query for running 
use employees;

-- All information of all employees
-- select * from employees;

-- All information of all departments
-- select * from departments;

-- Full name of all employees
-- select concat(first_name, ' ', last_name) as Full_name from employees

-- Names of all departments
-- select dept_name from departments;

-- Full names of employees working in “Sales” department
-- select concat(e.first_name, ' ', e.last_name) as Full_name from employees as e
-- join dept_emp de on de.emp_no = e.emp_no
-- join departments d on d.dept_no = de.dept_no
-- where d.dept_name = 'Sales';

-- Full names of male employees working in “Finance” department
-- select concat(e.first_name, ' ', e.last_name) as Full_name, e.gender from employees as e
-- join dept_emp de on de.emp_no = e.emp_no
-- join departments d on d.dept_no = de.dept_no
-- where d.dept_name = 'Finance' and e.gender = 'M';

-- Salaries of female employees working in “Marketing” department
-- select concat(e.first_name, ' ', e.last_name) as Full_name, e.gender from employees as e
-- join dept_emp de on de.emp_no = e.emp_no
-- join departments d on d.dept_no = de.dept_no
-- where d.dept_name = 'Marketing' and e.gender = 'F';

-- Full names of employees who have the same last name as their manager
-- SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name FROM employees e
-- JOIN dept_emp de ON e.emp_no = de.emp_no
-- JOIN dept_manager dm ON de.dept_no = dm.dept_no
-- JOIN employees m ON dm.emp_no = m.emp_no
-- WHERE e.last_name = m.last_name AND e.emp_no != m.emp_no;
  
-- Full names of managers who have been doing the job at least twice
-- SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name FROM employees e
-- join dept_manager dm on dm.emp_no = e.emp_no
-- group by e.emp_no	-- collapses multiple rows with identical values into a single summary row.
-- HAVING COUNT(*) >= 2;
-- verify 
-- SELECT emp_no, COUNT(DISTINCT dept_no) AS departments_managed
-- FROM dept_manager
-- GROUP BY emp_no
-- HAVING COUNT(DISTINCT dept_no) >= 2;

-- Full names of employees who was paid more than $100000
-- SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, s.salary FROM employees e
-- join salaries s on s.emp_no = e.emp_no
-- where s.salary > 100000;

-- Names of all departments that have employees paid more than $100000
SELECT DISTINCT(dept_name) from departments d
join dept_emp de on de.dept_no = d.dept_no
join employees e on e.emp_no = de.emp_no
join salaries s on s.emp_no = e.emp_no
where s.salary > 100000;