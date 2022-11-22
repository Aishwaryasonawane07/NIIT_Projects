/* Demo 2.1 */
/* Task 1 :- create  databased called EmployeeDB */
Create Database EmployeeDB;

/* Task 2 ;- Create table called employee_details */
create table EmployeeDB.Employee_details1 (
empNo int,
dob  date,
firstname varchar(50),
lastname varchar(50),
gender varchar(50),
address varchar(50),
hiredata date
);

/* Task 3 :-rename column empNo to employee_id */
Alter table EmployeeDB.Employee_details1 rename column empNo to employee_id;
desc EmployeeDB.Employee_details;

/* Task 4 :- drop column address */
Alter table EmployeeDB.Employee_details drop address;

/* Task 5 :- modify the datatype of firstname to varchar 100. */ 
Alter table EmployeeDB.Employee_details modify firstname varchar(100);

/* Task 6 :-create copy of existing table */
Create table EmployeeDB.Employee_details_1 like EmployeeDB.Employee_details;

/*Task 7 :- Truncate table Employee_details as the backup is created */
truncate table EmployeeDB_1;

Create Table EmployeeDB.Department(
deptNO int ,
Dept_name varchar(100)
);
desc EmployeeDB.Department;

/* Demo 1.2 */
/* Task 1:- Use the Employee_details in Demo 1.1
Task 2 :- Insert the data in the table */
Insert into EmployeeDB.Employee_details1(employee_id,dob,firstname,lastname,gender,hiredata)
value (101,10/5/1992,'Ajay','Sharma','Male',20/1/2019),
 (102,14/1/1998,'Pooja','patil','Female',16/5/2022),
(103,16/2/2002,'Alia','Singh','female',15/8/2021);
Select * from EmployeeDB.Employee_details1 ;

/* Task 3:- Update the department name from sales to sales and finance. */
Insert into  EmployeeDB.Department(deptNO ,Dept_name)
value (1, 'sales'),
(2, 'marketing'),
(3, 'Finace');
Update EmployeeDB.Department set Dept_name= 'sales and Finance' where Dept_name='sales';

select * from EmployeeDB.Department;
  
/* Task 4 :- Update the employee_id 103 to 104 */
Update EmployeeDB.Employee_details1 set employee_id= 104 where employee_id =103;

/* Task 5 :- Delete the employee with employee_id 101 */
delete from EmployeeDB.Employee_details1 where employee_id =101;























/* SQL constraint */

create database School_data;
Create table School_data.student_data_2(
Student_roll_no int primary key,
first_name varchar(100) not null,
age int not null check(age>18),
phone_number int unique,
Address varchar(100) default "mumbai"
);
desc School_data.student_data_2;


Create database shop;
Create Table shop.customer_data(
Customer_id int primary key,
Customer_name varchar(100) not null,
address varchar(100)
);
desc shop.customer_data;

create table shop.orders(
order_id int primary key,
order_name varchar(100) not null,
Customer_id int,
foreign key (Customer_id) references shop.customer_data (Customer_id)
);
desc shop.orders;




create database School_data;
Create table School_data.student_data_2(
Student_roll_no int primary key,
first_name varchar(100) not null,
age int not null check(age>18),
phone_number int unique,
Address varchar(100) default "mumbai"
);
desc School_data.student_data_2;

insert into School_data.student_data_2 (Student_roll_no,first_name,age,phone_number,Address)
values (3, "ram",25, 56798,"m"),
(4,"sham",26,12334,"s");



select * from School_data.student_data_2;
update School_data.student_data_2 set first_name="nikhil" where first_name="ram";

set SQL_SAFE_UPDATES =0;

delete from School_data.student_data_2 where age= 25;
-- delete from School_data.student_data_2 where Student_roll_no= 2;