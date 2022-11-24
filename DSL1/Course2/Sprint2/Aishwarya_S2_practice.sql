
/* Practice sprint 2 */
/* Task 1:- Extract details of the salespersons who are selling cars in 'London' */

use stylexcrz_db;
SELECT * FROM stylexcarz_db.salespersons; 
SELECT * FROM stylexcarz_db.customers; 
SELECT * FROM stylexcarz_db.order_bkp;
select * from stylexcarz_db.salespersons1;
select salesperson_id,salesperson_name,salesperson_city from stylexcarz_db.salespersons where salesperson_city='london';

/* Task 2 :- Extract details of the salespersons who have the commission rate as 0 */
select salesperson_id,salesperson_name,salesperson_city ,commission_rate from stylexcarz_db.salespersons1 where commission_rate  =0;

/* Task 3 :- Extract the details of the salespersons who are the top 3 commission rate holder */
select salesperson_id,salesperson_name,salesperson_city ,commission_rate from stylexcarz_db.salespersons1
order by  commission_rate desc limit 3;
 
 /* Task 4 :- Extract the details of salespersons who have commission rat below the average of all commission rates */
 select avg(commission_rate) from stylexcarz_db.salespersons1 ;
 select salesperson_id,salesperson_name,salesperson_city ,commission_rate from stylexcarz_db.salespersons1 where commission_rate >10.75;

 /* Task 5 :-Extract details of the salespersons who are selling cars in 'London' and have the commission rate below the average of 
 all commission rate */
select salesperson_id,salesperson_name,salesperson_city,commission_rate from stylexcarz_db.salespersons1 where salesperson_city='london'
and commission_rate > 10.75; 

/* Task 6 :- Extract details of the salespersons who are in florida, barcelona and san jose.*/
select salesperson_id,salesperson_name,salesperson_city,commission_rate from stylexcarz_db.salespersons1
where salesperson_city ='florida' or salesperson_city ='barcelona' or salesperson_city ='san_jose'; 

/* Task 7:- Extract the list of customer whose rating are lowest. */
select min(c_rating) from stylexcarz_db.customers;
select customer_id,c_firstname, c_lastname,c_city,c_rating from  stylexcarz_db.customers
where c_rating = 100;

/* Task 8 :- Extract the list of customer whose rating are highest rating */
select max(c_rating) from stylexcarz_db.customers;
select customer_id,c_firstname, c_lastname,c_city,c_rating from  stylexcarz_db.customers
where c_rating =300;

/* Task 9 :-Extract the list of cities where customers have the highest rating */
SELECT * FROM stylexcarz_db.customers; 
select customer_id,c_firstname, c_lastname,c_city,c_rating from  stylexcarz_db.customers
order by c_rating desc limit 3;

/* Task 10 :-Extract report of customers details with the ratings arranged from higest to lowest */
select customer_id,c_firstname, c_lastname,c_city,c_rating from  stylexcarz_db.customers
order by c_rating desc;

/* Task 11 :- Extract the list of customers who have names starting with the letter 'j' and having the third 
letter as 'n' to offer special vouchers in the month of june.*/
select customer_id,c_firstname, c_lastname,c_city,c_rating  from stylexcarz_db.customers
where c_firstname like 'j_n%';

/* Task 12 :- what are the average and the maximum sales amounts */
SELECT * FROM stylexcarz_db.order_bkp; 
select max(amount) from stylexcarz_db.order_bkp; 
select avg(amount) from stylexcarz_db.order_bkp; 

/* Task 13 :- What is the total number of orders placed */
select count(amount) from stylexcarz_db.order_bkp; 

/* Task 14 :- Extract the total and average sales amount for each month */
select orderdate, sum(amount) , avg(amount) from stylexcarz_db.order_bkp
group by  month(orderdate);

