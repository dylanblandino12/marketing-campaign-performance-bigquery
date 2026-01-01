-- =====================================
-- File: 01_exploration.sql
-- Purpose: Perform initial data exploration and validation
-- Dataset: Marketing Campaign Performance
-- Tool: Google BigQuery
-- =====================================

-- Check total number of records in the raw dataset

SELECT
  COUNT(*) AS total_records
FROM marketing_campaign_performance.raw_campaign_data;

-- This query confirms the total number of records available for analysis and validates that the raw dataset was loaded successfully.


-- Check date range covered by the dataset

SELECT 
  MIN(Date) AS oldest_date,
  MAX(Date) AS latest_date
FROM marketing_campaign_performance.raw_campaign_data;

-- This query identifies the time range available in the raw dataset, helping define the temporal scope of the analysis.


-- Validate Campaign_ID for null values
SELECT
  COUNT(*) AS null_ids
FROM marketing_campaign_performance.raw_campaign_data
WHERE Campaign_ID IS NULL;

-- Campaign_ID contains no null values, confirming it is a reliable primary identifier for campaign-level analysis and joins.


-- Count distinct marketing campaigns
SELECT
  COUNT(DISTINCT Campaign_ID) AS unique_campaign_ids
FROM marketing_campaign_performance.raw_campaign_data;

-- Observation: The number of unique Campaign_ID values matches the total number of records. This indicates that each row represents a unique campaign rather than
-- repeated measurements over time or across channels.

-- Explore distribution of campaigns by marketing channel
