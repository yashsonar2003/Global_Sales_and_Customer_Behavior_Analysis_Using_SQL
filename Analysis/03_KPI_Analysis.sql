use global_sales_database;

# 3. KPI Analysis

# Total Revenue (Completed Orders):-
select 
    sum(order_amount) as total_revenue
from Global_Sales_Transactions_Raw
where order_status = 'Completed';

# Total Orders:-
select count(order_id) as total_orders
from Global_Sales_Transactions_Raw;

# Average Order Value (AOV):-
select 
    sum(order_amount) / count(order_id) as avg_order_value
from Global_Sales_Transactions_Raw
where order_status = 'Completed';

# Revenue per Customer:- 
select 
    sum(order_amount) / count(distinct customer_id) as revenue_per_customer
from Global_Sales_Transactions_Raw
where order_status = 'Completed';

# Orders per Customer:-
select 
    count(order_id) * 1.0 / count(distinct customer_id) as orders_per_customer
from Global_Sales_Transactions_Raw;

# Order Completion Rate (%):-
select 
    round(
        sum(case when order_status = 'Completed' then 1 else 0 end) * 100.0 / count(*), 2
    ) as completion_rate
from Global_Sales_Transactions_Raw;

# Cancellation Rate (%):-
select 
    round(
        sum(case when order_status = 'Cancelled' then 1 else 0 end) * 100.0 / count(*), 2
    ) as cancellation_rate
from Global_Sales_Transactions_Raw;

# Return Rate (%):-
select 
    round(
        sum(case when order_status = 'Returned' then 1 else 0 end) * 100.0 / count(*), 2
    ) as return_rate
from Global_Sales_Transactions_Raw;

# Revenue Loss Due to Cancellations & Returns:-
select 
    sum(order_amount) as revenue_loss
from Global_Sales_Transactions_Raw
where order_status in ('Cancelled', 'Returned');

# Completion vs Cancellation vs Return:-
select 
    order_status,
    count(*) as total_orders
from Global_Sales_Transactions_Raw
group by order_status;

# Customer Retention Proxy (Repeat Purchase Rate):-
select 
    round(
        count(distinct case when order_count > 1 then customer_id end) * 100.0 /
        count(distinct customer_id), 2
    ) as repeat_purchase_rate
from (
    select customer_id, count(order_id) as order_count
    from Global_Sales_Transactions_Raw
    group by customer_id
) t;

# Summary:-
# Strong Revenue Generation: The business generates healthy total revenue from completed orders, indicating good demand and transaction volume.
# Customer Value is Consistent: Average Order Value (AOV) and revenue per customer suggest stable customer spending behavior without extreme dependency on a few users.
# Healthy Order Completion Rate: A high completion rate shows that most orders are successfully fulfilled, reflecting operational reliability.
# Controlled Cancellation & Return Impact: Cancellation and return rates exist but remain at manageable levels; however, they still contribute to noticeable revenue loss.
# Repeat Customers Drive Stability: A significant repeat purchase rate indicates good customer retention and long-term revenue sustainability.