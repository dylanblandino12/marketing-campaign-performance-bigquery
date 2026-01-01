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


-- Q3: Is there a tradeoff between ROI and CPC across marketing channels?

SELECT
  Channel_Used,
  ROUND(AVG(ROI),2) AS avg_roi,
  ROUND(AVG(SAFE_DIVIDE(Acquisition_Cost, Clicks)),2) AS CPC
FROM `marketing_campaign_performance.raw_campaign_data`
GROUP BY Channel_Used
ORDER BY avg_roi, CPC DESC;

-- Insight: ROI and CPC values are relatively consistent across channels, indicating no strong tradeoff between cost efficiency and profitability.


-- Q4: Top 3 Marketing Channels per average engagement score

WITH engagement_score_cte AS(
  SELECT
    Channel_Used,
    ROUND(AVG(Engagement_Score),2) AS avg_engagement
  FROM `marketing_campaign_performance.raw_campaign_data`
  GROUP BY Channel_Used
),
ranking AS(
  SELECT 
    *, RANK() OVER(ORDER BY avg_engagement DESC) AS ranking_engagement
  FROM engagement_score_cte  
)
SELECT 
  Channel_Used,
  avg_engagement,
  ranking_engagement
FROM ranking
WHERE ranking_engagement <=3;

-- Insight: Website shows the highest average engagement score, followed closely by Facebook. Engagement levels across channels are very similar, with marginal differences.


