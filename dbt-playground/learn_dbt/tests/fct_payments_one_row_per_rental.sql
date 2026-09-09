select
  rental_id,
  count(*) as cnt
from {{ ref('fct_payments') }}
group by 1
having count(*) > 1
