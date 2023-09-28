{% macro month_short_to_day(month) %}

    case 
        when {{month}} = 'Jan' then 1
        when {{month}} = 'Feb' then 2
        when {{month}} = 'March' then 3
        when {{month}} = 'April' then 4
        when {{month}} = 'May' then 5
        when {{month}} = 'June' then 6
        when {{month}} = 'July' then 7
        when {{month}} = 'August' then 8
        when {{month}} = 'September' then 9
        when {{month}} = 'Oct' then 10
        when {{month}} = 'Nov' then 11
        when {{month}} = 'Dec' then 12
        else null
        end

{% endmacro %}