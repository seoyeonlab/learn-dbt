select
  {{ surrogate_key(['film_id']) }} as film_sk,
  film_id,
  title,
  release_year,
  rental_duration,
  rental_rate,
  rating
from {{ ref('stg_film') }}
