/* Practice_S4 
Task 1  :- Display the employee ID , first name , last name and deparment names of all employees */

use hr;
SELECT * FROM hr.employees;
SELECT * FROM hr.departments; 
SELECT * FROM hr.locations; 
 
select employee_id,first_name, last_name ,department_name from employees, departments
 where exists ( select department_name from departments where department_id= department_id);

-- Task 2 :- Write a query to find the names and salaries of the employees whose salaries greater than the average salary
select concat(first_name, ' ', last_name) 'Full name',salary from employees where salary > ( select avg(salary) from employees ); 

-- Task 3 :- Write a query to find the names and salaries of the employees who earn less than average salary and work in any of the sales department.
select concat(first_name, ' ', last_name) 'Full name',salary from employees where salary < any ( select avg(salary) from employees ); 

-- Task 4 :- Write  a query to find the names and salaries of the employees who have a salary higher than the salary of all IT programmers
-- (job_id = 'it_prog') sort the salary results from lowest to higest.
select concat(first_name, ' ', last_name) 'Full name', salary from employees where salary >  (select max(salary) from employees where job_id = 'IT_PROG');

-- Task 5 :- Find employee with the minimum salary in the employees table. arrange the records in ascending order.  
select concat(first_name, ' ', last_name) 'Full name', salary from employees where salary in (select min(salary) from employees group by job_id)order by salary asc;

-- Task 6 :- Find the names of all employees  whose salary is greater than 60% of their departments total salary bill .  
select concat(first_name, ' ', last_name) 'Full name', salary from employees where salary > (select salary = 0.6 * sum(salary) from employees ) order by department_id;
select  salary = 0.6*sum(salary) from employees;


-- Task 7:- Write a query to find the first name and last name of employees who have manager and worked in UK-based department
select concat(first_name, ' ', last_name) 'Full name' from employees, locations where
manager_id in ( select manager_id from hr.departments where location_id in ( select location_id from locations where country_id = 'UK')); 
select location_id ,country_id from locations where country_id = 'UK'; 

-- Task 8:-Write salary , first_name, last_name of the higest paid employees and export the output as a .csv file 
select concat(first_name, ' ', last_name) 'Full name',salary from employees where salary > ( select avg(salary) from employees )
INTO OUTFILE
'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\employees.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';