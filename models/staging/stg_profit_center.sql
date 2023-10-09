with scd_profit_center as (
    select distinct
        {{ dbt_utils.generate_surrogate_key(['PROFIT_CENTER']) }} as surr_pc_id,
        UNIQUE_FOR_EACH_ROW,
        PROFIT_CENTER,
        PROFIT_CENTER_DESCRIPTION,
        PROFIT_CENTER_MANAGER
    from
        {{ ref('source_scd_2') }}
    where 
        DBT_VALID_TO is null
),
lookup as(
select PROFIT_CENTER , max(UNIQUE_FOR_EACH_ROW) as profit_center_latest_vals_on_row from scd_profit_center
group by 
PROFIT_CENTER
)
select 
    spc.surr_pc_id,
    spc.PROFIT_CENTER,
    spc.PROFIT_CENTER_DESCRIPTION,
    spc.PROFIT_CENTER_MANAGER
from 
    scd_profit_center spc
join
    lookup lkp 
on
    lkp.profit_center_latest_vals_on_row = spc.UNIQUE_FOR_EACH_ROW

    