with required_columns as (
    select 
            year,
            transaction_month_in_number,
            SALES_PERSON,
            SALES_TARGET,
            sum(ACTUAL_SALES) as actual_sales

    from {{ ref('stg_fact_sales') }} 

    group by
            SALES_PERSON,
            SALES_TARGET,
            transaction_month_in_number,
            year

),
final_output as(
    select 
            *,
            case 
                when
                    actual_sales >= SALES_TARGET then 'true' 
                else 'false'
            end
            as target_achieved
from required_columns
)

select * from final_output
order by year, transaction_month_in_number