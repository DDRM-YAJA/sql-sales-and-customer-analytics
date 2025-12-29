-- Monthly revenue trend
SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(oi.quantity * p.price) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;


-- Revenue contribution using window function
SELECT 
    c.customer_name,
    SUM(oi.quantity * p.price) AS customer_revenue,
    ROUND(
        SUM(oi.quantity * p.price) * 100.0 /
        SUM(SUM(oi.quantity * p.price)) OVER (),
        2
    ) AS revenue_percentage
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_name;


-- CTE-based customer revenue analysis
WITH customer_revenue AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * p.price) AS total_revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT *
FROM customer_revenue
WHERE total_revenue > 500;
