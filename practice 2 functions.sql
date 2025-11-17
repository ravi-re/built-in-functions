use sakila;
select * from customer
---Lpad----
select customer_id,first_name,last_name,lpad(first_name, 10,'$') as formatted_firstname
from customer
limit 10;

---rpad----
select customer_id,first_name,last_name,rpad(last_name,10,'#') as formated_lastname
from customer
limit 10;
---substring----
select first_name, first_name,substring(first_name,2) as sub_string
from customer
limit 10;
---concat---
select first_name,last_name, concat(first_name, '  ',last_name) as fullname
from customer
limit 5;

---reverse---
select first_name, reverse (first_name) as reversed_name
from customer
limit 5;

---length---

select first_name,length(first_name) as first_length,last_name,length(last_name) as last_length,email,length(email) as email_length
from customer
limit 5;

---locate---
select email,locate('a',email)as first_a, locate('a',email,locate('a',email) +1) as second_a
from customer
limit 5;

---upper() and lower()---
select first_name,upper(first_name) as upper_name,last_name,lower(last_name) as last_lower
from customer
limit 5;

select payment_id,amount,
case when amount <=2.99 then 'low'
     when amount between 3.00 and 7.00 then 'high'
     else 'higest'
end as price_category
from payment
limit 100;

---replace----
select email,replace(email,'.org','.com') as updated_email
from customer


----regexp---

select title 
from film
where  title regexp 'love|hate';
---cast----


select payment_id,amount,cast(amount as signed) as amount_as_int
from payment;


select payment_date, cast(payment_date as char) as date_text
from payment;


--random rand()-----
select customer_id,first_name,last_name
from customer
order by rand()
limit 5;


--i want to select 5 random people to give 5.005 to 20% discount
select customer_id,
       first_name,
       last_name,
       round(5 + (rand() * 15), 2) as random_discount
       from customer
       order by rand()
       limit 5;
       
       SELECT FLOOR(RAND() * (100 - 1 + 1)) + 1;
       
       
       SELECT RAND();
       
       
select number,
if (mod(number,2) =0 ,'even','odd') as type
from ( select 1 as number union all
select 2 union all
select 3 union all
select 4 union all
select 15
)as nums;
