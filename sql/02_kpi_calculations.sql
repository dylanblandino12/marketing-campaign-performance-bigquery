-- =====================================
-- File: 02_kpi_calculations.sql
-- Purpose: Calculate, validate, and derive marketing KPIs
-- Dataset: Marketing Campaign Performance
-- Tool: Google BigQuery
-- =====================================

-- Create base campaign performance dataset with calculated KPIs (CTR, CPC)
-- Acquisition_Cost is treated as campaign cost for efficiency metrics


WITH campaign_performance_cte AS (
  SELECT
    Campaign_ID,
    Channel_Used,
    Impressions,
    Clicks,
    Conversion_Rate,
    Acquisition_Cost,
    ROI,
    ROUND(SAFE_DIVIDE(Acquisition_Cost, Clicks),2) AS CPC,
    ROUND(SAFE_DIVIDE(Clicks, Impressions),2) AS CTR
  FROM `marketing_campaign_performance.raw_campaign_data`
)
-- Quick sanity check
SELECT
  MIN(cpc) AS min_cpc,
  MAX(cpc) AS max_cpc,
  MIN(ctr) AS min_ctr,
  MAX(ctr) AS max_ctr
FROM campaign_performance_cte;


-- =====================================
-- Purpose: Calculate average marketing KPIs by channel
-- Description:
-- This query aggregates campaign-level KPIs to the channel level
-- to establish baseline performance metrics for comparison.
--
-- Metrics included:
-- - Average CTR: Measures average click-through efficiency per channel.
-- - Average CPC: Measures average cost efficiency per channel.
-- - Average ROI: Measures average return on investment per channel.
--
-- Notes:
-- - Metrics are averaged across campaigns without ranking or filtering.
-- - Results are intended as neutral baseline metrics, not business conclusions.
-- - These aggregates will be used later to answer business questions.

WITH campaign_performance AS (
  SELECT
    Campaign_ID,
    Channel_Used,
    SAFE_DIVIDE(Clicks, Impressions) AS ctr,
    SAFE_DIVIDE(Acquisition_Cost, Clicks) AS cpc,
    ROI
  FROM marketing_campaign_performance.raw_campaign_data
)

SELECT
  Channel_Used,
  AVG(ctr) AS avg_ctr,
  AVG(cpc) AS avg_cpc,
  AVG(ROI) AS avg_roi
FROM campaign_performance
GROUP BY Channel_Used;
