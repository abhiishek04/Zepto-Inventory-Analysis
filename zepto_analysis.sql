--- ZEPTO_INVENTORY_SALES_ANALYSIS
 USE zepto_data;
-- data exploration 

-- count of rows 
SELECT COUNT(*) FROM zepto_v;

-- sample data
SELECT * FROM zepto_v;

-- null values in table
SELECT * FROM zepto_v
WHERE name IS NULL
OR category IS NULL
OR mrp IS NULL
OR discountPercent IS NULL
OR availableQuantity IS NULL
OR discountedSellingPrice IS NULL
OR outOfStock IS NULL
OR quantity IS NULL;

-- different product categories 
SELECT DISTINCT category FROM zepto_v;

-- check products stock vs out of stock  [ 453 InStock, 3275 OutStock ]
SELECT outOfStock, COUNT(sku_id) from zepto_v
GROUP BY outOfStock;

-- product name present multiple time 
SELECT name, COUNT(sku_id) FROM zepto_v
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

---- DATA CLEANING ----

-- products with mrp = 0
SELECT * FROM zepto_v
WHERE mrp = 0;

 -- Exit from safe mode for insert, delete, update operation --  
 SET SQL_SAFE_UPDATES = 0;

-- delete the existing data with mrp = 0    
DELETE FROM zepto_v
WHERE mrp = 0;

-- convert the prices from paise to rupees
SELECT * FROM zepto_v;
UPDATE zepto_v
SET mrp = mrp / 100.0 , discountedSellingPrice = discountedSellingPrice / 100.0;

-- PROBLEM STATEMENT -- 

-- Q1. Find the top 10 best-value products based on the discount percentage ?
SELECT name , discountPercent FROM zepto_v
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2. What are the Products with High MRP > 300 but out of stock ?
SELECT name, mrp, outOfStock FROM zepto_v
WHERE mrp > 300 AND outOfStock = 'TRUE'
ORDER BY mrp DESC;

-- Q3. Calculate estimated revenue for each category ?
SELECT category , SUM( discountedSellingPrice * availableQuantity) AS estimated_revenue 
FROM zepto_v
GROUP BY category;

-- Q4. Find all products where MRP is greater than 500 and discount is less than 10% ?
SELECT DISTINCT name, mrp, discountPercent FROM zepto_v
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage ?
SELECT * FROM zepto_v;
SELECT category , ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto_v
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for product above 100g and sort by best value ?
SELECT DISTINCT name, weightInGms, discountedSellingPrice, ROUND((weightInGms/discountedSellingPrice),2) AS price_per_gram
FROM zepto_v
WHERE weightInGms >= 100
ORDER BY price_per_gram desc;

-- Q7. Group the products into categories like Low, Medium, Bulk ?
SELECT DISTINCT name, weightInGms,
CASE 
    WHEN weightInGms < 1000 THEN 'LOW'
    WHEN weightInGms < 5000 THEN 'MEDIUM'
    ELSE 'BULK'
    END AS weight_category
FROM zepto_v
ORDER BY weightInGms DESC;

-- Q8. What is the total inventory weight per category ?
SELECT category, SUM(weightInGms*availableQuantity) AS inventory_weight
FROM zepto_v
GROUP BY category
ORDER BY inventory_weight;
