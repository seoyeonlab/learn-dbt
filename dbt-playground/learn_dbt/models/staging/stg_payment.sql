select
  payment_id,
  customer_id,
  staff_id,
  rental_id,
  amount::numeric as amount,
  payment_date
from {{ source('dvdrental', 'payment') }}
