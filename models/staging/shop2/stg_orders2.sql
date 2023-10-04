with
    orders2 as (
        select 
        id as order_id, 
        user_id as customer_id, 
        order_date

        from {{source('shop2','orders')}}
    )

select * from orders2
