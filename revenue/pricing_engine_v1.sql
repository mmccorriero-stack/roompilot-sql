DROP TABLE IF EXISTS pricing_engine_v1;

CREATE TABLE pricing_engine_v1 AS
SELECT
    k.stay_date,
    k.hotel_id,

    k.adr AS current_adr,
    k.occupancy_pct,

    m.market_avg_price,
    m.market_min_price,
    m.market_max_price,

    -- STEP 1: base price da ADR
    k.adr AS base_price,

    -- STEP 2: adjustment occupancy
    CASE
        WHEN k.occupancy_pct < 40 THEN k.adr * 0.90
        WHEN k.occupancy_pct BETWEEN 40 AND 70 THEN k.adr
        WHEN k.occupancy_pct > 70 THEN k.adr * 1.10
        ELSE k.adr
    END AS occ_adjusted_price,

    -- STEP 3: adjustment mercato
    CASE
        WHEN k.adr > m.market_avg_price THEN 
            (CASE
                WHEN k.occupancy_pct < 40 THEN k.adr * 0.85
                WHEN k.occupancy_pct > 70 THEN k.adr * 1.05
                ELSE k.adr * 0.95
            END)
        WHEN k.adr < m.market_avg_price THEN 
            (CASE
                WHEN k.occupancy_pct > 70 THEN k.adr * 1.15
                ELSE k.adr * 1.05
            END)
        ELSE k.adr
    END AS suggested_price,

    -- Confidence score semplice
    CASE
        WHEN k.occupancy_pct > 70 THEN 'High'
        WHEN k.occupancy_pct BETWEEN 40 AND 70 THEN 'Medium'
        ELSE 'Low'
    END AS confidence_level,

    -- Spiegazione
    CASE
        WHEN k.occupancy_pct > 70 AND k.adr < m.market_avg_price
            THEN 'Domanda alta e prezzo sotto mercato → aumenta'
        WHEN k.occupancy_pct > 70
            THEN 'Domanda alta → puoi aumentare prezzo'
        WHEN k.occupancy_pct < 40 AND k.adr > m.market_avg_price
            THEN 'Domanda bassa e prezzo alto → riduci'
        WHEN k.occupancy_pct < 40
            THEN 'Domanda bassa → valuta riduzione prezzo'
        ELSE 'Domanda stabile → mantieni o piccoli aggiustamenti'
    END AS explanation

FROM kpi_daily_performance k
LEFT JOIN kpi_market_daily m
    ON k.stay_date = m.stay_date
   AND k.hotel_id = m.hotel_id;
