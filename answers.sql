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


