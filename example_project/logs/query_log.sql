-- created_at: 2026-02-22T15:47:06.858518962+00:00
-- finished_at: 2026-02-22T15:47:10.355162191+00:00
-- elapsed: 3.5s
-- outcome: success
-- dialect: bigquery
-- node_id: not available
-- query_id: CLBbvQ4ptTBRm3WWiDjjr5TcLyl
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "example_analytics", "target_name": "dev"} */

    select distinct schema_name from `dbt-bigquery-integration`.INFORMATION_SCHEMA.SCHEMATA;
  ;
-- created_at: 2026-02-22T15:47:10.729520341+00:00
-- finished_at: 2026-02-22T15:47:13.360639886+00:00
-- elapsed: 2.6s
-- outcome: success
-- dialect: bigquery
-- node_id: model.dbt_02_21_26_project.dev_orders
-- query_id: 9scgVPvgSdlXmxUsue8qJCiE5rq
-- desc: get_relation > list_relations call
SELECT
    table_catalog,
    table_schema,
    table_name,
    table_type
FROM 
    `dbt-bigquery-integration`.`dbt_02_21_26`.INFORMATION_SCHEMA.TABLES;
-- created_at: 2026-02-22T15:47:10.733540390+00:00
-- finished_at: 2026-02-22T15:47:13.609979125+00:00
-- elapsed: 2.9s
-- outcome: success
-- dialect: bigquery
-- node_id: model.dbt_02_21_26_project.dev_customers
-- query_id: j30hVKjFnDyzrXTGIgvPz36ZJDA
-- desc: get_relation > list_relations call
SELECT
    table_catalog,
    table_schema,
    table_name,
    table_type
FROM 
    `dbt-bigquery-integration`.`dbt_02_21_26`.INFORMATION_SCHEMA.TABLES;
-- created_at: 2026-02-22T15:47:13.618096693+00:00
-- finished_at: 2026-02-22T15:47:15.310843130+00:00
-- elapsed: 1.7s
-- outcome: success
-- dialect: bigquery
-- node_id: model.dbt_02_21_26_project.dev_customers
-- query_id: LhLIlbWSBDlIRnzEAU4sTfFNiem
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_02_21_26_project.dev_customers", "profile_name": "example_analytics", "target_name": "dev"} */


  create or replace view `dbt-bigquery-integration`.`dbt_02_21_26`.`dev_customers`
  OPTIONS()
  as     select
        id as customer_id,
        first_name,
        last_name
    from `dbt-tutorial`.jaffle_shop.customers
;

;
-- created_at: 2026-02-22T15:47:13.368491542+00:00
-- finished_at: 2026-02-22T15:47:15.317158178+00:00
-- elapsed: 1.9s
-- outcome: success
-- dialect: bigquery
-- node_id: model.dbt_02_21_26_project.dev_orders
-- query_id: YJIKO15u3mwfmSUCS6dNb6UWH1V
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_02_21_26_project.dev_orders", "profile_name": "example_analytics", "target_name": "dev"} */


  create or replace view `dbt-bigquery-integration`.`dbt_02_21_26`.`dev_orders`
  OPTIONS()
  as 

  select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from `dbt-tutorial`.jaffle_shop.orders;

;
