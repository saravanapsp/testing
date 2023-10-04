with orders as
(
   select * from {{ref('stg_orders')}}

),

payment as 
(
    select * from {{ref('stg_payment')}}
),

orders_payment as 
(
    select 
        order_id,
        sum(case when status = 'success' then amount end) as amount
        from payment
        group by 1
),

final as 
(
    select 
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders_payment.amount
        from orders

        left join  orders_payment using (order_id)
)

select * from final