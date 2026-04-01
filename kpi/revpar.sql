-- Nome: RevPAR
-- Descrizione: Revenue per Available Room
-- Nota: richiede disponibilità camere (esempio semplificato)

SELECT 
    SUM(room_revenue) / SUM(nights) AS revpar
FROM reservations
WHERE status = 'Confirmed';
