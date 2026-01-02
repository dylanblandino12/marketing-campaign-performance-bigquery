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


-- Q5: Which marketing channel has the highest average click-through rate (CTR)?


SELECT
  Channel_Used,
  ROUND(AVG(SAFE_DIVIDE(Clicks, Impressions)),2) AS CTR
FROM `marketing_campaign_performance.raw_campaign_data`
GROUP BY Channel_Used
ORDER BY CTR DESC

-- Insight: Average CTR is identical across all marketing channels, indicating no channel-level differentiation in click-through performance.


-- Q6: Which marketing channel has the highest average acquisition cost?

SELECT
  Channel_Used,
  ROUND(AVG(Acquisition_Cost),2) AS avg_acq_cost
FROM `marketing_campaign_performance.raw_campaign_data`
GROUP BY Channel_Used
ORDER BY avg_acq_cost DESC
LIMIT 1;  

-- Insight: Google Ads shows the highest average acquisition cost, indicating higher upfront investment compared to other marketing channels.


-- Q7: Which marketing channel shows the highest average ROI relative to its acquisition cost?

SELECT 
  Channel_Used,
  ROUND(AVG(ROI),2) AS avg_roi,
  ROUND(AVG(Acquisition_Cost), 2) AS avg_acq_cost
FROM `marketing_campaign_performance.raw_campaign_data`
GROUP BY Channel_Used
ORDER BY avg_roi, avg_acq_cost DESC
LIMIT 1;

-- Insight: Instagram shows a high average ROI, but also requires a high acquisition cost, indicating profitability driven by higher investment rather than cost efficiency.


-- Q8: Which marketing channel shows the most consistent ROI performance?

SELECT
  Channel_Used,
  ROUND(STDDEV_POP(ROI),2) as roi_inconsistency
FROM `marketing_campaign_performance.raw_campaign_data`
GROUP BY Channel_Used
ORDER BY roi_inconsistency 
LIMIT 1;

-- Insight: Google Ads shows the most consistent ROI performance, indicating lower variability and more predictable returns across campaigns.
