select *
from {{ ref('fct_payments') }}
where amount_paid < 0
