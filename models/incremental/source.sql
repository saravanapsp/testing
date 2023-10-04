{{config 
(
    materialized = 'table'
)
}}

with source_table
    as 
    (
    select 
    s_id,
    name,
    collage_name,
    age,
    POY,
    created_date,
    modified_date
     
     from {{ source('incremental','source_table') }}

     )

select * from source_table