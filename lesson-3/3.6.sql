--2

SELECT count(customer_id) FROM tickets;

-- 3Write a query that determines how many different customers purchased 
-- tickets to at least one event.

SELECT count(DISTINCT customer_id) FROM tickets ;

--4 

SELECT trunc(count(DISTINCT tickets.customer_id)
        / count(DISTINCT customers.id)::decimal * 100, 2) 
        AS percentage
FROM customers LEFT JOIN tickets ON tickets.customer_id = customers.id;

--5

SELECT events.name, count(tickets.event_id) AS popularity  -- bizarre this worked
FROM tickets 
  JOIN events
  ON tickets.event_id = events.id
GROUP BY tickets.event_id, events.name ORDER BY popularity DESC;


--6

SELECT c.id, c.email, count(DISTINCT e.id) AS tickets_purchased
FROM customers AS c 
  JOIN tickets AS t ON c.id = t.customer_id
  JOIN events AS e ON e.id = t.event_id
GROUP BY c.id, c.email
HAVING count(DISTINCT e.id) = 3;

-- better solution, since the join tables FK event_id references e.id

SELECT c.id, c.email, count(DISTINCT t.event_id)
FROM customers AS c
  JOIN tickets AS t ON c.id = t.customer_id
GROUP BY c.id
HAVING count(DISTINCT t.event_id) = 3;

--7

SELECT 
  e.name AS event, 
  e.starts_at, 
  sections.name AS section, 
  seats.row,
  seats.number AS seat
FROM tickets AS t
  JOIN events AS e ON t.event_id = e.id
  JOIN customers ON t.customer_id = customers.id
  JOIN seats ON seats.id = t.seat_id
  JOIN sections ON seats.section_id = sections.id
WHERE customers.email = 'gennaro.rath@mcdermott.co';