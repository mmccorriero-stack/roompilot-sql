-- Nome: Lead Time
-- Descrizione: Giorni medi tra prenotazione e arrivo

SELECT 
    AVG(arrival_date - booking_date) AS avg_lead_time
FROM reservations
WHERE status = 'Confirmed';
