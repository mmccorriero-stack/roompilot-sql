DROP TABLE IF EXISTS stg_competitor_rates;

CREATE TABLE stg_competitor_rates (
    shopper_date            DATE,
    stay_date               DATE,
    hotel_id                INTEGER,
    competitor_name         TEXT,
    room_type_raw           TEXT,
    board_raw               TEXT,
    cancellation_policy_raw TEXT,
    price_amount            NUMERIC,
    currency_code           TEXT,
    availability_status     TEXT,
    source_name             TEXT
);
