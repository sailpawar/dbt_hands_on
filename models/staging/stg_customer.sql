with 
required_cust_columns as(
    select distinct
            UNIQUE_FOR_EACH_ROW,
            {{ dbt_utils.generate_surrogate_key(['CUSTOMER']) }} as surr_cust_id,
            customer,
            customer_contact_fn,
            customer_contact_ln,
            customer_name,
            customer_phone,
            coalesce(customer_address_1 || ', ' ,' ')  || coalesce(customer_address_2,' ') as customer_address,
            customer_city,
            customer_state,
            customer_zip,
            customer_country,
            customer_category
    from 
            {{ ref('source_scd_2') }}
    where 
            DBT_VALID_TO is null

),
lookup as(
select customer , max(UNIQUE_FOR_EACH_ROW) as cust_latest_vals_on_row from required_cust_columns
group by 
customer
)

select 
    rcc.surr_cust_id,
    rcc.customer,
    rcc.customer_contact_fn,
    rcc.customer_contact_ln,
    rcc.customer_name,
    rcc.customer_phone,
    rcc.customer_address,
    rcc.customer_city,
    rcc.customer_state,
    rcc.customer_zip,
    rcc.customer_country,
    rcc.customer_category
from 
    required_cust_columns rcc 
join 
    lookup lkp 
on
    lkp.cust_latest_vals_on_row = rcc.UNIQUE_FOR_EACH_ROW
