# Data_Alchemy

## Table of Contents
- [Project Overview](#project-overview)
- [Data Overview](#data-overview)
- [Prerequisites](#prerequisites)
- [Steps](#steps)
- [Installation Instructions](#installation-instructions)
- [Clone the Repository](#clone-the-repository)
- [Notes](#notes)
- [Data Model](#data-model)
- [Pipeline Flow](#pipeline-flow)
- [Dashboards](#dashboards)

---

## Project Overview
Data_Alchemy is an ETL (Extract, Transform, Load) project where we process [`laptop_price.csv`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/Database/laptop_prices.csv) using SSIS and SSMS, transforming it into a structured data model for reporting and analysis in Power BI.

## Data Overview
- **Source:** [`laptop_price.csv`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/Database/laptop_prices.csv)
- **Processing:** Extracted via SSIS, transformed (data type conversions), and loaded into a staging table [`stg.import`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_TableandColumns.sql).
- **Final Structure:** Dimension tables ([`dims`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_TableandColumns.sql)), fact tables ([`fact`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_TableandColumns.sql)), and reporting views ([`rpt`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_View.sql)).
- **Schema Used:**
  - `stg` (Staging Schema)
  - `dbo` (Core Schema for facts and dims)
  - `rpt` (Reporting Schema)

## Prerequisites
- **Software Required:**
  - Visual Studio 2022 (with SSIS)
  - SQL Server Management Studio (SSMS)
  - SQL Server
  - Power BI

## Steps
1. **Data Extraction:**
   - Load [`laptop_price.csv`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/Database/laptop_prices.csv) into SSIS.
   - Convert data types to Unicode.
   - Load into [`stg.import`](sql/staging_tables.sql) table in SSMS.

2. **Data Transformation & Loading:**
   - Create dimension tables ([`dims`](sql/dim_tables.sql)) and fact tables ([`fact`](sql/fact_tables.sql)) using CRUD operations in SSMS.
   - Use SSIS to load data into respective tables.
   - Implement **lookup transformations** to generate unique UIDs for dims.
   - Apply **unique clustered indexes** to dims.

3. **Data Cleaning & Management:**
   - Truncate [`stg.import`](sql/staging_tables.sql) and fact tables ([`fact`](sql/fact_tables.sql)) in the data flow to ensure fresh loads.

4. **Reporting Schema (`rpt`) & Views:**
   - Create reporting tables (e.g., [`summary`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_Rpt.sql)).
   - Generate fact table views for easier reporting.

5. **Power BI Analysis:**
   - Conduct analysis based on:
     1. Premium brands charge more—what influences price?
     2. SSDs cost more than HDDs; top-tier processors increase price.
     3. High RAM, powerful CPUs, and GPUs raise costs for premium configurations.
   - Power BI Report: [`PowerBI_Report.pbix`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/Visualization(PowerBI)/Laptop_ETL_Presentation.pbix)

## Installation Instructions
1. **Ensure all prerequisites are installed.**
2. **Set up SQL Server and create the necessary schemas (`stg`, `dbo`, `rpt`).**
3. **Run SSIS package ([`ssis_package.dtsx`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/ETL/Load_Laptop_Prices.dtsx)) to extract and load data.**
4. **Create necessary tables and views using SSMS ([`schema_setup.sql`](https://github.com/aayushsingh2708/Data_Alchemy/tree/master/SQL)).**
5. **Load transformed data into respective tables using SSIS.**
6. **Connect Power BI to SQL Server and generate insights.**

## Clone the Repository
```sh
 git clone https://github.com/aayushsingh2708/Data_Alchemy.git
 cd Data_Alchemy
```

## Notes
- **Ensure database connection strings are correctly configured.**
- **Check data transformations to confirm accuracy before loading into final tables.**
- **Validate Power BI dashboard connections to ensure data updates dynamically.**

## Data Model
- The project consists of `dims` ([`dim_tables.sql`](https://github.com/aayushsingh2708/Data_Alchemy/tree/master/SQL)) and `fact` ([`fact_tables.sql`](https://github.com/aayushsingh2708/Data_Alchemy/tree/master/SQL)) tables optimized for reporting.
- Unique identifiers (UIDs) are generated for each `dim` using lookup operations.
- The reporting schema (`rpt`) contains summary and aggregated views ([`reporting_views.sql`](https://github.com/aayushsingh2708/Data_Alchemy/tree/master/SQL)).

## Pipeline Flow
- The ETL process is managed through SSIS in **VSCode 2022** ([`ssis_package.dtsx`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/ETL/Load_Laptop_Prices.dtsx)).
- Data moves from raw CSV → Staging (`stg`) → Dims & Fact (`dbo`) → Reporting (`rpt`).
- Staging and fact tables are truncated in the data flow to maintain integrity.

## Dashboards
- Power BI reports provide insights on:
  - **Brand impact on pricing**
  - **Storage type (SSD vs HDD) influence on cost**
  - **Premium configuration pricing trends**
  - Power BI Report: [`PowerBI_Report.pbix`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/Visualization(PowerBI)/Laptop_ETL_Presentation.pbix)

---

Enjoy transforming raw data into actionable insights with **Data_Alchemy**!

