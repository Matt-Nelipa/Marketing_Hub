with src as (
  select
    date::date as day,
    campaign_id::text,
    campaign_name,
    impressions::bigint,
    clicks::bigint,
    cost::numeric(18,6) as cost_usd
  from "analytics"."raw"."fb_ads_spend"
)
select * from src