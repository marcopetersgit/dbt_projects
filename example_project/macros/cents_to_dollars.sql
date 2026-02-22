-- macros/cents_to_dollars.sql
-- Convert cents to dollars

{% macro cents_to_dollars(column_name) -%}
    ({{ column_name }} / 100.0)
{%- endmacro %}
