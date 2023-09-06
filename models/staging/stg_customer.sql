with 
required_cust_columns as(
    select
            {{ dbt_utils.generate_surrogate_key(['CUSTOMER']) }} as cust_surr_id,
            customer,
            customer_contact_fn,
            customer_contact_ln,
            customer_name,
            customer_phone,
            -- customer_address_1 || ', ' || coalesce(customer_address_2,'.') as customer_address,
            customer_address_1,
            customer_address_2,
            customer_city,
            customer_state,
            customer_zip,
            customer_country,
            customer_category
    from 
            {{ source('sail', 'raw_sales_data') }}
    group by 
            cust_surr_id,
            customer,
            customer_contact_fn,
            customer_contact_ln,
            customer_name,
            customer_phone,
            -- customer_address,
            customer_address_1,
            customer_address_2,
            customer_city,
            customer_state,
            customer_zip,
            customer_country,
            customer_category

)
select * from required_cust_columns