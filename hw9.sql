--1)List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM public."Employees" AS e
JOIN public."Salaries" AS s ON e.emp_no = s.emp_no;
 
--2)List the first name, last name, and hire date for the employees who were hired in 1986. 
SELECT first_name, last_name, hire_date 
FROM public."Employees"
WHERE hire_date ~ '1986';


--3)List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.
SELECT mg.dept_no, d.dept_name, mg.emp_no, e.last_name, e.first_name
FROM public."Employees" AS e 
	JOIN public."Manager" AS mg 
	ON (mg.emp_no = e.emp_no)
	JOIN public."Departments" AS d
	ON (d.Dept_no = mg.dept_no);

--4)List the department number for each employee along with that employee’s employee number, last name, 
--first name, and department name.
SELECT d.dept_no, d.dept_name, e.last_name, e.first_name
FROM public."Departments" AS d
	JOIN public."EmployeeInfo" AS ei
	ON (d.dept_no = ei.dept_no)
	JOIN public."Employees" AS e
	ON (ei.emp_no = e.emp_no);
 

--5)List first name, last name, and sex of each employee whose first name is Hercules and whose last name 
--begins with the letter B.
SELECT first_name, last_name, sex
FROM public."Employees"
WHERE first_name = 'Hercules' AND last_name ~ 'B';



--6)List each employee in the Sales department, including their employee number, last name, and first name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM public."Employees" AS e
	JOIN public."EmployeeInfo" AS ei
	ON (e.emp_no = ei.emp_no)
	JOIN public."Departments" AS d
	ON (d.dept_no = ei.dept_no)
	WHERE dept_name = 'Sales';

--7)List each employee in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM public."Employees" AS e
	JOIN public."EmployeeInfo" AS ei
	ON (e.emp_no = ei.emp_no)
	JOIN public."Departments" AS d
	ON (d.dept_no = ei.dept_no)
	WHERE dept_name IN ('Sales','Development');

--8)List the frequency counts, in descending order, of all the employee last names (that is, how many employees 
--share each last name).
SELECT last_name, COUNT (last_name) AS "Name Count"
FROM  public."Employees"
GROUP BY last_name
ORDER BY "Name Count" DESC


















