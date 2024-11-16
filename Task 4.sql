/****************************TASK 4****************************************/

WITH Sales_CTE AS(
    SELECT * FROM Sales),
Product_CTE AS (
    SELECT * FROM Products)
SELECT 
    p.category,
    s.quantity,
    s.total_amount
FROM 
    Sales_CTE s 
JOIN 
    Product_CTE p ON s.product_id=p.product_id
ORDER BY s.total_amount DESC
