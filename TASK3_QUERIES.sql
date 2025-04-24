1. SELECT + WHERE
SELECT * FROM orders
WHERE order_status = 'delivered';
2. ORDER BY
SELECT product_id, price
FROM order_items
ORDER BY price DESC
LIMIT 10;
3. GROUP BY + Aggregates
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 5;
4.JOINS
SELECT customers.customer_unique_id, orders.order_id, orders.order_purchase_timestamp
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
LIMIT 10;
5.SUBQUERY
SELECT product_id, price
FROM order_items
WHERE price > (
    SELECT AVG(price) FROM order_items
);
6. Create VIEW
CREATE VIEW high_value_customers AS
SELECT customer_id, SUM(payment_value) AS total_spent
FROM orders
JOIN payments ON orders.order_id = payments.order_id
GROUP BY customer_id
HAVING total_spent > 1000;
7.  Index Optimization
CREATE INDEX idx_order_customer ON orders(customer_id);





