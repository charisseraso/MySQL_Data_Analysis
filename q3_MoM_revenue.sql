 -- Q3 What is the month-over-month change in revenue?
WITH monthly_revenue AS ( 
     SELECT DATE_FORMAT(o.order_purchase_timestamp, "%Y-%m") AS month,
       ROUND(sum(i.price),2) AS total_revenue
     FROM items i
     INNER JOIN orders o
     ON i.order_id = o.order_id
     GROUP BY DATE_FORMAT(o.order_purchase_timestamp, "%Y-%m")
),
     previous_revenue AS (
         SELECT *, LAG(total_revenue) OVER (ORDER BY month) as previous_revenue
         FROM monthly_revenue
)
SELECT *,
ROUND((total_revenue - previous_revenue)/previous_revenue,2)*100 AS mom_revenuegrowthpercent
FROM previous_revenue; 