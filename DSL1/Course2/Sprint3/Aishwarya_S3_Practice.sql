/* Practice_S3 
Task 1:Fetch the names and IDs of the employees who are working in the IT depatment */
Use hr;
SELECT * FROM hr.employees; 
SELECT * FROM hr.departments;
select employee_id, first_name from hr.employees as emp join hr.departments as dep
 on emp.department_id = dep.department_id 
 where department_name = 'IT'; 
 
 -- Task 2 :- Fetch the names and IDs , job title ,minimum salary and maximum salary of all employees
 SELECT * FROM hr.jobs;
 select employee_id, first_name ,job_title, min_salary, max_salary
 from hr.employees as emp inner join hr.jobs as jb 
 on emp.job_id = jb.job_id;
 
 -- Task 3 :- Identify the top cities which have the largest number of employees 
 SELECT * FROM hr.locations;
 select lo.city, count(employee_id) as 'No of Employees'from hr.employees as emp join hr.departments as dep 
 on emp.department_id = dep.department_id  join hr.locations as lo
 on dep.location_id = lo.location_id group by lo.city order by count(employee_id) desc limit 10;
 
 -- Task 4 :- Fetch employees id and names of all employees whose last working day (end date) in the organization
 -- was 1999-12-31.
 SELECT * FROM hr.job_history;
 select  employees.employee_id,first_name,end_date from employees inner join job_history on employees.employee_id = job_history.employee_id
 where end_date= '1999-12-31';
 
 
-- Task 5 :- Fetch employees ID, first name, department name, total experience of all employees who have completed 
-- at least 25 years in the organization.
select employee_id, first_name, department_name, year(current_date)-year(hire_date) as 'Total Experience'from employees  as emp 
inner join departments as dep  on emp.department_id = dep.department_id 
where  year(current_date)-year(hire_date) >25;
 