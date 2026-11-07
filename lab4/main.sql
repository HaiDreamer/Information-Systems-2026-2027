use employees;

-- 4a --
-- avg salary of each employee
-- select concat(first_name, ' ', last_name) as full_name, avg(salary) from employees e
-- join salaries s on s.emp_no = e.emp_no
-- group by e.first_name, e.last_name		-- group all of same name into unique one name 

-- How much was each employee paid in total?
-- select concat(first_name, ' ', last_name) as full_name, sum(salary) from employees e
-- join salaries s on s.emp_no = e.emp_no
-- group by e.first_name, e.last_name;		-- group all of same name into unique one name 

-- Minimum, maximum and total salaries of each department?
-- select dept_name, min(s.salary), max(s.salary), sum(s.salary) from departments d
-- join dept_emp de on de.dept_no = d.dept_no
-- join employees e on e.emp_no = de.emp_no
-- join salaries s on s.emp_no = e.emp_no
-- group by d.dept_no, d.dept_name;

-- Which departments have paid more than 20 billion dollars for their employees?
-- SELECT d.dept_name, SUM(s.salary) AS total_salary FROM departments d
-- JOIN dept_emp de ON de.dept_no = d.dept_no
-- JOIN employees e ON e.emp_no = de.emp_no
-- JOIN salaries s ON s.emp_no = e.emp_no
-- GROUP BY d.dept_no, d.dept_name
-- HAVING SUM(s.salary) > 20000000000;

-- Total salaries of male employees in each department?
SELECT d.dept_name, SUM(s.salary) AS total_salary FROM departments d
JOIN dept_emp de ON de.dept_no = d.dept_no
JOIN employees e ON e.emp_no = de.emp_no
JOIN salaries s ON s.emp_no = e.emp_no
GROUP BY d.dept_no, d.dept_name
HAVING SUM(s.salary) > 20000000000 and e.gender = 'M';






