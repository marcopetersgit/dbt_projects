-- created_at: 2026-02-21T22:37:14.963017240+00:00
-- finished_at: 2026-02-21T22:37:18.754662831+00:00
-- elapsed: 3.8s
-- outcome: success
-- dialect: bigquery
-- node_id: not available
-- query_id: rLrKGwvOPYvLfdkVL1IZo5kiC99
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "example_analytics", "target_name": "dev"} */

    select distinct schema_name from `dbt-bigquery-integration`.INFORMATION_SCHEMA.SCHEMATA;
  ;
-- created_at: 2026-02-21T22:37:19.112343986+00:00
-- finished_at: 2026-02-21T22:37:22.424646863+00:00
-- elapsed: 3.3s
-- outcome: success
-- dialect: bigquery
-- node_id: model.dbt_02_21_26_project.customers
-- query_id: vGgQdiPAokiuUzVvteiXNAOQ6O8
-- desc: get_relation > list_relations call
SELECT
    table_catalog,
    table_schema,
    table_name,
    table_type
FROM 
    `dbt-bigquery-integration`.`dbt_02_21_26`.INFORMATION_SCHEMA.TABLES;
