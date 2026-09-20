-- Q2  What is the monthly revenue trend across the dataset?
SELECT DATE_FORMAT(o.order_purchase_timestamp, '%Y-%M') as month, ROUND(sum(i.price),2) as monthly_revenue
FROM orders o
INNER JOIN items i
ON o.order_id = i.order_id
GROUP BY 
    YEAR(o.order_purchase_timestamp),
    MONTH(o.order_purchase_timestamp)
    ORDER BY YEAR(o.order_purchase_timestamp) ASC;
    

