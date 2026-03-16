CREATE TABLE MART.DIM_CUSTOMER (
customer_sk NUMBER AUTOINCREMENT,
customer_id STRING,
customer_name STRING,
city STRING,
country STRING
);

CREATE TABLE MART.DIM_PRODUCT (
product_sk NUMBER AUTOINCREMENT,
product_id STRING,
product_name STRING,
category STRING,
price NUMBER
);

CREATE TABLE MART.FACT_SALES (
sales_id NUMBER AUTOINCREMENT,
customer_sk NUMBER,
product_sk NUMBER,
order_date DATE,
quantity NUMBER,
sales_amount NUMBER
);
