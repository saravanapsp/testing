{{
    config
    (
        materialized = 'incremental',
        unquie_key = ['case_id','name','COLLECTIONDATE']
    )

}}

    select case_id,
status,
name,
COLLECTIONDATE

 from {{source('shop','information')}}

 {% if is_incremental () %}
 where case_id||name||COLLECTIONDATE not in (select case_id||name||COLLECTIONDATE from {{this}})

 {% endif%}
