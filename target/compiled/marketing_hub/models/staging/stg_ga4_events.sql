with src as (
  select
    event_date::date as day,
    user_pseudo_id,
    event_name,
    event_value::numeric(18,6) as value,
    session_id
  from "analytics"."raw"."ga4_events"
)
select * from src