select product_id, f_calculate_sales(product_id) as "TOTAL" 
  from order_details
 group by product_id