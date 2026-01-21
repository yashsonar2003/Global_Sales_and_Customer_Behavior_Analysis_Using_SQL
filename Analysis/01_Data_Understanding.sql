use global_sales_database;

# 1. Data Understanding

# Understanding Table Structure and Data:-
select * from Global_Sales_Transactions_Raw
limit 5;

# Total Rows:-
select COUNT(*) AS total_rows
from Global_Sales_Transactions_Raw;

# Countries in Global Sales Transactions:-
select distinct country
from Global_Sales_Transactions_Raw;

# Summary:-
# The dataset "Global_Sales_Transactions_Raw" contains "200,000" transaction records, indicating a large-scale, real-world sales dataset suitable for advanced SQL analysis.
# Each record represents a single customer order, with attributes covering geography (country, city), order details (amount, quantity, date), payment behavior, order status, and delivery performance.
# The data includes transactions from multiple countries, confirming that the dataset represents both national (India) and international markets.
# The presence of multiple countries allows for cross-country comparison, such as revenue contribution, customer behavior, and operational performance across regions.
# Initial data inspection shows the table structure is well-formed, making it suitable for further analysis such as KPI calculation, time-based trends, customer segmentation, and advanced SQL window functions.