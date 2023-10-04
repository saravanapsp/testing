{{config 
(
    materialized = "incremental",
    unique_key = "s_id"
  )
  
}}
with
    source_table as (
        select s_id, name, created_date, modified_date
        from {{ ref("source") }}
        {% if is_incremental() %}
            where
            modified_date
                >= (select dateadd(day, -3, max(modified_date)) from {{ this }})
        {% endif %}
    )

select *
from source_table
