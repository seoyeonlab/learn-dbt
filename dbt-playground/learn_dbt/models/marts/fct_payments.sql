{{ config(
    materialized='incremental',
    unique_key='rental_id'
) }}

with enriched as (
  select *
  from {{ ref('int_rentals_enriched') }}

  {% if is_incremental() %}
    -- Look back a bit to handle late-arriving payments/returns.
    -- Tune the interval for your environment (e.g., '1 day', '7 days').
    {{ log ("Running incrementally with lookback interval: " ~ var('lookback_interval', '7 days'), info=True) }}

    where rental_date >= (
      select coalesce(max(rental_date), timestamp '1900-01-01') from {{ this }}
    ) - interval '{{ var('lookback_interval', '7 days') }}'
  {% endif %}
),

customers as (
  select * from {{ ref('dim_customer') }}
),

films as (
  select * from {{ ref('dim_film') }}
)

select
  -- Grain: 1 row per rental
  e.rental_id,

  c.customer_sk,
  f.film_sk,

  e.store_id,
  e.staff_id,

  e.rental_date,
  e.return_date,

  e.rental_amount as amount_paid
from enriched e
left join customers c on c.customer_id = e.customer_id
left join films f on f.film_id = e.film_id
