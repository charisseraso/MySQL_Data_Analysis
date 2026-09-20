-- Q7 How many customers are repeat vs one-time buyers?
WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)

SELECT
    CASE
        WHEN order_count = 1 THEN 'One-time Buyer'
        ELSE 'Repeat Buyer'
    END AS customer_type,
    COUNT(*) AS number_of_customers,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM customer_orders
GROUP BY customer_type;
