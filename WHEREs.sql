SELECT * from sales.customers
SELECT * from sales.orders
-- Find the sale order of the customer located in lahore
--SUB Query >> IN/ NOT IN/ ANY / ALL / EXIT/ NOT EXIT / FROM / Reguler expersion >> INSERT / UPDATE / DELETE
SELECT order_id,customer_id,order_date FROM sales.orders where customer_id IN (
SELECT customer_id FROM sales.customers WHERE city = 'lahore'
)

SELECT customer_id,first_name,last_name, city  FROM sales.customers where customer_id IN (
SELECT customer_id FROM sales.orders WHERE order_date = '02-05-22'
)

-- SELECT customer_id FROM sales.orders WHERE order_date = '02-05-22'


