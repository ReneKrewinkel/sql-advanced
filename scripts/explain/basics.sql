select c.company_name, o.order_id
from customers c, orders o
where o.customer_id = c.customer_id


select c.company_name, o.order_id
from customers c
inner join orders o on o.customer_id = c.customer_id


select c.company_name, o.order_id, avg(discount)
  from customers c
  join orders o on o.customer_id = c.customer_id
  join order_details d on d.order_id = o.order_id
 group by c.company_name, o.order_id


select * from (
    select c.company_name, o.order_id, avg(unit_price * quantity) average
      from customers c 
      join orders o on o.customer_id = c.customer_id
      join order_details d on d.order_id = o.order_id
     group by c.company_name, o.order_id
) 
order by average desc


