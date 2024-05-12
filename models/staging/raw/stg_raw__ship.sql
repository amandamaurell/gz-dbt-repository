with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        logCost AS log_cost,
        CAST(ship_cost AS float64) AS ship_cost -- when casting a new dtype, we need to rename the table

    from source

)

select * from renamed
