{{ config(materialized='table') }}

with orders as (
    select *
    from dev.raw.orders
)
select * from orders
