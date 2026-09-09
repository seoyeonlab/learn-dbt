{% macro update_address_address() -%}
    {% set sql %}
    UPDATE {{ source('dvdrental', 'address') }} 
    SET address='46 MySakila Drive'
    WHERE address_id=1
    {% endset %}
    {% do run_query(sql) %}
{%- endmacro %}

-- SELECT * FROM dvdrental.address_snapshot ORDER BY address_id ASC
