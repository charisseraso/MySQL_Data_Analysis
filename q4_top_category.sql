-- Q4 Which product categories generate the most revenue?
SELECT p.product_category_name, ROUND(sum(i.price),2) AS revenue
FROM products p
INNER JOIN items i
ON p.product_id = i.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 1;