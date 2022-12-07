-- Refunds have a negative amount, so the total amount should always be >= 0.
-- Therefore return records where this isn't true to make the test fail
SELECT
    customer_id,
    sum(customer_lifetime_value) as order_amount

from {{ ref('customers' )}}

group by 1

having not(sum(customer_lifetime_value) >= 0)