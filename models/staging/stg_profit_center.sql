with 
agg_cols as (
    select
        {{ dbt_utils.generate_surrogate_key(['PROFIT_CENTER']) }} as pc_row_id,         
        PROFIT_CENTER, 
        PROFIT_CENTER_DESCRIPTION, 
        PROFIT_CENTER_MANAGER
    from 
        {{ source('sail', 'raw_sales_data') }}
    group by 
        PROFIT_CENTER,PROFIT_CENTER_DESCRIPTION,PROFIT_CENTER_MANAGER,pc_row_id
    
)

select * from agg_cols