
-- Task 1 :- The name of an actor plays a vital role in a business's profit
-- The board members want to see the list of actors available on the database table and the last update date.
use sakila;
SELECT * FROM sakila.film; 
SELECT * FROM sakila.actor; 
select actor_id, concat(first_name, '  ', last_name) 'Full Name', last_update from actor;

-- Task 2 :- Many actors have adopted more attractive screen names, mostly at the behest of producers and directors. 
-- The board members want to know :
-- a. Is there any change in the actor first_name or last_name; 
select first_name , last_name , last_update from actor where last_update is not null;
-- b. How many actors have the same first_name and last_name ? List out all these actors. 
select distinct first_name, last_name from actor where last_update is not null;

-- c. How many actors have unique names ? what is the count of these actors in the database table?
Alter table actor modify  last_name varchar(100) unique key;
Alter table actor modify first_name varchar(100) unique key;  
select first_name , last_name from  actor  where  first_name  not in 
( select first_name  from actor where first_name = 'SANDRA' );

-- Task 3 :- To avoid confusion amongest the actors names, the board wants to know the list of actors whose names 
-- are repeated
select first_name, last_name  from  actor  where  first_name   in 
( select first_name  from actor where first_name = 'SANDRA' );

-- task 4 :- The board need to categorize the actors playing identify roles, such as action, romance, horror and mystery. 
-- For this board members want to have detailed overview of films based on the actors preferences.
SELECT * FROM sakila.category;
select  name , last_update from category where name = 'Action' or name ='romance'or name='horror'or name='mystry'; 
select first_name , last_name , name from  actor  where last_update in
 (select  name  from category where name = 'Action' or name ='romance'or name='horror'or name='mystry'); 
 

select concat(first_name,' ',last_name) as 'Actor', a.actor_id, fa.film_id, f.title,c.name, f.release_year, f.special_features 
from actor a join film_actor fa join film f join film_category fc join category c
on a.actor_id=fa.actor_id and f.film_id=fa.film_id and f.film_id=fc.film_id and c.category_id=fc.category_id 
where c.name in (select name from category) group by c.name;


-- Task 5 :- 
SELECT * FROM sakila.film_category; 
select film_id,count(category_id), category_id from sakila.film_category group by category_id  ;
select film_id, title ,rating from film where film_id = 10;

-- Task 6 :- Figure out the movie titles where the replacement cost is upto $9
-- a
select film.title , film.replacement_cost from sakila.film where replacement_cost <  (select replacement_cost = 9 from sakila.film );
-- b 
select film.title , film.replacement_cost from sakila.film where replacement_cost between  15 and 20;
-- c
select film.title , film.replacement_cost ,rental_rate from sakila.film where  ( select (max(replacement_cost)- min(replacement_cost))>15 from sakila.film);

-- Task 7 :- The board members need to know the list all films along with no of actors listed for each film
SELECT * FROM sakila.film_actor;
select count(actor_id), film_id from sakila.film_actor group by actor_id;
select count(actor_id) 'no of actors', film.film_id ,title from sakila.film_actor join film on film.film_id=film_actor.film_id 
group by title;

-- Task 8 :- Display the tittles of the movies starting with the letters k and q
Select title from sakila.film where title like 'k%' or title like 'q%'; 

-- Task 9 :- Display all the actors who appeared in the film 'agent truman'
select	film_id , title from sakila.film where title = 'agent truman' ;
select actor.first_name , actor.last_name , film.film_id , film.title from sakila.film join film_category
on film.film_id = film_category.film_id join actor
on film_category.actor_id = actor.actor_id where title = 'agent truman'; 

-- Task 10 :- Identify all movies catogorized as family film
select title , name from film join film_category on film_category.film_id = film.film_id
join category on category.category_id = film_category.category_id where category.name = 'Family'; 

-- Task 11 :- Display the most frequently rented movies in decending order 
select title , count(rental_date) 'Rent' from film join inventory on inventory.film_id= film.film_id
join rental on rental.inventory_id = inventory.inventory_id group by film.title order by count(rental.rental_date) desc;

-- Task 12 :- In how many film categories , the average difference between the film replacement cost and the rental rate is greater than $15
select avg(replacement_cost - rental_rate) > 15 from film ;

SELECT * FROM sakila.film; 
select title, replacement_cost ,  rental_rate from film having  avg(replacement_cost - rental_rate) > 15 ;


-- Task 13 :-Bord members want to identify the genres having 60-70 films. List the names of these categories and the no of films per category 
-- s
select category.name, count(film_id) 'Number_of_films' from category 
join film_category on category.category_id= film_category.category_id group by category.name having count(film_id) between 60 and 70
order by count(film_id) asc;