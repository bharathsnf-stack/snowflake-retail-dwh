{{ config(materialized='table') }}
SELECT 
    CUSTOMER_ID, 
    COUNT(ORDER_ID) as total_orders 
FROM {{ ref('stg_orders') }}
GROUP BY 1
