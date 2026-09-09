select
  customer_id,
  store_id,
  {{ safe_trim('first_name') }} as first_name,
  {{ safe_trim('last_name') }}  as last_name,
  {{ safe_trim('email') }}      as email,
  activebool as is_active,
  create_date,
  last_update
from {{ source('dvdrental', 'customer') }}
