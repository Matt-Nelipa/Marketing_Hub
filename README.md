# Marketing & Ads Data Hub

**Problem:** Marketing and product teams often waste hours reconciling Google Analytics, Google Ads and Facebook Ads data in Excel, without a clear view of CAC, ROAS, or customer LTV.

**Solution:** This project demonstrates a reproducible modern data stack:
- **EL:** Airbyte (GA4, Google Ads, Facebook Ads → PostgreSQL)
- **DWH:** PostgreSQL
- **Transform:** dbt (staging + marts with tests and documentation)
- **BI:** Metabase dashboard (ROAS, CAC, LTV, cohorts)
- **Orchestration:** Prefect (daily refresh flow)

**Key Features**
- Unified spend + events + revenue tables
- Incremental dbt models
- Data quality checks (dbt tests)
- Dashboard with ROAS, CAC, LTV and funnel metrics

## Project Structure
(will be filled in)