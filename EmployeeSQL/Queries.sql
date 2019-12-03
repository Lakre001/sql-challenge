--1. List emp_no,last_name,first_name,gender and salary
SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        emp.gender,
        sal.salary
from employees as emp
    LEFT JOIN salaries as sal
    ON (emp.emp_no = sal.emp_no)
order by emp.emp_no;


--2.Employees hired in 1986
select employees.emp_no,
	employees.first_name,
	employees.last_name,
	EXTRACT (YEAR FROM hire_date) AS YEAR
from employees
where hire_date > '12/31/1985' and hire_date < '01/01/1987';


--3.List Manager of each department with dept_no, dept_name, manager's emp_no,last name,
--first_name,from and to_date
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        e.last_name,
        e.first_name,
        dm.from_date,
        dm.to_date
from dept_manager as dm
    INNER JOIN departments as d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN employees as e
        ON (dm.emp_no = e.emp_no);
		
		
--4. List department of each employee with emp_no,last_name,first_name & dept_name
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
from employees as e
    INNER JOIN dept_emp as de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments as d
        ON (de.dept_no = d.dept_no)
order by e.emp_no;


--5. -- Employees whose first name is "Hercules" and last name begins with "B"
SELECT *
from employees
where first_name = 'Hercules'
and last_name LIKE 'B%';


--6. All the employees in the sales dept with emp_no,
--last_name, first_name and dept_name
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
from employees as e
    INNER JOIN dept_emp as de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments as d
        ON (de.dept_no = d.dept_no)
where d.dept_name = 'Sales'
order by e.emp_no;


--7. All employees in Sales and Development departments with,
--emp_no, last_name, first_name and dept_name
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
from employees as e
    INNER JOIN dept_emp as de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments as d
        ON (de.dept_no = d.dept_no)
where d.dept_name IN ('Sales', 'Development')
order by e.emp_no;


--8. List the frequency count of employees last names in descending order.
select last_name, count (last_name) as name_counter
from employees
group by last_name
order by name_counter desc;
