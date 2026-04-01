CREATE TABLE dim_hotel AS
SELECT DISTINCT
    hotel_id
FROM stg_reservations;
