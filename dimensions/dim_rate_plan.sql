CREATE TABLE dim_rate_plan AS
SELECT DISTINCT
    rate_plan_code
FROM stg_reservations;
