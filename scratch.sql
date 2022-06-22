--Ex: For every flight, give the flight_id and the model of the aircraft

select a.count , b.count
from 
(
    select count(*) as count from airline.ticket
) as a,
(
    select count(*) as count from airline.booking
) as b;