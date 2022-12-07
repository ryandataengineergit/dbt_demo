{% snapshot orders_snapshot %}

    {{
        config
(
          target_schema='snapshot_dev',
          unique_key='id',
          
          strategy='check',
          check_cols=['status'],
        )
    }}

-- Pro-Tip: Use sources in snapshots!
select * from {{ source('raw','raw_orders') }}
    
{% endsnapshot %}