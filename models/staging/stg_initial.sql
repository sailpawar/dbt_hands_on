

with raw_sales as (
    select {{ dbt_utils.generate_surrogate_key(['PROFIT_CENTER','TRANSACTION_MONTH','YEAR','SALES_PERSON','CUSTOMER']) }} as row_id
    ,* 
    from {{ source('sail', 'raw_sales_data') }}

)


select * from raw_sales

