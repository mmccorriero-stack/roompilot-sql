-- Nome: Revenue by Segment
-- Descrizione: Revenue totale per segmento

SELECT
    s.segment_name,
    SUM(r.room_revenue) AS total_revenue
FROM reservations r
JOIN segments s ON r.segment_id = s.segment_id
WHERE r.status = 'Confirmed'
GROUP BY s.segment_name
ORDER BY total_revenue DESC;
