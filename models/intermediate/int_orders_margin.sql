select orders_id, date_date, 
ROUND(sum(sales_margin.revenue),2) as revenue,
ROUND(sum(sales_margin.quantity),2) as quantity,
ROUND(sum(sales_margin.purchase_cost),2) as purchase_cost,
ROUND(sum(sales_margin.margin),2) as margin
from {{ref("int_sales_margin")}} as sales_margin
group by sales_margin.orders_id, sales_margin.date_date
order by orders_id DESC