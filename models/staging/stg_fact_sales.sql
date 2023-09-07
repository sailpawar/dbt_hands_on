with required_columns as(
    select
    {{ dbt_utils.generate_surrogate_key(['PROFIT_CENTER']) }} as fk_surr_pc_id,
    {{ dbt_utils.generate_surrogate_key(['TRANSACTION_MONTH','YEAR']) }} as fk_surr_trans_id,
    {{ dbt_utils.generate_surrogate_key(['CUSTOMER']) }} as fk_surr_cust_id,
    SALES_PERSON,
    SALES_TARGET,
    ACTUAL_SALES
    from {{ ref('stg_initial') }}
) select * from required_columns