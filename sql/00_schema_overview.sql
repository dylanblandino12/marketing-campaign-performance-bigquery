/*
File: 00_schema_overview.sql

Purpose:
This file documents the logical data model used in the project.
It describes the fact and dimension tables created from the raw dataset,
including table grain, relationships, and design decisions.

Contents:
- Overview of the star schema
- Fact table grain definition
- Dimension tables description
- Rationale for modeling choices

Notes:
The schema is designed for analytical workloads in BigQuery and supports
join-based marketing performance analysis.
*/
-- Schema overview
-- Fact and dimension tables for marketing campaign analytics
