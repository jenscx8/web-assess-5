// problem 1
select email from customers order by email;
         email          
------------------------
 ecrocker@gmail.com
 hboyardee@yahoo.com
 mcallender@hotmail.com
(3 rows)

// problem 2
select id from orders where customer_id = (select id from customers where email = 'ecrocker@gmail.com');
 id 
----
  1
  3
  4
  6
  8
(5 rows)

//problem 3
select sum(num_cupcakes) from orders where processed = false;
 sum 
-----
 209
(1 row)

//problem 4
select c.name as name, coalesce(sum(case when o.cupcake_id is not null then o.num_cupcakes else 0 end), 0) as sum from cupcakes c left join orders o on c.id = cupcake_id group by c.name order by c.name asc;
    name     | sum 
-------------+-----
 carrot cake |  10
 chocolate   |   0
 funfetti    |  13
 raspberry   |  25
 red velvet  | 215
 vanilla     | 202
(6 rows)

// problem 5
select c.email as email_address, coalesce(sum(o.num_cupcakes), 0) as total from customers c left join (select customer_id, sum(num_cupcakes) as num_cupcakes from orders group by customer_id) o on c.id = o.customer_id group by c.id, c.email order by total desc;
     email_address      | total 
------------------------+-------
 ecrocker@gmail.com     |   265
 hboyardee@yahoo.com    |   184
 mcallender@hotmail.com |    16
(3 rows)



