/* Practice_S1 */
/* Tsak1 :- Create database"techmac1_db" */

create database techmac2_db;

/* Task 2 :- Costruct 3 tables of employees details as "techyve_employees","techcloud_employees",
"techsoft_employees" */
create table techmac2_db.techyve_employees(
employee_id int ,
first_name varchar(100),
last_name varchar(100),
gender varchar(50),
age int
);

create table techmac2_db.techsoft_employees(
employee_id int ,
first_name varchar(100),
last_name varchar(100),
gender varchar(50),
age int
);
create table techmac2_db.techcloud_employees(
employee_id int ,
first_name varchar(100),
last_name varchar(100),
gender varchar(50),
age int
); 

desc techmac2_db.techyve_employees;
desc techmac2_db.techyve_employees;
desc techmac2_db.techyve_employees; 

/* Task 3:-Alter existing 3 tables and add a new column named as "proficiency_level" */
Alter table techmac2_db.techyve_employees add (proficiency_level int);
Alter table techmac2_db.techcloud_employees add (proficiency_level int);
Alter table techmac2_db.techsoft_employees add (proficiency_level int); 


/*Task 4 :- 1.Alter column employee_id with primary key 
2.proficiency_level of employees should be between 1 and 5
3. Age of employee should be between 21 and 55*/

Alter table techmac2_db.techyve_employees modify  proficiency_level int check  (proficiency_level>=1 and proficiency_level<=5);
Alter table techmac2_db.techcloud_employees modify  proficiency_level int check  (proficiency_level>=1 and proficiency_level<=5);
Alter table techmac2_db.techsoft_employees modify  proficiency_level int check  (proficiency_level>=1 and proficiency_level<=5); 

Alter  table techmac2_db.techsoft_employees modify age int check(age<18 and age>55);
Alter  table techmac2_db.techyve_employees modify age int check(age<18 and age>55);
Alter  table techmac2_db.techcloud_employees modify age int check(age<18 and age>55);  

Alter table techmac2_db.techsoft_employees modify employee_id int primary key;
Alter table techmac2_db.techyve_employees modify employee_id int primary key;
Alter table techmac2_db.techcloud_employees modify employee_id int primary key;


/* Task 5 :- Insert table employees details */
insert  into  techmac2_db.techyve_employees
 (employee_id, first_name , last_name , gender ,age,  proficiency_level )
value (006, 'Eli' ,'Evans','male ',26,1),
(002, 'carlos' ,'simmons','male ',32,2),
(003, 'kathie' ,'Bryant','female ',25,1),
(004, 'joey' ,'hughes','male ',41,4),
(005, 'Alice' ,'Matthews','female ',52,4);

insert  into  techmac2_db.techcloud_employees
 (employee_id, first_name , last_name , gender ,age,  proficiency_level )
value (001, 'teresa' ,  'bryant','female ',39,2),
(002, 'alexis' ,  'patterson','male ',48,5),
(003, 'rose' ,'bell','female ',42,3),
(004, 'gemma' ,  'watkins' , 'female ',44,3),
(005, 'kingston' ,  'martinz','male ',29,2);

insert  into  techmac2_db.techsoft_employees
 (employee_id, first_name , last_name , gender ,age,  proficiency_level )
value (001, 'peter' ,'burtler','male ',44,1),
(002, 'harold' ,'simmons','male ',54,2),
(003, 'julina' ,'sanders','female ',36,1),
(004, 'paul' ,'ward','male ',29,4),
(005, 'nicole' ,'brynt','female ',30,4);

select * from techmac2_db.techyve_employees; 
select * from techmac2_db.techcloud_employees; 
select * from techmac2_db.techsoft_employees; 

/* Task 6 :- clone table as techyve_employees_bck ,techcloud_employees_bck, techsoft_employees_bck */
Create table techmac2_db.techyve_employees_bck like techmac2_db.techyve_employees;
Create table techmac2_db.techcloud_employees_bck like techmac2_db.techcloud_employees;
Create table techmac2_db.techsoft_employees_bck like techmac2_db.techsoft_employees;


select * from techmac2_db.techyve_employees_bck; 
select * from techmac2_db.techcloud_employees_bck; 
select * from techmac2_db.techsoft_employees_bck; 


/* Task 7 :- Delete records of the employees with the code 0003, 0005 from techyve
and 0001, 0004 from techcloud.*/
Delete from techmac2_db.techyve_employees where employee_id = 0003 and employee_id =0005; 
Delete from techmac2_db.techcloud_employees where employee_id = 0001 and employee_id =0004;

/* Task 8 :- Merge the record from techyve and techcloud tables and store in new table */
create table techmac2_db.techyvecloud_employees(
employee_id int ,
first_name varchar(100),
last_name varchar(100),
gender varchar(50),
age int,
proficiency_level int);

insert techmac2_db.techyvecloud_employees(employee_id, first_name , last_name , gender ,age,  proficiency_level )
value (006, 'Eli' ,'Evans','male ',26,1),
(002, 'carlos' ,'simmons','male ',32,2),
(003, 'kathie' ,'Bryant','female ',25,1),
(004, 'joey' ,'hughes','male ',41,4),
(005, 'Alice' ,'Matthews','female ',52,4),
(007, 'teresa' ,  'bryant','female ',39,2),
(008, 'alexis' ,  'patterson','male ',48,5),
(009, 'rose' ,'bell','female ',42,3),
(0010, 'gemma' ,  'watkins' , 'female ',44,3),
(0011, 'kingston' ,  'martinz','male ',29,2);
select * from techmac2_db.techyvecloud_employees;
Truncate table techmac2_db.techyve_employees;
Truncate table techmac2_db.techyve_employees;
