{% snapshots_cus_history %}

{{
   config (
    target_schema = 'STG',
    unique_key = 's_id',
    strategy = 'timestamp',
    modified_date = 'modified_date'
   )

}}

select * from {{source('incremental','source_table')}}

{% endsnapshots %}