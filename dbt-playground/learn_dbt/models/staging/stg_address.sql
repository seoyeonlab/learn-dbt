select
  address_id,
  address,
  address2,
  district,
  city_id,
  postal_code,
  phone
from {{ source('dvdrental', 'address') }}
