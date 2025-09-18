
  create view "analytics"."marts"."fct_marketing_spend_daily__dbt_tmp"
    
    
  as (
    with g as (
  select day, campaign_id, impressions, clicks, cost_usd from "analytics"."staging"."stg_google_ads"
),
f as (
  select day, campaign_id, impressions, clicks, cost_usd from "analytics"."staging"."stg_fb_ads"
),
u as (
  select * from g
  union all
  select * from f
)
select
  day,
  campaign_id,
  sum(impressions) as impressions,
  sum(clicks) as clicks,
  sum(cost_usd) as ad_spend_usd
from u
group by 1,2
order by 1,2
  );