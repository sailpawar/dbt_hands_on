with scd_profit_center as (
    select distinct
        UNIQUE_FOR_EACH_ROW,
        {{ dbt_utils.generate_surrogate_key(['PROFIT_CENTER']) }} as surr_pc_id,
        PROFIT_CENTER,
        PROFIT_CENTER_DESCRIPTION,
        PROFIT_CENTER_MANAGER,
        DBT_VALID_TO
    from
        {{ ref('source_scd_2') }}
)
select * from scd_profit_center order by UNIQUE_FOR_EACH_ROW