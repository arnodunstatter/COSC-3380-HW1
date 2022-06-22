/*
Q20
show #tickets,total $ spent, and # of tickets bought for each different month
for passenger SERGEY RODIONOV
displaying all information in one row (i.e. each month is one column)
hint: use CASE .. WHEN .. END statement and DATE functions
*/

DROP TABLE q20_sergey;
CREATE TABLE q20_sergey(
   tickets int,
   spent numeric(10,2),
   month1 int,
   month2 int,
   month3 int

);

/*
1. We have to filter rows of from airline.ticket for passenger_name = "SERGEY RODIONOV".
 select ticket_no and book_ref
2. Join with airline.booking on book_ref to get the total_amount for each flight
3. aggregate to get 'spent' 
4. Join with airline.ticket with count for first month
5. Join with airline.ticket with count for second month
6. Join with airline.ticket with count for third month
7. Join with airline.ticket with count for all three months
*/
INSERT INTO q20_sergey
SELECT a.count, b.spent, c.count, d.count, e.count
    FROM
    (--tickets
        SELECT COUNT(*) FROM airline.ticket
        WHERE passenger_name ILIKE 'SERGEY RODIONOV'
    ) AS a,
    (--spent 
        SELECT SUM(booking.total_amount) AS spent
            FROM airline.booking, airline.ticket 
            WHERE booking.book_ref = ticket.book_ref AND ticket.passenger_name ILIKE 'SERGEY RODIONOV'
    ) AS b,
    (--month1
        SELECT COUNT(*) FROM airline.ticket, airline.booking
        WHERE ticket.book_ref = booking.book_ref AND
            ticket.passenger_name ILIKE 'SERGEY RODIONOV' AND 
            EXTRACT(MONTH FROM booking.book_date) = 6
    ) as c,
    (--month2
        SELECT COUNT(*) FROM airline.ticket, airline.booking
        WHERE ticket.book_ref = booking.book_ref AND
            ticket.passenger_name ILIKE 'SERGEY RODIONOV' AND 
            EXTRACT(MONTH FROM booking.book_date) = 7
    ) AS d,
    (--month3
        SELECT COUNT(*) FROM airline.ticket, airline.booking
        WHERE ticket.book_ref = booking.book_ref AND
            ticket.passenger_name ILIKE 'SERGEY RODIONOV' AND 
            EXTRACT(MONTH FROM booking.book_date) = 8    
    ) AS e;
    
SELECT * FROM q20_sergey;
   
