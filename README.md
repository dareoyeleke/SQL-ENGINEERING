SQL Engineering for Labor Market Analytics

Overview

This repository contains a set of SQL transformation and analysis scripts that model raw job posting data into analytics-ready tables and derive compensation, location, and skill-based insights.

The project focuses on:

Data cleaning and normalization

Grain control and aggregation logic

Analytics-oriented SQL patterns (CTEs, window functions)

Reproducible metric generation

Power BI assets are included only as downstream consumers of the SQL outputs.

Repository Structure
.
├── sql/
│   ├── 01_stage_raw.sql
│   ├── 02_clean_transform.sql
│   ├── 03_dim_role.sql
│   ├── 04_dim_company.sql
│   ├── 05_fact_jobs.sql
│   ├── 06_salary_metrics.sql
│   └── 07_remote_analysis.sql
│
├── data/
│   └── sample/          # optional sample inputs
│
├── bi/                  # Power BI dashboards (downstream only)
│
└── README.md


Primary artifact: the /sql directory
Secondary artifact: /bi (visualization only)

Data Modeling Approach

Raw job postings are first staged and normalized

Dimensional tables are built for roles, companies, locations

A fact table captures job postings at a controlled grain

Metrics are derived using explicit aggregation logic to avoid double counting

Design decisions emphasize correctness over convenience.

Key SQL Techniques Used

Multi-step CTE pipelines for readability and debuggability

Window functions for salary distribution analysis

Conditional aggregation for remote vs on-site comparisons

Explicit handling of:

Hourly vs annual compensation

Missing or invalid salary values

Outliers that would distort averages

How to Run

Load raw job posting CSVs into your SQL environment

Execute scripts in numerical order (01_ → 07_)

Final outputs are analytics-ready tables consumable by BI tools

(SQL dialect: standard ANSI-style SQL; adaptable to Postgres / DuckDB / BigQuery)

Quality & Assumptions

Salary metrics are calculated only where compensation data is present

Hourly wages are normalized to annual equivalents using explicit assumptions

Duplicate postings are filtered at the defined fact grain

Remote classification relies on source metadata and may undercount hybrid roles

Limitations & Next Steps

Add automated data quality tests (nulls, duplicates, distribution checks)

Parameterize compensation normalization logic

Extend schema to support time-series trend analysis

Why This Repo Exists

This project is intended to demonstrate SQL engineering and analytical reasoning, not dashboard design.
All insights shown in BI are derived entirely from the SQL layer.

## 📌 Portfolio Note

This repository consolidates prior job-market SQL analysis designed for portfolio and professional review.

### 📎 Author

[Dare Oyeleke]
Data Analyst | Healthcare Analytics
[(https://www.linkedin.com/in/dareoyeleke/)] | [(https://github.com/dareoyeleke)]

