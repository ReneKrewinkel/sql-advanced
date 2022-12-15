create or replace view v_calculated_value 
as 
select product_id product_id, 
       f_calculate_sales(product_id) total 
  from order_details
 group by product_id