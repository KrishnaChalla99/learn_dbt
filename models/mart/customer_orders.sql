with orders as (
    select *
    from {{ ref('fct_orders') }}
),
customers as (
    select *
    from {{ ref('dim_customers') }}
)
select o.order_id,
    o.customer_id,
    o.order_status,
    c.zipcode as customer_zipcode,
    c.city as customer_city,
    c.state_code as customer_state_code,
    c.state_name as customer_state_name
from orders o
    join customers c on o.customer_id = c.customer_id