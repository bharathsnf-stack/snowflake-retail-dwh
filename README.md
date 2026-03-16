# End-to-End Snowflake Retail Data Warehouse Project

This project demonstrates a professional-grade Data Engineering pipeline built on **Snowflake**, utilizing the **Medallion Architecture** to process retail sales data. It features real-time incremental loading, automation, and CI/CD integration.

## 🏗️ Architecture Overview
The project follows a 3-layer data processing strategy:
1. **Bronze (Raw):** Ingesting raw retail data (Customers, Products, Orders).
2. **Silver (Staging):** Data cleaning and basic transformations.
3. **Gold (Mart):** Star Schema implementation with Dimensions and Fact tables for Business Intelligence.


## 🚀 Key Features
* **Change Data Capture (CDC):** Used **Snowflake Streams** to track and capture new data in the staging layer.
* **Automation:** Automated the end-to-end flow using **Snowflake Tasks** with a 5-minute execution schedule.
* **CI/CD:** Integrated with **GitHub Actions** for automated SQL deployment to Snowflake.
* **Environment Management:** Designed for scalability across Dev, QA, and Production environments.

## 📁 Repository Structure
* `/schema`: SQL scripts for Database, Schema, and Table definitions.
* `/transformations`: Business logic to move data from Raw to Staging.
* `/pipelines`: Final ETL scripts for loading Fact and Dimension tables.
* `/config`: Environment-specific configurations.
* `.github/workflows`: CI/CD pipeline automation scripts.

## 📊 Monitoring & Governance
We monitor the pipeline health using:
```sql
SELECT * FROM TABLE(INFORMATION_SCHEMA.TASK_HISTORY(TASK_NAME=>'LOAD_FACT_SALES_TASK'));# snowflake-retail-dwh
End-to-End Snowflake Data Engineering Project with Dev Test Prod architecture
