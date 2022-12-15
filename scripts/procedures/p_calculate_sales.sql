create or replace PROCEDURE P_CALCULATE_SALES (PRODUCT_ID IN NUMBER, TOTAL OUT NUMBER) 
IS 

  CURSOR c_product(p_id NUMBER) 
  IS SELECT unit_price, quantity, discount 
       FROM ORDER_DETAILS
      WHERE product_id = p_id;
  
  unit_price number := 0;
  quantity   number := 0;
  discount   number := 0;
  amount     number := 0;
  
BEGIN
  OPEN c_product(PRODUCT_ID);
  LOOP    
    FETCH c_product INTO unit_price, quantity, discount;      
    amount := amount + ((unit_price * quantity) - discount);
    
    EXIT WHEN c_product%NOTFOUND;
  END LOOP;
  CLOSE c_product;

  TOTAL := amount;  
  
END P_CALCULATE_SALES;
/

DECLARE
  PRODUCT_ID NUMBER;
  TOTAL NUMBER;
BEGIN
  PRODUCT_ID := 10;

  P_CALCULATE_SALES(
    PRODUCT_ID => PRODUCT_ID,
    TOTAL => TOTAL
  );
  
   DBMS_OUTPUT.PUT_LINE('TOTAL = ' || TOTAL);
     
  :TOTAL := TOTAL;

END;