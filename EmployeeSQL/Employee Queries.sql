--List the employee number, last name, first name, sex, and salary of each employee
select emp_no, first_name, last_name,sex,
(	select salary 
	from salaries
	where employees.emp_no = salaries.emp_no
)
from employees
limit 20;

--List the first name, last name, and hire date for the employees who were hired in 1986
select first_name, last_name, hire_date
from employees
where hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--List the manager of each department along with their department number, department name, employee number, last name, and first name
select dept_no, emp_no,
(
	select dept_name
	from departments
	where dept_manager.dept_no=departments.dept_no
),
(
	select emp_no
	from employees
	where dept_manager.emp_no=employees.emp_no
),
(
	select last_name
	from employees
	where dept_manager.emp_no=employees.emp_no
),
(
	select first_name
	from employees
	where dept_manager.emp_no=employees.emp_no
)

from dept_manager;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
select emp_no, dept_no,
(	
	select dept_name
	from departments
	where dept_emp.dept_no=departments.dept_no
),
(
	select last_name
	from employees
	where dept_emp.emp_no=employees.emp_no
),
(
	select first_name
	from employees
	where dept_emp.emp_no=employees.emp_no
)
	from dept_emp;
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select first_name,last_name
from employees
where first_name = 'Hercules'
AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name
select emp_no, last_name, first_name
from employees
where emp_no in
	(select emp_no
	 from dept_emp
	 where dept_no in
	 	(select dept_no
		 from departments
		 where dept_name = 'Sales'
		 )
	 );
	
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

select de.emp_no,d.dept_name,e.first_name,e.last_name
from dept_emp as de
INNER JOIN departments as d ON
de.dept_no=d.dept_no
INNER JOIN employees as e ON
de.emp_no=e.emp_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 
select last_name, count(last_name) as "Last Name Counts"
from employees
GROUP BY last_name
ORDER BY "Last Name Counts" DESC;

