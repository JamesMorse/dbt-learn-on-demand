SELECT
    id AS payment_id,
    orderid AS order_id,
    paymentmethod AS payment_method,
    amount / 100.0  AS amount_paid,
    created AS date_created
FROM
    raw.stripe.payment
WHERE 1 = 1
    AND status = 'success'

