with transaction_data as(
    select 
            {{ dbt_utils.generate_surrogate_key(['TRANSACTION_MONTH','YEAR']) }} as trans_row_id,
            transaction_month, 
            year 
    from 
            {{ ref('stg_initial') }}
    group by 
            trans_row_id,
            transaction_month,
            year

)
select 
        td.trans_row_id,
        td.transaction_month,
        td.year, 
        dd.MONTH_START_DATE,
        dd.MONTH_END_DATE,
        dd.QUARTER_OF_YEAR
from 
        transaction_data td
join
        {{ ref('dim_date') }} dd
on 
        td.transaction_month = dd.MONTH_NAME_SHORT
        and 
        td.year = dd.year_number
        and 
        dd.DAY_OF_MONTH = 1
