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
-- Description: Denormalized marketing campaign performance dataset loaded from Kaggle.

-- Dataset grain:
-- One record per marketing campaign.
-- Each row contains aggregated performance metrics at campaign level.

-- Metrics available:
-- Clicks
-- Impressions
-- Conversion_Rate
-- Acquisition_Cost
-- ROI
-- Engagement_Score

-- Derived KPIs:
-- CTR (Clicks / Impressions)
-- CPC (Acquisition_Cost / Clicks)
-- ROI-to-Cost Efficiency

-- Modeling approach:
-- The dataset was evaluated for normalization into fact and dimension tables.
-- However, due to its single-grain, denormalized structure, additional physical
-- modeling was not implemented, as it would not add analytical value for this use case.

-- Instead, KPI logic was modularized using CTEs within analytical queries to
-- ensure clarity, consistency, and reusability across business questions.

-- Conceptual dimensions (logical only):
-- Campaign: Campaign_ID, Campaign_Type, Target_Audience
-- Channel: Channel_Used
-- Date: Campaign date (not used for time-series analysis)

-- Notes:
-- This approach prioritizes analytical clarity over structural complexity and
-- reflects common real-world marketing analytics scenarios.
