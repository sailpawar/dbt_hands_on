
with date_dim as(
    {{dbt_date.get_date_dimension("2010-01-01","2040-01-01")}}
)
select * from date_dim