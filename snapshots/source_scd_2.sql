{% snapshot source_scd_2 %}
    {{
        config(
          target_schema='snapshots',
          strategy='check',
          unique_key='TRACK_ID',
          check_cols=['UNIQUE_FOR_EACH_ROW']
        )
    }}
    select * from {{ source('sail', 'raw_sales_data') }}

{% endsnapshot %}