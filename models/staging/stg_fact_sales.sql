with required_columns as(
    select
    {{ dbt_utils.generate_surrogate_key(['PROFIT_CENTER']) }} as fk_surr_pc_id,
    {{ dbt_utils.generate_surrogate_key(['CUSTOMER']) }} as fk_surr_cust_id,
    SALES_PERSON,
    cast(SALES_TARGET as decimal(8,2)) as SALES_TARGET,
    cast(ACTUAL_SALES as decimal(8,2)) as ACTUAL_SALES,
    {{month_short_to_day('TRANSACTION_MONTH')}} as transaction_month_in_number,
    cast(year as int) as year
    from {{ ref('source_scd_2') }}
) select * from required_columns


