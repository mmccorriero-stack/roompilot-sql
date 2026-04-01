-- Nome: Booking Window
-- Descrizione: Distribuzione dei giorni tra prenotazione e arrivo

SELECT
    DATEDIFF(arrival_date, booking_date) AS booking_window_days,
    COUNT(*) AS reservations_count
FROM reservations
WHERE status = 'Confirmed'
GROUP BY DATEDIFF(arrival_date, booking_date)
ORDER BY booking_window_days;
