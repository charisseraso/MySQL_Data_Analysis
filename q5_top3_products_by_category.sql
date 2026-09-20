-- Q5 Rank top 3 products within each category by revenue
WITH ranked_products AS (
SELECT p.product_id,p.product_category_name,ROUND(sum(i.price),2) as total_revenue,
 ROW_NUMBER() OVER (PARTITION BY p.product_category_name ORDER BY sum(i.price) DESC) AS rank_category    
FROM items i
INNER JOIN products p
ON i.product_id = p.product_id
GROUP BY p.product_id,
        p.product_category_name
)
SELECT *
FROM ranked_products
WHERE rank_category <=3
ORDER BY product_category_name, rank_category;