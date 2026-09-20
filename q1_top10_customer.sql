-- Q1 Top 10 customers by total amount spent
SELECT c.customer_id,
		ROUND(SUM(p.payment_value), 2) AS total_spent,
        COUNT(DISTINCT o.order_id) AS num_orders
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_payments p ON o.order_id = p.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;