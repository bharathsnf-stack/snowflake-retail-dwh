# ❄️ End-to-End Snowflake Retail Data Warehouse Project
[![dbt-run](https://github.com/bharathsnf-stack/snowflake-retail-dwh/actions/workflows/dbt_run.yml/badge.svg)](https://github.com/bharathsnf-stack/snowflake-retail-dwh/actions)

## 📌 Project Overview
This project demonstrates a professional-grade Data Engineering pipeline built on **Snowflake**, utilizing **dbt (Data Build Tool)** and **GitHub Actions**. It implements a robust **Medallion Architecture** to process retail sales data, ensuring data quality and scalability across multiple environments.

## 🏗️ Architecture & Methodology
The project follows the **Medallion (Bricks) Architecture** to transform raw retail data into actionable business insights:

* **Bronze (Raw):** Landing zone for raw CSV data (Customers, Products, Orders) synced directly from GitHub.
* **Silver (Staging):** Data cleaning, schema enforcement, and deduplication using dbt models.
* **Gold (Marts):** Business-ready tables and views for Reporting and Analytics (e.g., Customer Order Summary).



## 🛠️ Tech Stack
* **Data Warehouse:** Snowflake
* **Transformation Tool:** dbt (Data Build Tool)
* **CI/CD & Automation:** GitHub Actions
* **Language:** SQL (Snowflake Dialect), Jinja (dbt)
* **Version Control:** Git (Feature Branching: Dev, QA, Prod)

## 🚀 Key Features
* **CI/CD Pipeline:** Fully automated deployment using GitHub Actions. Code pushed to `dev` is automatically tested and run in Snowflake.
* **Environment Management:** Strict separation of environments using a **Dev -> QA -> Production** branching strategy.
* **Automated Data Ingestion:** Uses Snowflake's **Git Integration** and `COPY INTO` commands for seamless data syncing.
* **Modular SQL:** Leverages dbt's modularity for reusable code and automated testing.

## 📁 Repository Structure
```text
├── .github/workflows/    # CI/CD pipeline (dbt run & connection tests)
├── models/               # dbt transformation models (Silver & Gold layers)
├── seeds/                # Static data files (CSVs)
├── snapshots/            # SCD (Slowly Changing Dimensions) logic
├── dbt_project.yml       # Main dbt configuration
├── profiles.yml          # Snowflake connection profiles (Secure via Environment Variables)
└── schema/               # Core Snowflake DDL scripts

⚙️ CI/CD Workflow
The project implements a modern DevOps approach for Data Engineering:

Development: Code is written and tested in the dev branch.

Validation: GitHub Actions run connection tests and dbt run against the Snowflake Dev environment.

Deployment: Upon successful testing, Pull Requests move code to QA and eventually Production.

📊 Business Insights Generated
Through this warehouse, we can answer critical business questions:

Sales Performance: Total revenue generated from delivered vs. cancelled orders.

Customer Analytics: High-value customers and their ordering patterns.

Operational Efficiency: Identifying delivery bottlenecks and "Dead Stock" items.

🚀 How to Use
Clone the Repo: git clone https://github.com/bharathsnf-stack/snowflake-retail-dwh.git

Configure Secrets: Add SNOWFLAKE_ACCOUNT, SNOWFLAKE_USER, and SNOWFLAKE_PASSWORD to your GitHub Repository Secrets.

Deploy: Push changes to the dev branch to trigger the automated dbt pipeline.

Verify: Check the MARTS_ORDERS table in your Snowflake instance.

Developed by @https://www.linkedin.com/in/bharathdhommaraju/  Senior Data Engineer | Snowflake | dbt | Azure & AWS
