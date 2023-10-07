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
            customer_category,
            DBT_VALID_TO
    from 
            {{ ref('source_scd_2') }}

) --,
select * from required_cust_columns order by UNIQUE_FOR_EACH_ROW