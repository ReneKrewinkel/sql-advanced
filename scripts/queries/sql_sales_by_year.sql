select distinct (a.Shipped_Date) as Shipped_Date, 
       a.Order_ID, 
       b.Subtotal, 
       to_char(a.Shipped_Date, 'YYYY') as Year
  from Orders a 
 inner join (
    -- Get subtotal for each order
    select distinct Order_ID, 
           (sum(Unit_Price * Quantity * (1 - Discount))) as Subtotal
      from order_details
     group by Order_ID    
) b on a.Order_ID = b.Order_ID
 where a.Shipped_Date is not null
   and a.Shipped_Date between 
                      to_date('1996-12-24', 'YYYY-MM-DD') and 
                      to_date('1997-09-30', 'YYYY-MM-DD')