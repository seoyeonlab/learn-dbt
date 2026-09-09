{% macro safe_trim(expr) -%}
  nullif(trim({{ expr }}), '')
{%- endmacro %}

{% macro log_context(title) %}
  {{ log("--" ~ title, info=true) }}
  {{ log("Current target: " ~ target.name, info=true) }}
  {{ log("Schema: " ~ target.schema, info=true) }}
  {{ log("Database: " ~ target.database, info=true) }}
{% endmacro %}
