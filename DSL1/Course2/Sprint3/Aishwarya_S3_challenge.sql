/* S3_Challenge 
Task 1 -- Identify the popular cities where most employees like to work */
Use Hr;
SELECT * FROM hr.locations;
select lo.city, count(employee_id) as 'No of Employees'from hr.employees as emp join hr.departments as dep 
 on emp.department_id = dep.department_id  join hr.locations as lo
 on dep.location_id = lo.location_id group by lo.city order by count(employee_id) desc limit 10 ; 
 
 -- Task 2 :- Fetch the details( first name , last name , country, city , department and salary ) of the employees from the top 5 cities 
 -- identified int task 1
 SELECT * FROM hr.employees;
 select   first_name   as 'First Name' ,last_name as 'Last Name',country_id as 'Country' ,city,department_name as 'Department', salary from hr.employees as emp join hr.departments as dep 
on emp.department_id=dep.department_id join hr.locations as lo
on dep.location_id = lo.location_id  order by city   desc;
 
 -- Task 3 :- The company wants to identify the operation cost of having office locations in various cities. 
 -- To reduce the office space occupancy and promote WFH culture, the HR team wants to identify the top 5 cities which have maximum number of employees.
 select lo.city, count(employee_id) as 'No. of Employees'from hr.employees as emp join hr.departments as dep 
 on emp.department_id = dep.department_id  join hr.locations as lo
 on dep.location_id = lo.location_id group by lo.city order by count(employee_id) desc limit 5 ; 
 
 -- Task 4 :- The management has decided to office a one-time bonus to those have completed 10 years in the organization, help identify 
 -- the details of the candidate who are eligible.alter
 select employee_id, first_name as 'First name ', department_name as 'Department', year(current_date)-year(hire_date) as 'Experience' from employees  as emp 
inner join departments as dep  on emp.department_id = dep.department_id 
where  year(current_date)-year(hire_date) > 10; 

-- Task 5 :- The HR team wants th know details of the manager (manager name and id) for those employees who have completed 10 years in 
-- organization . 
SELECT * FROM hr.departments;
 SELECT * FROM hr.employees;

select   departments.manager_id , concat(first_name,'  ',last_name )  'Manager name', year(current_date)-year(hire_date)as 'Experience'  from employees join departments
on employees.department_id= departments.department_id
where year(current_date)-year(hire_date) >10 ;


-- Task 6 :- HR team wants know top 3 countries which has the employees who are most loyal. This would help them to expand the eorkforce from specific countries
SELECT * FROM hr.countries;
SELECT * FROM hr.locations;
select  countries.country_name,city,count(employee_id) from employees as emp join departments as dep 
on emp.department_id=dep.department_id join locations as lo on dep.location_id=lo.location_id 
join countries on lo.country_id= countries.country_id  group by lo.city order by count(employee_id) desc limit 3;


