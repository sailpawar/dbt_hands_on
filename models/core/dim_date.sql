

with date_dimension as (
    select 
        DATE_DAY, --2010-01-01
        PRIOR_DATE_DAY,     
        NEXT_DATE_DAY,
        DAY_OF_WEEK, --6
        DAY_OF_WEEK_ISO, --5
        DAY_OF_WEEK_NAME, --Friday
        DAY_OF_MONTH, --1
        DAY_OF_YEAR, --1
        WEEK_START_DATE,  --sun
        WEEK_END_DATE,    --sat
        WEEK_OF_YEAR, --53
        ISO_WEEK_START_DATE, --mon
        ISO_WEEK_END_DATE, --sun
        ISO_WEEK_OF_YEAR, --53
        MONTH_OF_YEAR,  --1
        MONTH_NAME, --January
        MONTH_NAME_SHORT, --Jan
        MONTH_START_DATE,
        MONTH_END_DATE,
        QUARTER_OF_YEAR, --1
        QUARTER_START_DATE,
        QUARTER_END_DATE,
        YEAR_NUMBER, --2010
        YEAR_START_DATE,
        YEAR_END_DATE


     from {{ ref('stg_date') }}
)
    select * from date_dimension