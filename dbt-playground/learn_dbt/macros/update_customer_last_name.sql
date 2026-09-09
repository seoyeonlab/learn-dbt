{% macro update_customer_last_name() -%}
    {% set sql %}
    UPDATE {{ source('dvdrental', 'customer') }} 
    SET last_name='PARK', last_update=NOW()
    WHERE customer_id=1
    {% endset %}
    {% do run_query(sql) %}
{%- endmacro %}

-- SELECT * FROM dvdrental.customer_snapshot ORDER BY customer_id ASC
