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
Data_Alchemy is an ETL (Extract, Transform, Load) project that processes [`laptop_price.csv`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/Database/laptop_prices.csv) using SSIS and SSMS, transforming raw data into a structured data model for reporting and analysis in Power BI.

## Data Overview
- **Source:** [`laptop_price.csv`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/Database/laptop_prices.csv)
- **Processing:** Extracted via SSIS, transformed (data type conversions), and loaded into a staging table [`stg.import`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_TableandColumns.sql).
- **Final Structure:**
  - **Dimension tables** ([`dims`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_TableandColumns.sql))
  - **Fact tables** ([`fact`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_TableandColumns.sql))
  - **Reporting views** ([`rpt`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_View.sql))
- **Schema Overview:**
  - `stg` (Staging Schema)
  - `dim` (Dimension Schema)
  - `fact` (Fact Schema)
  - `rpt` (Reporting Schema)

## Prerequisites
- **Required Software:**
  - Visual Studio 2022 (with SSIS)
  - SQL Server Management Studio (SSMS)
  - SQL Server
  - Power BI

## Steps
1. **Data Extraction:**
   - Load [`laptop_price.csv`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/Database/laptop_prices.csv) into SSIS.
   - Convert data types to Unicode.
   - Load into [`stg.import`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_TableandColumns.sql) table in SSMS.

2. **Data Transformation & Loading:**
   - Create dimension tables ([`dims`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_TableandColumns.sql)) and fact tables ([`fact`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_TableandColumns.sql)) using CRUD operations in SSMS.
   - Use SSIS to load data into respective tables.
   - Implement **lookup transformations** to generate unique UIDs for dimensions.

3. **Data Cleaning & Management:**
   - Truncate staging ([`stg.import`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_TableandColumns.sql)) and fact tables in the data flow for data integrity.

4. **Reporting Schema (`rpt`) & Views:**
   - Create reporting tables (e.g., [`summary`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_Rpt.sql)).
   - Generate fact table views for reporting.
   - Apply **unique clustered indexes** to dimension tables.

5. **Power BI Analysis:**
   - Key insights from [`Laptop_ETL_Presentation.pbix`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/Visualization(PowerBI)/Laptop_ETL_Presentation.pbix):
     1. Premium brands charge more—analyzing price influences.
     2. SSDs cost more than HDDs; high-end processors drive up costs.
     3. High RAM, powerful CPUs, and GPUs contribute to premium configurations.

## Installation Instructions
1. **Install all prerequisites.**
2. **Set up SQL Server and create schemas (`stg`, `dim`, `fact`, `rpt`).**
3. **Run SSIS package ([`Load_Laptop_Prices.dtsx`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/ETL/Load_Laptop_Prices.dtsx)) to load data.**
4. **Create tables and views using SSMS ([`SQL scripts`](https://github.com/aayushsingh2708/Data_Alchemy/tree/master/SQL)).**
5. **Load transformed data into respective tables using SSIS.**
6. **Connect Power BI to SQL Server for analysis.**

## Clone the Repository
```sh
 git clone https://github.com/aayushsingh2708/Data_Alchemy.git
 cd Data_Alchemy
```

## Notes
- **Ensure database connection strings are correctly configured.**
- **Verify data transformations before loading into final tables.**
- **Ensure Power BI dashboards dynamically update with new data.**

## Data Model
- The project consists of:
  - `dims` ([`Create_TableandColumns.sql`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_TableandColumns.sql))
  - `fact` ([`Create_TableandColumns.sql`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_TableandColumns.sql))
- Unique identifiers (UIDs) are generated for each `dim` via lookup operations.
- The `rpt` schema contains aggregated reporting views ([`Create_Rpt.sql`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/SQL/Create_Rpt.sql)).

## Pipeline Flow
- The ETL process is managed through SSIS in **VSCode 2022** ([`Load_Laptop_Prices.dtsx`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/ETL/Load_Laptop_Prices.dtsx)).
- Data moves through:
  - Raw CSV → Staging (`stg`)
  - Dimensions & Facts (`dim`, `fact`)
  - Reporting (`rpt`)
- Staging and fact tables are truncated in the data flow for consistency.

![ETL Pipeline Flow](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/images/pipeline_flow.png)

## Dashboards
- Power BI reports provide insights on:
  - **Brand influence on pricing**
  - **Storage type (SSD vs HDD) and cost impact**
  - **Premium configurations and pricing trends**
- Power BI Report: [`Laptop_ETL_Presentation.pbix`](https://github.com/aayushsingh2708/Data_Alchemy/blob/master/Visualization(PowerBI)/Laptop_ETL_Presentation.pbix)

---

Enjoy transforming raw data into actionable insights with **Data_Alchemy**! 🚀

