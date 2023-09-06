with required_columns as (
    select 
            tmy.year,
            tmy.transaction_month,
            fs.SALES_PERSON,
            fs.SALES_TARGET,
            sum(fs.ACTUAL_SALES) as actual_sales

    from {{ ref('stg_fact_sales') }} fs
    join
    {{ ref('stg_transaction_month_year') }} tmy
    on
    fs.FK_SURR_TRANS_ID = tmy.TRANS_ROW_ID

    group by
            fs.SALES_PERSON,
            fs.SALES_TARGET,
            tmy.transaction_month,
            tmy.year

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