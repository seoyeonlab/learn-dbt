{{ config(
    materialized='table'
) }}

select
  {{ surrogate_key(['customer_id']) }} as customer_sk,
  customer_id,
  store_id,
  first_name,
  last_name,
  email,
  is_active,
  create_date
from {{ ref('stg_customer') }}
