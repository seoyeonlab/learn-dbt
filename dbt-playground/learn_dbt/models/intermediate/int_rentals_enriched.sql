with rentals as (
  select * from {{ ref('stg_rental') }}
),
payments as (
  select * from {{ ref('stg_payment') }}
),
inventory as (
  select * from {{ ref('stg_inventory') }}
),
films as (
  select * from {{ ref('stg_film') }}
)

select
  r.rental_id,
  r.rental_date,
  r.return_date,
  r.customer_id,
  r.staff_id,

  i.store_id,
  i.film_id,

  f.title as film_title,
  f.rental_rate,
  f.rating,

  -- total paid for that rental (can be multiple payments)
  coalesce(sum(p.amount), 0) as rental_amount
from rentals r
left join payments p
  on p.rental_id = r.rental_id
left join inventory i
  on i.inventory_id = r.inventory_id
left join films f
  on f.film_id = i.film_id
group by
  r.rental_id, r.rental_date, r.return_date, r.customer_id, r.staff_id,
  i.store_id, i.film_id,
  f.title, f.rental_rate, f.rating
