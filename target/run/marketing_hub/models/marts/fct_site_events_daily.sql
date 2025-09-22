
  create view "analytics"."marts"."fct_site_events_daily__dbt_tmp"
    
    
  as (
    with agg as (
  select
    day,
    count(*) filter (where event_name='session_start') as sessions,
    count(*) filter (where event_name='add_to_cart')  as add_to_cart,
    count(*) filter (where event_name='purchase')     as purchases,
    sum(value)  filter (where event_name='purchase')  as revenue_usd
  from "analytics"."staging"."stg_ga4_events"
  group by 1
)
select * from agg order by day
  );