use global_sales_database;

# 5. Time Trend Analysis

# Monthly Revenue Trend:-
select
    date_format(str_to_date(order_date, '%Y-%m-%d'), '%Y-%m') as month,
    sum(order_amount) as monthly_revenue
from Global_Sales_Transactions_Raw
where order_status = 'Completed'
group by month
order by month;

# Monthly Order Volume Trend:-
select 
    date_format(str_to_date(order_date, '%Y-%m-%d'), '%Y-%m') as month,
    count(order_id) as total_orders
from Global_Sales_Transactions_Raw
where order_date is not null
group by month
order by month;

# Yearly Trend:-
select 
    year(str_to_date(order_date, '%Y-%m-%d')) as year,
    count(order_id) as yearly_orders
from Global_Sales_Transactions_Raw
where order_date is not null
group by year
order by year;

# Summary:-
# Consistent Monthly Performance: Monthly revenue and order volume show a steady pattern over time, indicating stable demand with no extreme volatility.
# Revenue Follows Order Volume: Months with higher order counts also generate higher revenue, suggesting order volume is the primary revenue driver.
# Year-on-Year Growth Signal: Yearly order counts indicate overall growth in transactions, reflecting business expansion over time.
# Seasonality Presence: Certain months perform better than others, hinting at seasonal demand patterns that can be leveraged for promotions.
# Business Stability: The absence of sharp drops in completed-order revenue suggests operational stability and consistent customer engagement.