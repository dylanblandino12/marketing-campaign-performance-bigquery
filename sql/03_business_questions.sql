-- =====================================
-- File: 03_business_questions.sql
-- Purpose: Answer key business questions using SQL
-- Dataset: Marketing Campaign Performance
-- Tool: Google BigQuery
-- =====================================

-- Q1: Which marketing channel delivers the highest average ROI?

SELECT
  Channel_Used,
  ROUND(AVG(ROI),2) AS avg_roi
FROM `marketing_campaign_performance.raw_campaign_data`
GROUP BY Channel_Used
ORDER BY avg_roi DESC
LIMIT 1;

-- Insight: Facebook delivers the highest average ROI among all channels, indicating stronger return efficiency compared to other platforms.


-- Q2: Which marketing channel has the lowest average CPC?

SELECT 
  Channel_Used,
  ROUND(AVG(SAFE_DIVIDE(Acquisition_Cost, Clicks)),2) AS CPC
FROM `marketing_campaign_performance.raw_campaign_data`
GROUP BY Channel_Used
ORDER BY CPC;

-- Insight: Website shows the lowest average CPC among all marketing channels.


