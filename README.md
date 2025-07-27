# Zepto-Inventory-Analysis

📌 Project Description:
In this project, I performed end-to-end data analysis and cleaning on Zepto’s inventory dataset using SQL. The dataset contains details of products such as name, category, MRP, discount %, stock status, selling price, quantity, and weight.

The goal was to clean the data, derive business insights, and calculate key performance metrics that can assist a grocery delivery platform like Zepto in optimizing pricing, managing inventory, and improving profitability.

🧠 Key Problem Statements Solved:
Top Value Deals
➤ Identified top 10 products with the highest discount percentages to optimize marketing promotions.

High-Value Out-of-Stock Items
➤ Found products with MRP > ₹300 that are currently out of stock, signaling missed revenue opportunities.

Revenue Estimation by Category
➤ Estimated potential revenue by calculating:
discountedSellingPrice × availableQuantity, grouped by product category.

Low-Discount, High-MRP Products
➤ Detected expensive products (MRP > ₹500) offering low discounts (<10%), potential for dynamic pricing strategies.

Average Discount by Category
➤ Analyzed top 5 categories offering the highest average discount %, to understand customer value focus areas.

Best Value by Price per Gram
➤ Evaluated products over 100g for price per gram, to assist in comparative pricing.

Weight-Based Inventory Classification
➤ Segmented inventory into Low, Medium, and Bulk categories using product weight for supply chain optimization.

Total Inventory Weight per Category
➤ Calculated total inventory load by multiplying weight and quantity per product category — helpful for logistics planning.


🧹 Data Cleaning Done:
Removed entries with MRP = 0

Checked for and addressed NULL values

Converted prices from paise to rupees for clarity.


🛠️ Tech Stack:
SQL (MySQL)

Zepto Product Inventory Dataset

Data cleaning, analysis, and transformation

