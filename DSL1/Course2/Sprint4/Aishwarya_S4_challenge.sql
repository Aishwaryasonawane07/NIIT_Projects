/* S4_challenge  */
-- Task 1 :- Retrive the country name from the code given [USA, GBR, ARE]
SELECT * FROM world.country;
SELECT * FROM world.city;
SELECT * FROM world.countrylanguage;
 use world;
 
select code , Name  from country where Code ='USA'or Code ='GBR' or Code = 'ARE'; 

-- Task 2 :- Create a query that retrives a single value of the average of the sum of the continental populations. 
select sum(Population) 'Sum Population'from country;
select avg (Sum_Population) as AVG_population from (select sum(Population) as Sum_Population from country group by continent) as t;

-- Task 3 :- Create a query that retrives the list of countries from the continent of Europe where French is spoken. 
select Countrycode, Language from countrylanguage where language= 'French' ;
select name , code from country where code in (  select countrycode from countrylanguage where continent = 'Europe' and language= 'French' ); 

-- Task 4 :- Create a query that retrives one country from each  continent which has the highest population.
select Continent , name , population from country where population in ( select max(population) from country group by Continent);
