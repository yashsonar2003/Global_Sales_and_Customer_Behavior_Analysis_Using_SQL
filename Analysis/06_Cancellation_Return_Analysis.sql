use global_sales_database;

# 6. Cancellation Return Analysis

# Cancellation + Return Rate by Country:-
select 
    country,
    count(case when order_status in ('Cancelled','Returned') then 1 end) * 100.0
    / count(*) as issue_rate
from Global_Sales_Transactions_Raw
group by country;

# Delivery Delay Impact on Returns:-
select 
    delivery_days,
    count(*) as returned_orders
from Global_Sales_Transactions_Raw
where order_status = 'Returned'
group by delivery_days
order by delivery_days;

# Summary:-
# Certain countries show higher cancellation/return rates, indicating possible issues with logistics, customer expectations, or payment reliability in those regions.
# Returns increase as delivery days increase, clearly showing that delivery delays directly impact customer dissatisfaction.
# Faster delivery correlates with fewer returns, highlighting delivery time as a key operational KPI.
# Improving logistics and last-mile delivery in high-issue countries can significantly reduce revenue loss from cancellations and returns.