with spend as (select * from "analytics"."marts"."fct_marketing_spend_daily"),
site  as (select * from "analytics"."marts"."fct_site_events_daily")
select
  coalesce(site.day, spend.day) as day,
  sum(spend.ad_spend_usd)      as ad_spend_usd,
  sum(site.revenue_usd)        as revenue_usd,
  case when sum(spend.ad_spend_usd)=0 then null
       else sum(site.revenue_usd)/sum(spend.ad_spend_usd) end as roas,
  sum(site.purchases)          as purchases,
  case when sum(site.purchases)=0 then null
       else sum(spend.ad_spend_usd)::numeric / sum(site.purchases) end as cac
from spend
full join site on spend.day = site.day
group by 1
order by 1