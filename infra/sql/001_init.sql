-- Schemas
create schema if not exists raw;
create schema if not exists staging;
create schema if not exists marts;

-- Roles
do $$ begin create role etl login password '${ETL_PASSWORD}'; exception when duplicate_object then null; end $$;
do $$ begin create role bi_reader login password '${BI_PASSWORD}'; exception when duplicate_object then null; end $$;

-- Grants
grant usage on schema raw, staging, marts to etl, bi_reader;
grant create on schema staging, marts to etl;
grant select on all tables in schema raw, staging, marts to bi_reader;
alter default privileges in schema raw grant select on tables to bi_reader;
alter default privileges in schema staging grant select on tables to bi_reader;
alter default privileges in schema marts grant select on tables to bi_reader;