with payment as 
(select
    id as payment_id,
    order_id as order_id,
    paymentmethod as payment_method,
    amount / 100 as amount,
    status,
    created as created_at

from {{source('stripe','payment')}}
)

select * from payment