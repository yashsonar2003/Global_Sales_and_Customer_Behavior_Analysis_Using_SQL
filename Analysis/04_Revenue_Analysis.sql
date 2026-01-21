use global_sales_database;

# 4. Revenue Analysis

# Revenue by Country:-
select 
    country,
    SUM(order_amount) as total_revenue
from Global_Sales_Transactions_Raw
where order_status = 'Completed'
group by country
order by total_revenue desc;

# Revenue by City:
select 
    city,
    SUM(order_amount) as city_revenue
from Global_Sales_Transactions_Raw
where order_status = 'Completed'
group by city
order by city_revenue desc;

# Summary:-
# "India" and "USA" emerge as the top revenue-generating countries, indicating strong market demand and high transaction volume in these regions.
# Major metro cities (such as Bangalore, Mumbai, New York, and London) contribute the highest share of revenue, showing that urban centers are the primary revenue drivers.
# Revenue concentration is higher in a few key cities, suggesting opportunities to expand marketing and operations in underperforming regions.
# Completed orders form the core revenue base, reinforcing the importance of reducing cancellations to improve overall revenue performance.