CREATE TABLE RAW.CUSTOMERS (
customer_id STRING,
customer_name STRING,
email STRING,
city STRING,
country STRING
);

CREATE TABLE RAW.PRODUCTS (
product_id STRING,
product_name STRING,
category STRING,
price NUMBER
);

CREATE TABLE RAW.ORDERS (
order_id STRING,
customer_id STRING,
product_id STRING,
order_date DATE,
quantity NUMBER
);
