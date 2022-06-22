SELECT sum(departure_airport_sum)
    FROM(
        SELECT departure_airport, sum(flight_id_sum) AS departure_airport_sum
            FROM(
                SELECT flight.departure_airport, sum(ticket_flight.amount) AS flight_id_sum
                    FROM airline.ticket_flight
                    JOIN airline.flight
                    ON ticket_flight.flight_id = flight.flight_id
                    WHERE fare_conditions ILIKE '%Economy'
                    GROUP BY ticket_flight.flight_id, departure_airport
                    ORDER BY departure_airport
            ) AS x
            GROUP BY departure_airport
            ORDER BY departure_airport
        ) AS x
    WHERE departure_airport = 'ULV' OR departure_airport = 'ULY'
    ;

    