

with raw_sales as (
    select {{ dbt_utils.generate_surrogate_key(['PROFIT_CENTER','TRANSACTION_MONTH','YEAR','SALES_PERSON','CUSTOMER']) }} as row_id
    ,* 
    from {{ source('sail', 'raw_sales_data') }}

)
-- select row_id, count(*) from raw_sales
-- group by row_id
-- order by count(*) desc

select * from raw_sales
-- where row_id = 'd77461a4254b791c6222134993851d9a'
-- where customer = 'C2'
