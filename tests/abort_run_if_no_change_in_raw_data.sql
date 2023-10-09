{{
    config(
        fail_calc = "RowCountResult",
        error_if = '=1',
        warn_if = '<0'
    )
}}

SELECT 
       CASE WHEN 
                (select max(UNIQUE_FOR_EACH_ROW) from {{ source('sail', 'raw_sales_data') }})
                =
                (select max(UNIQUE_FOR_EACH_ROW) from DBT_WORKSHOP_ASSESSMENT_BATCH_2.snapshots.source_scd_2
            THEN 1
            ELSE 0
       END AS RowCountResult