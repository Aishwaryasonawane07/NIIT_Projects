/* S1_challenge */
/* Task 1 :-Create database stylexcarz_db */

Create database stylexcarz_db ;
use stylexcarz_db;

/* Task 2 :- Construct table salesperson, customer and orders */
Create Table stylexcarz_db.salespersons(
salesperson_id int primary key,
salesperson_name varchar(100) not null,
salesperson_city varchar(100)not null,
commission_rate int not null
); 
desc stylexcarz_db.salespersons;
 
Create Table stylexcarz_db.customers(
customer_id int primary key,
c_firstname varchar(100) not null,
c_lastname varchar(100) not null,
c_city varchar(100) not null,
c_rating varchar(100) not null
); 
desc stylexcarz_db.customers ; 
 
Create table stylexcarz_db.order(
order_id int primary key,
amount int not null,
orderdate date not null,
salesperson_id int ,
foreign key (salesperson_id) references stylexcarz_db.salespersons (salesperson_id),
customer_id int ,
foreign key (customer_id) references stylexcarz_db.customers (customer_id)
);
desc stylexcarz_db.order;

/* Task 3 :- insert All table */
/* note : - i have not save the file so errase everythig but i found the all table in schemas so copy paste it */
                  
insert into stylexcarz_db.salespersons (salesperson_id ,salesperson_name ,
salesperson_city ,commission_rate )
Value (1001,'william', 'london', 12),
(1002,'liam','san_jose',12),
(1003,'axelrod', 'newyork',10),
(1004, 'james','london', 11),
(1005,'fran', 'london', 26),
(1007, 'oliver', 'barcelona', 15),
(1008, 'john','london',0),
(1009,'charles', 'florida', 0);
select * from stylexcarz_db.salespersons ; 

/*Insert into stylexcarz_db.customers(customer_id ,c_firstname ,c_lastname c_city ,
c_rating )
value ( 2001,'anny', 'hoffman, 'london', 100 */

SELECT * FROM stylexcarz_db.order;
SELECT * FROM stylexcarz_db.customers;

/* task 4 :- update commission rate of the salespersons to 15% who have commission rate s between 0% to 13% */
Update stylexcarz_db.salespersons set commission_rate = 15 where commission_rate between 0 and 13;
set sql_safe_updates=0;

/* Task 5 :- Create clone of the order table and name it orders1_bkp */
create table stylexcarz_db.orders_bck like stylexcarz_db.order; 
SELECT * FROM stylexcarz_db.order_bkp;

/* Task 6 :- Delete records of the order 3005 and 3006 from order table */
Delete from stylexcarz_db.order where order_id = 3006 and 3005;

/* Task 7 :- Increase rating of customers who placed orders more then twice .Increase their rating by 50 */
update  stylexcarz_db.customers set c_rating = (c_rating+50) where customer_id = 2007;
