select count(*) from {{ ref('dim_date') }}
where year_number = 2020
and MONTH_NAME_SHORT = 'Jan'