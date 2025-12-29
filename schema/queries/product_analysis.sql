-- Top-selling products
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_units_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC;
