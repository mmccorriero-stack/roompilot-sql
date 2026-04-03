DROP TABLE IF EXISTS kpi_pickup_daily;

CREATE TABLE kpi_pickup_daily AS
SELECT
    s1.snapshot_date,
    s1.stay_date,
    s1.hotel_id,

    s1.rooms_otb AS rooms_otb_today,
    s2.rooms_otb AS rooms_otb_yesterday,

    COALESCE(s1.rooms_otb - s2.rooms_otb, s1.rooms_otb) AS pickup_rooms,

    s1.revenue_otb AS revenue_otb_today,
    s2.revenue_otb AS revenue_otb_yesterday,

    COALESCE(s1.revenue_otb - s2.revenue_otb, s1.revenue_otb) AS pickup_revenue

FROM fact_snapshot_otb s1
LEFT JOIN fact_snapshot_otb s2
    ON s1.hotel_id = s2.hotel_id
   AND s1.stay_date = s2.stay_date
   AND s2.snapshot_date = date(s1.snapshot_date, '-1 day');
