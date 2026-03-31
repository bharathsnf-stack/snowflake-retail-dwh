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

**********************************************************


Retail Data Warehouse (Snowflake & GitHub Integration)
📌 Project Overview
This project demonstrates an end-to-end Data Engineering Pipeline using Snowflake's modern Git Integration feature. The goal is to build a Retail Data Warehouse that ingests product, supply, and order data directly from a GitHub repository to perform inventory and sales analysis.

Key Objectives:
Data Ingestion: Seamlessly sync CSV data from GitHub to Snowflake.

Staging (Bronze Layer): Create structured tables and load raw data using COPY INTO.

Transformation (Silver Layer): Use SQL Joins to identify active sales and delivery bottlenecks.

Reporting (Gold Layer): Generate insights on undelivered items and stock levels.

🏗️ Architecture
The pipeline follows a Medallion Architecture (Raw -> Staging -> Analytics):

Source: GitHub Repository (/data folder containing CSVs).

External Stage: Snowflake Git Integration (replacing the need for S3).

Loading: Snowflake COPY INTO commands for bulk loading.

Analytics: Complex Joins for Business Intelligence.

🛠️ Step-by-Step Implementation
1. Source Data Setup
Created three core datasets in the /data folder:

products.csv: Master list of retail items.

supply.csv: Current warehouse stock levels.

orders.csv: Customer transaction history and shipping status.

2. Snowflake Integration
Established a secure connection between GitHub and Snowflake using an API Integration.

SQL
CREATE OR REPLACE API INTEGRATION github_api_int
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/bharathsnf-stack/')
  ENABLED = TRUE;
3. Data Loading (Staging)
Defined the staging tables and utilized the COPY INTO command to ingest data from the Git branch.

Schema Enforcement: Ensuring correct data types for Price, Quantity, and Dates.

Automation: Using ALTER GIT REPOSITORY ... FETCH to sync the latest data.

4. Advanced SQL Analysis (The Logic)
This is where the business value is created using two primary join types:

A. Inner Join (Active Sales Validation)
Used to find products that exist in the catalog and have successfully generated sales.

SQL
SELECT p.product_name, o.order_id 
FROM stg_products p
INNER JOIN stg_orders o ON p.product_id = o.product_id;
B. Left Join (Identifying Undelivered & Orphaned Items)
Crucial for operations to identify:

Pending Shipments: Orders that haven't reached 'Delivered' status.

Dead Stock: Products in the catalog that have zero orders.

📊 Key Insights & Results
Through this warehouse, we can answer:

Which products are out of stock but have pending orders?

What is the total revenue from delivered vs. cancelled orders?

Which warehouse location has the highest delivery delay?

🚀 How to Run
Clone this repository.

Update the ORIGIN URL in the Snowflake script to your repo link.

Run the provided .sql scripts in Snowflake Snowsight.

Check the Snowsight Dashboards for visual reports.

📈 Future Improvements
Implement dbt (data build tool) for automated transformations.

Set up Snowflake Tasks to automate the FETCH and COPY process on a schedule.

******************************************************************************************

Retail Data Warehouse (Snowflake & GitHub Integration)
📌 Project Overview
This project demonstrates an end-to-end Data Engineering Pipeline using Snowflake's modern Git Integration feature. The goal is to build a Retail Data Warehouse that ingests product, supply, and order data directly from a GitHub repository to perform inventory and sales analysis.

Key Objectives:
Data Ingestion: Seamlessly sync CSV data from GitHub to Snowflake.

Staging (Bronze Layer): Create structured tables and load raw data using COPY INTO.

Transformation (Silver Layer): Use SQL Joins to identify active sales and delivery bottlenecks.

Reporting (Gold Layer): Generate insights on undelivered items and stock levels.

🏗️ Architecture
The pipeline follows a Medallion Architecture (Raw -> Staging -> Analytics):

Source: GitHub Repository (/data folder containing CSVs).

External Stage: Snowflake Git Integration (replacing the need for S3).

Loading: Snowflake COPY INTO commands for bulk loading.

Analytics: Complex Joins for Business Intelligence.

🛠️ Step-by-Step Implementation
1. Source Data Setup
Created three core datasets in the /data folder:

products.csv: Master list of retail items.

supply.csv: Current warehouse stock levels.

orders.csv: Customer transaction history and shipping status.

2. Snowflake Integration
Established a secure connection between GitHub and Snowflake using an API Integration.

SQL
CREATE OR REPLACE API INTEGRATION github_api_int
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/bharathsnf-stack/')
  ENABLED = TRUE;
3. Data Loading (Staging)
Defined the staging tables and utilized the COPY INTO command to ingest data from the Git branch.

Schema Enforcement: Ensuring correct data types for Price, Quantity, and Dates.

Automation: Using ALTER GIT REPOSITORY ... FETCH to sync the latest data.

4. Advanced SQL Analysis (The Logic)
This is where the business value is created using two primary join types:

A. Inner Join (Active Sales Validation)
Used to find products that exist in the catalog and have successfully generated sales.

SQL
SELECT p.product_name, o.order_id 
FROM stg_products p
INNER JOIN stg_orders o ON p.product_id = o.product_id;
B. Left Join (Identifying Undelivered & Orphaned Items)
Crucial for operations to identify:

Pending Shipments: Orders that haven't reached 'Delivered' status.

Dead Stock: Products in the catalog that have zero orders.

📊 Key Insights & Results
Through this warehouse, we can answer:

Which products are out of stock but have pending orders?

What is the total revenue from delivered vs. cancelled orders?

Which warehouse location has the highest delivery delay?

🚀 How to Run
Clone this repository.

Update the ORIGIN URL in the Snowflake script to your repo link.

Run the provided .sql scripts in Snowflake Snowsight.

Check the Snowsight Dashboards for visual reports.

📈 Future Improvements
Implement dbt (data build tool) for automated transformations.

Set up Snowflake Tasks to automate the FETCH and COPY process on a schedule.

Integrate S3 as a primary landing zone for larger datasets.
## 📊 Monitoring & Governance
We monitor the pipeline health using:
```sql
SELECT * FROM TABLE(INFORMATION_SCHEMA.TASK_HISTORY(TASK_NAME=>'LOAD_FACT_SALES_TASK'));# snowflake-retail-dwh
End-to-End Snowflake Data Engineering Project with Dev Test Prod architecture
