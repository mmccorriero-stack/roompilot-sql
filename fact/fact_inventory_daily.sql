DROP TABLE IF EXISTS fact_inventory_daily;

CREATE TABLE fact_inventory_daily AS
SELECT
    d.full_date AS inventory_date,
    d.date_key AS inventory_date_key,
    h.hotel_id,
    h.hotel_name,
    h.total_units,

    0 AS ooo_units,
    0 AS blocked_units,
    0 AS closed_units,
    0 AS maintenance_units,

    h.total_units AS available_units,

    CASE
        WHEN h.total_units > 0 THEN 1
        ELSE 0
    END AS is_open,

    NULL AS notes

FROM dim_date d
CROSS JOIN dim_hotel h
WHERE h.is_active = 1;
