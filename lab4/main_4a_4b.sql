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
-- SELECT d.dept_name, SUM(s.salary) AS total_salary FROM departments d
-- JOIN dept_emp de ON de.dept_no = d.dept_no
-- JOIN employees e ON e.emp_no = de.emp_no
-- JOIN salaries s ON s.emp_no = e.emp_no
-- where e.gender = 'M'
-- GROUP BY d.dept_no, d.dept_name
-- HAVING SUM(s.salary) > 20000000000;

-- Total salaries of department managers for each department, from highest to lowest?
-- select dept_name, sum(s.salary) as Total_salary from departments d
-- join dept_manager dm on d.dept_no = dm.dept_no
-- join salaries s on dm.emp_no = s.emp_no
-- group by dept_name
-- order by sum(s.salary) DESC;


-- 4b --
-- Who have the same name as the managers of the “Finance” department?
-- select DISTINCT concat(e.first_name, ' ', e.last_name) as full_name from employees e
-- join dept_emp de on de.emp_no = e.emp_no
-- join departments d on d.dept_no = de.dept_no
-- where d.dept_name = 'Finance'
-- having full_name in (select concat(emp.first_name, ' ', emp.last_name) as full_name from employees emp 
-- join dept_manager dm on emp.emp_no = dm.emp_no);

-- Who in the “Production” department were hired after the promotion of the last manager in that department?
-- select concat(e.first_name, ' ', e.last_name) as full_name, e.hire_date from employees e 
-- JOIN dept_emp de ON de.emp_no = e.emp_no
-- JOIN departments d ON d.dept_no = de.dept_no
-- where e.hire_date >
-- (select dm.from_date from dept_manager dm
-- join departments d on d.dept_no = dm.dept_no
-- where d.dept_name = 'Production'
-- order by dm.from_date desc limit 0, 1) and d.dept_name = 'Production';

-- Find the average salary of each department, from highest to lowest.
-- select d.dept_name, avg(s.salary) from departments d
-- join dept_emp de on d.dept_no = de.dept_no
-- join salaries s on de.emp_no = s.emp_no
-- group by d.dept_name
-- order by avg(s.salary) desc;

-- Find the average salary for each type of Engineer, from highest to lowest.
-- select title, avg(s.salary) as avg_salary from titles t
-- join salaries s on s.emp_no = t.emp_no
-- where t.title like '%Engineer%'
-- group by title
-- order by avg_salary desc;



