with customer_base as (
    select
        customer_id,
        first_name,
        last_name,
        email,
        active,
        case
            when active = 1 then 'A'
            else 'I'
        end as status_code
    from {{ source('dvdrental', 'customer') }}
)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    s.status_name,
    s.description as status_description
from customer_base c
left join {{ ref('customer_status') }} s
  on c.status_code = s.status_code
