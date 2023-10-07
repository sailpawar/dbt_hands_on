with useless_dependency as(
    select * from {{ ref('source_scd_2') }} limit 1
),
date_dim as(
    {{dbt_date.get_date_dimension("2015-01-01","2035-01-01")}}
)
select * from date_dim