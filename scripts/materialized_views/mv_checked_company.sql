create materialized view mv_checked_company 
as
select a.employee_id,
       a.firstname, 
       a.lastname, 
       to_char(b.order_Date,'YYYY-MM-DD') order_date, 
       b.order_id,
       b.ship_name,
       c.customer_id,
       c.company_name
  from employees a
  join orders b on a.employee_id = b.employee_id
  join customers c on c.customer_id = b.customer_id
 where upper(b.ship_name) <> upper(c.company_name)