use global_sales_database;

# 7. Customer Analysis

# High-Value Customers:-
select 
    customer_id,
    sum(order_amount) as total_spent
from Global_Sales_Transactions_Raw
where order_status = 'Completed'
group by customer_id
order by total_spent desc
limit 10;

# Customer Segmentation:-
select
    customer_id,
    SUM(order_amount) as total_spent,
    case
        when sum(order_amount) > 100000 then 'High Value'
        when sum(order_amount) between 50000 and 100000 then 'Medium Value'
        else 'Low Value'
    end as customer_segment
from Global_Sales_Transactions_Raw
where order_status = 'Completed'
group by customer_id;

# Summary:-
# Revenue is highly concentrated: A small group of top 10 high-value customers contributes a disproportionately large share of total completed-order revenue, indicating strong revenue dependency on key customers.
# Clear customer tiers exist: Customers naturally segment into High, Medium, and Low Value groups, enabling targeted marketing, loyalty programs, and differentiated service strategies.
# High-value customers are critical assets: Customers spending ₹100,000+ represent the most valuable segment and should be prioritized for retention and premium engagement.
# Majority are low to medium value: Most customers fall into Low or Medium Value segments, presenting opportunities to upsell and convert them into higher-value customers.
# Actionable business opportunity: Focusing on retention of high-value customers and increasing average spend of medium-value customers can significantly improve overall revenue.