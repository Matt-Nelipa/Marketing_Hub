
    
    

select
    day as unique_field,
    count(*) as n_records

from "analytics"."marts"."fct_site_events_daily"
where day is not null
group by day
having count(*) > 1


