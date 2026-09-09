select
  film_id,
  title,
  release_year,
  rental_duration,
  rental_rate::numeric as rental_rate,
  length,
  replacement_cost::numeric as replacement_cost,
  rating,
  last_update
from {{ source('dvdrental', 'film') }}
