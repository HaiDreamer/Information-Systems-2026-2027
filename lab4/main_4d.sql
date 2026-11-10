use sakila;
-- List names of all the languages in the database (sorted alphabetically)?
-- select name from language;

-- List full names of actors with “GER” in their last name, ordered by their first name
-- select first_name, last_name from actor
-- where last_name like '%ger'
-- order by first_name;

-- Find all the addresses where postal code starts with “57”, and return addresses sorted.
-- select * from address
-- where postal_code like '57%'
-- order by address;

-- How many films involve a “DWARF” in their titles?
-- select count(*) from film
-- where title like '%dwarf%';

-- Find full names of actors who played in a film involving ‘WAR’ in title and longer than 2.5 hours, along 
-- with the title, run length and release year of the movie, sorted by the actors’ last names.
-- select first_name, last_name from actor a
-- join film_actor fa on a.actor_id = fa.actor_id
-- join film f on f.film_id = fa.film_id
-- where f.title like '%war%' and length > 2.5
-- order by a.last_name;

-- Find all the film categories in which there are between 55 and
-- 65 films. Return the names of these categories and the number
-- of films per category, sorted by the number of films descending.
-- select category_id, count(*) as count_films from film_category
-- group by category_id
-- having count(*) > 55 and count(*) < 65
-- order by count(*) desc

-- In how many film categories is the average difference between
-- the film replacement cost and the rental rate larger than 17?
-- select fc.category_id from film_category fc
-- join film f on f.film_id = fc.film_id
-- group by category_id
-- having avg(f.replacement_cost - f.rental_rate) > 17;

-- Find the address district(s) name(s) such that the minimal
-- postal code in the district(s) is maximal over all the districts.
-- Make sure your query ignores empty postal codes and district names.
-- SELECT MAX(min_postal)
-- FROM (
--     select district, min(postal_code) as min_postal from address
--     where postal_code is not null and district is not null and postal_code <> '' and district <> ''
--     group by district
-- ) AS district_min;

-- Find the names (first and last) of all the actors and customers
-- whose first name is the same as the first name of the actor with ID 101 (exclude the actor with ID 101).
SELECT first_name, last_name FROM actor
WHERE first_name = (SELECT first_name FROM actor WHERE actor_id = 101)
AND actor_id <> 101
UNION ALL		-- keep duplicate row, UNION for no duplicate row
SELECT first_name, last_name FROM customer
WHERE first_name = (SELECT first_name FROM actor WHERE actor_id = 101);





