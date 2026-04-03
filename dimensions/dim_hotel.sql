DROP TABLE IF EXISTS dim_hotel;

CREATE TABLE dim_hotel (
    hotel_id                INTEGER PRIMARY KEY,
    hotel_name              TEXT NOT NULL,
    hotel_code              TEXT,
    property_type           TEXT,
    city                    TEXT,
    region                  TEXT,
    country                 TEXT,
    pms_name                TEXT,
    channel_manager_name    TEXT,
    total_units             INTEGER NOT NULL,
    currency_code           TEXT DEFAULT 'EUR',
    is_active               INTEGER DEFAULT 1,
    go_live_date            DATE,
    notes                   TEXT
);
