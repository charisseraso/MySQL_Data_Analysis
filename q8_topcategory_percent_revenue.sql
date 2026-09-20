-- Q8 What %of the total revenue comes from the top category?
WITH top_category AS(
SELECT p.product_category_name, ROUND(sum(i.price),2) AS revenue_per_category
	FROM items i
    INNER JOIN products p on i.product_id = p.product_id
    GROUP BY product_category_name
    ORDER BY ROUND(sum(i.price),2) DESC
    LIMIT 1
),
total_revenue AS (
    SELECT SUM(price) AS total_revenue
    FROM items
)
SELECT 
    t.product_category_name,
    t.revenue_per_category,
    r.total_revenue,
    ROUND((t.revenue_per_category / r.total_revenue) * 100, 2) AS percent_revenue
FROM top_category t
CROSS JOIN total_revenue r;
