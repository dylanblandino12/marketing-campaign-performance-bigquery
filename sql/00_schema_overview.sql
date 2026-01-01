-- =====================================
-- File: 00_schema_overview.sql
-- Purpose: Document the logical data model and table relationships
-- Dataset: Marketing Campaign Performance
-- Tool: Google BigQuery
-- =====================================


-- =====================================
-- Logical Data Model Overview
-- =====================================

-- Source table:
-- raw_campaign_data
-- Description: Raw marketing campaign performance data loaded from Kaggle.

-- Fact table:
-- fact_campaign_performance
-- Grain: One record per campaign, channel, and date.
-- Metrics: Clicks, Impressions, Conversion_Rate, Acquisition_Cost, ROI, Engagement_Score

-- Dimension tables:
-- dim_campaign
-- Description: Campaign attributes such as type, audience, duration, and segment.

-- dim_channel
-- Description: Marketing execution channel and geographical attributes.

-- dim_date
-- Description: Calendar attributes derived from campaign date.

-- Notes:
-- The dataset was normalized into fact and dimension tables to support
-- scalable analytics and join-based queries in BigQuery.
