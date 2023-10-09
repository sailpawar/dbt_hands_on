with required_columns as(
    select
    {{ dbt_utils.generate_surrogate_key(['PROFIT_CENTER']) }} as fk_surr_pc_id,
    {{ dbt_utils.generate_surrogate_key(['CUSTOMER']) }} as fk_surr_cust_id,
    SALES_PERSON,
    SALES_TARGET,
    ACTUAL_SALES,
    {{month_short_to_day('TRANSACTION_MONTH')}} as transaction_month_in_number,
    year
    from {{ ref('source_scd_2') }}
) select * from required_columns

