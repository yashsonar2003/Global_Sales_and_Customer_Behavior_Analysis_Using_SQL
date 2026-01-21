use global_sales_database;

# 2. Data Cleaning

# Check NULL Values:-
select *
from Global_Sales_Transactions_Raw
where order_amount IS NULL
   or order_status IS NULL;
 
# Remove Duplicate Orders:-
select order_id, COUNT(*)
from Global_Sales_Transactions_Raw
group by order_id
having COUNT(*) > 1;

# Summary:-
# The dataset was thoroughly validated for data quality issues.
# A NULL value check on critical business columns such as order_amount and order_status confirmed that there are no missing values, ensuring revenue calculations and order analysis remain accurate.
# Additionally, a duplicate check on order_id verified that each order is uniquely recorded, maintaining transactional integrity.
# Overall, the dataset is clean, reliable, and suitable for downstream KPI analysis, revenue reporting, and advanced SQL analytics.