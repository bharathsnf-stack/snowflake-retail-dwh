CREATE TASK sales_pipeline_task
WAREHOUSE = COMPUTE_WH
SCHEDULE = '5 MINUTE'
AS

INSERT INTO MART.FACT_SALES
SELECT
c.customer_sk,
p.product_sk,
o.order_date,
o.quantity,
o.quantity * p.price
FROM STAGING.STG_ORDERS o
JOIN MART.DIM_CUSTOMER c
ON o.customer_id = c.customer_id
JOIN MART.DIM_PRODUCT p
ON o.product_id = p.product_id;
