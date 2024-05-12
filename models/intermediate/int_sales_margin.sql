with sales_margin as (select sales.date_date,
sales.orders_id, sales.products_id, sales.revenue, sales.quantity,
cast(product.purchase_price as float64) as purchase_price, 
cast(sales.quantity as int64) * cast(product.purchase_price as float64) as purchase_cost
-- select tables with the name of the model generated before
from {{ref("stg_raw__sales")}} as sales 
inner join {{ref("stg_raw__product")}} as product
on sales.products_id = product.products_id)
select *,
cast(revenue as float64) - purchase_cost as margin
from sales_margin
