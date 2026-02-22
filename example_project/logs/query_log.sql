-- created_at: 2026-02-22T20:04:16.376213128+00:00
-- finished_at: 2026-02-22T20:04:19.891689127+00:00
-- elapsed: 3.5s
-- outcome: success
-- dialect: bigquery
-- node_id: not available
-- query_id: FDaEn74wsZ77vY75kK3WhRzCnvm
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "example_analytics", "target_name": "dev"} */

    select distinct schema_name from `dbt-bigquery-integration`.INFORMATION_SCHEMA.SCHEMATA;
  ;
-- created_at: 2026-02-22T20:04:19.957356775+00:00
-- finished_at: 2026-02-22T20:04:23.003967044+00:00
-- elapsed: 3.0s
-- outcome: success
-- dialect: bigquery
-- node_id: model.dbt_02_21_26_project.stg_customer_orders
-- query_id: Ajd3lfgKFMBG05meUC4cRSIS8gP
-- desc: get_relation > list_relations call
SELECT
    table_catalog,
    table_schema,
    table_name,
    table_type
FROM 
    `dbt-bigquery-integration`.`dbt_02_21_26_staging`.INFORMATION_SCHEMA.TABLES;
-- created_at: 2026-02-22T20:04:23.008676498+00:00
-- finished_at: 2026-02-22T20:04:25.462268380+00:00
-- elapsed: 2.5s
-- outcome: success
-- dialect: bigquery
-- node_id: model.dbt_02_21_26_project.stg_customer_orders
-- query_id: t8yZVTUkMTd0XcHXEAVED1TWQGk
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.dbt_02_21_26_project.stg_customer_orders", "profile_name": "example_analytics", "target_name": "dev"} */


  create or replace view `dbt-bigquery-integration`.`dbt_02_21_26_staging`.`stg_customer_orders`
  OPTIONS()
  as with customers as (

    select * from `dbt-bigquery-integration`.`dbt_02_21_26`.`dev_customers`

),

orders as (

    select * from `dbt-bigquery-integration`.`dbt_02_21_26`.`dev_orders`

),

customer_orders as (

    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by 1

),

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (customer_id)

)

select * from final;

;
