-- Q6 Segment customers into spend tiers (Low/Medium/High)
SELECT c.customer_id,ROUND(sum(i.price),2) AS total_spent,
CASE
    WHEN ROUND(sum(i.price),2) < 100 THEN 'Low Value'
    WHEN ROUND(sum(i.price),2) < 500 THEN 'Medium Value'
    ELSE 'High Value'
END AS customer_segment
FROM items i
INNER JOIN orders o ON i.order_id = o.order_id
INNER JOIN customers c ON o.customer_id = C.customer_id
GROUP BY customer_id;