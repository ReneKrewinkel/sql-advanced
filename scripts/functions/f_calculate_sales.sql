CREATE OR REPLACE FUNCTION F_CALCULATE_SALES (PRODUCT_ID IN NUMBER) 
RETURN NUMBER 
AS 

 CURSOR c_product(p_id NUMBER) 
  IS SELECT sum( (unit_price * quantity) - discount) xsum
       FROM ORDER_DETAILS
      WHERE product_id = p_id;

  amount     number := 0;
  
BEGIN
  OPEN c_product(PRODUCT_ID);
  FETCH c_product INTO amount;
  CLOSE c_product;

  RETURN amount;

END F_CALCULATE_SALES;

/

select product_id, f_calculate_sales(product_id) as "TOTAL" 
  from order_details
 group by product_id