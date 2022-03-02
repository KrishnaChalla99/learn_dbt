{{ config(materialized='table') }}

with customers as (
    select *
    from dev.raw.customer
),
state as (
    select *
    from dev.raw.state
)
select c.customer_id,
    c.zipcode,
    c.city,
    c.state_code,
    s.state_name,
    c.datetime_created,
    c.datetime_updated
from customers c
    join state s on c.state_code = s.state_code