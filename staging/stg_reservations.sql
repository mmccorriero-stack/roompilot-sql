CREATE TABLE stg_reservations (
    hotel_id INT,
    reservation_code VARCHAR(50),
    booking_date DATE,
    check_in_date DATE,
    check_out_date DATE,
    reservation_status VARCHAR(30),
    agency_name VARCHAR(100),
    market_source VARCHAR(50),
    market_segment VARCHAR(50),
    guest_count INT,
    rate_plan_code VARCHAR(50),
    daily_rate_amount DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    guest_name VARCHAR(100),
    guest_email VARCHAR(100),
    guest_country VARCHAR(50)
);
