use global_sales_database;

# 8. Advanced SQL Window

# Top 3 Cities per Country:-
select *
from (
    select
        country,
        city,
        sum(order_amount) as city_revenue,
        rank() over(partition by country 
        order by sum(order_amount) desc) as rk
    from Global_Sales_Transactions_Raw
    where order_status = 'Completed'
    group by country, city
) ranked
where rk <= 3;

# Summary:-
# Revenue is highly concentrated in a few top cities within each country, showing that business performance is driven by limited urban markets.
# Metro cities dominate sales across countries, indicating higher purchasing power and stronger demand in major economic hubs.
# India shows multiple strong cities in the top ranks, suggesting a well-distributed domestic market compared to other countries.
# International markets rely on 1–2 key cities, highlighting opportunities for expansion beyond current hotspots.
# Business impact: Focusing marketing, logistics, and partnerships on these top cities can maximize revenue and improve operational efficiency.