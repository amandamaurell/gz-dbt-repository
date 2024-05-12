-- calculate Operational margin per order 
-- Operational margin = margin + shipping fee - log_cost - ship_cost
select orders_margin.orders_id,
date_date, 
ROUND((margin + shipping_fee - log_cost - ship_cost), 2) as operational_margin,
revenue, quantity, purchase_cost, margin, 
shipping_fee, log_cost, ship_cost
from {{ ref("int_orders_margin") }} as orders_margin
inner join {{ ref("stg_raw__ship") }} as ship 
-- on orders_margin.orders_id = ship.orders_id
using(orders_id) -- an alternative to the ON fk = pk syntax
order by orders_id desc
