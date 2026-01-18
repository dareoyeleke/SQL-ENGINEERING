# SQL Engineering — Analytics Data Modeling & Metrics
## Overview

This repository contains a collection of SQL engineering scripts designed to transform raw job posting data into analytics-ready tables and derived metrics.

## The focus of this project is SQL craftsmanship:

-  Data modeling

-  Transformation logic

-  Aggregation correctness

-  Temporal analysis

-  Segmentation and metric design

**NOTE:** Any BI assets included in the repository are downstream consumers of the SQL layer and are not the primary artifact.

## Core SQL Skills Demonstrated
-  Data Modeling & Transformation

-  Staging raw data into clean, queryable structures

-  Designing dimension and fact tables with controlled grain

-  Normalizing inconsistent fields (roles, locations, compensation)

-  Managing one-to-many and many-to-many relationships

-  Aggregation & Metric Engineering

-  Building salary and compensation metrics using explicit aggregation logic

-  Preventing double counting through grain-aware grouping

-  Conditional aggregation for segmented analysis (e.g. role, location, remote status)

-  Use of median, average, and distribution-based measures

-  Window Functions

-  Ranking and percentile calculations for compensation analysis

-  Salary distribution analysis using analytic functions

-  Comparative metrics within partitions (by role, location, seniority)

-  Date & Time Analysis

-  Parsing and standardizing date fields

-  Time-based aggregation (monthly / yearly groupings)

-  Temporal trend analysis of job postings and compensation

-    Handling incomplete or inconsistent date data

-  Segmentation Logic

-  Role-based and seniority-based segmentation

-  Remote vs on-site classification

-  Skill-based grouping and comparison

-  Geographic segmentation for location analysis

-  Data Quality & Assumptions

-  Explicit handling of missing or invalid salary values

-  Conversion of hourly compensation to annualized figures using stated assumptions

-  Filtering outliers that materially distort aggregates

-  Deduplication at the defined fact grain

**Primary artifact:** /sql
All analytical outputs are derived entirely from this layer.

## SQL Characteristics

-  Modular, readable scripts using CTE-based pipelines

-  ANSI-style SQL (portable across modern warehouses)

-  Queries written with correctness, clarity, and debuggability in mind

-  Explicit assumptions documented in logic rather than implied

## Intended Use

This repository is intended to demonstrate SQL engineering and analytical reasoning, not visualization design or narrative reporting.

The scripts are suitable for:

-  Analytics engineering roles

-  Data analyst roles with strong SQL expectations

-  Technical interviews and SQL walkthroughs

## Notes

-  BI dashboards are included only to demonstrate downstream consumption

-  Insights and conclusions are entirely driven by the SQL layer

-  Scripts are designed to be adapted to Postgres, DuckDB, BigQuery, or similar engines

## 📌 Portfolio Note

This repository consolidates prior job-market SQL analysis designed for portfolio and professional review.

### 📎 Author

[Dare Oyeleke]
Data Analyst | Healthcare Analytics
[(https://www.linkedin.com/in/dareoyeleke/)] | [(https://github.com/dareoyeleke)]

