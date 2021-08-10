WITH
orders AS
(
    SELECT *  FROM {{ ref('stg_orders')}}
),

order_payment_summary AS 
(
    SELECT
        order_id,
        SUM(amount_paid) AS amount_paid
    FROM
        {{ ref('stg_payments') }}
    GROUP BY
        order_id
)

SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status,
    coalesce(ops.amount_paid, 0) AS amount
FROM
    orders o
    LEFT JOIN
    order_payment_summary ops
        ON o.order_id = ops.order_id