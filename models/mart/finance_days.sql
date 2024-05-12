
/*Daily Transaction Evolution:

Tracking the number of transactions (orders) that occur each day.

Daily Average Basket Evolution:

Monitoring the average basket amount for each day.

Daily Margin and Operational Margin Evolution:

Observing the evolution of both margin and operational margin on a daily basis.*/


SELECT date_date,
ROUND(COUNT(*),1) AS nb_transactions,
ROUND(SUM(revenue),1) AS revenue,
ROUND(AVG(revenue),1) AS average_basket, 
ROUND(SUM(margin),1) AS margin, 
ROUND(SUM(operational_margin),1) AS operational_margin,
ROUND(SUM(purchase_cost),0) AS purchase_cost, 
ROUND(SUM(shipping_fee),0) AS shipping_fee, 
ROUND(SUM(log_cost),0) AS log_cost, 
ROUND(SUM(ship_cost),0) AS ship_cost, 
SUM(quantity) AS quantity 
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date DESC