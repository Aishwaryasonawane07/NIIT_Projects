/* S2_ challenge */

-- Task 1:- The HR department needs the count of all the employees in the organization 
USE hr;
SELECT * FROM hr.departments;
SELECT * FROM hr.employees; 
select count(employee_id) from hr.employees;

-- Task 2:- The HR department requires a department-wise count of employees.
select count(employee_id), job_id from hr.employees 
group by job_id; 

-- Task 3 :- HR department wants to know the first name and salaries of the employees who have a salary greater than 60000
SELECT * FROM hr.employees; 
select first_name, last_name,salary from  hr.employees where salary>6000;

-- Task 4 :- HR department wants to determine the count of all employees in the organization who earn more than 20000
select count(salary) from hr.employees where salary>20000;

-- Task 5 :- hr department needs to identify the employees who got a commission so that new policies can be identical
-- for their appraisal 
select employee_id ,commission_pct , first_name from hr.employees where commission_pct is not null;

-- Task 6 :- The hr departmentwants to send gifts to all the employees who do not receive commission.
-- the gift item should also contain a note with the recipients full name.
select concat(concat(first_name, '     '),last_name) as 'full name' from hr.employees 
where commission_pct is null;

-- Task 7 :- HR department has decide to hire a third-party agency to perform  a background check on the employees
-- who are getting commission. the verification agency needs the following details first name, last name, email id,
-- phone number and employee id.
select concat(employee_id) as 'Employee ID',concat(concat(first_name, '    '),last_name) as 'Employee Full name',
concat(email) as 'Email ID', concat(phone_number) as 'Contact Number' from hr.employees 
where commission_pct is  not null; 

-- Task 8 :- Identify the top three department that have the highest ctc.
SELECT * FROM hr.jobs; 
select job_id , job_title, max_salary from hr.jobs 
order by max_salary desc limit 3;

-- Task 9 :- HR department wants to see the details of the cerical grade employees.
select employee_id,first_name, last_name,email, phone_number, hire_date, job_id , salary, commission_pct, manager_id
department_id from hr.employees where job_id like '%CLERK%';
  
-- Task 10 :- HR department wants to know the count of all clerical grade employees and their average salary
select  count(department_id) , Avg(salary)from hr.employees
where job_id like '%CLERK%';

-- Task 11 :- List the departments that have employee salaries ranging from 7000 to 10,000 along with the count
-- of employees having those salaries. 
select count(job_id) as 'Count of Employees',job_id ,salary from hr.employees where salary between 7000 and 10000
group by job_id ;

