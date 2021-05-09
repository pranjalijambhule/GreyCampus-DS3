
--
SELECT * FROM cd.facilities;

--
SELECT name, membercost FROM cd.facilities;

--
SELECT * FROM cd.facilities
WHERE membercost != 0;


--
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost != 0 AND membercost < (0.02* monthlymaintenance);

--

SELECT * FROM cd.facilities
WHERE name ILIKE '%tennis%';

--
SELECT * FROM cd.facilities
WHERE facid IN (1,5)

--

SELECT memid, surname, firstname, joindate FROM cd.members
WHERE joindate > '2012-09-01'
ORDER BY joindate;

--OR
SELECT memid, surname, firstname, joindate FROM cd.members
WHERE EXTRACT(MONTH FROM joindate) > 8
ORDER BY joindate;


-- 

SELECT DISTINCT(surname) FROM cd.members
ORDER BY surname
LIMIT 10;

--

SELECT joindate FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

--

SELECT * FROM cd.facilities;

SELECT COUNT(guestcost) FROM cd.facilities
WHERE guestcost >= 10;

--
-- 11. No wokring
SELECT COUNT(*) FROM cd.members
WHERE joindate BETWEEN '2012-09-01 00:00:00' AND '2012-09-30 23:59:59';

SELECT * FROM cd.bookings;

SELECT facid, slots FROM cd.bookings
--WHERE starttime BETWEEN '2012-09-01 00:00:00' AND '2012-09-30 23:59:59' 
GROUP BY facid, slots;


-- 11. Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output
-- table consisting of facility id and slots, sorted by the number of slots.

SELECT facid, SUM(slots) AS total_slots FROM cd.bookings
WHERE EXTRACT(MONTH FROM starttime) = 9 
GROUP BY facid
ORDER BY SUM(slots);



---------------------------

--12. Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and
-- total slots, sorted by facility id.


SELECT facid, SUM(slots) AS total_slots FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;


-----------------------

-- How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of 
-- start time and facility name pairings, ordered by the time.



SELECT starttime AS start, name FROM cd.facilities f
INNER JOIN cd.bookings b
ON f.facid = b.facid
WHERE TO_CHAR(starttime, 'YYYY-MM-DD') = '2012-09-21' AND name ILIKE 'tennis%'
ORDER BY start;


-------------------------------------------------------------

-- How can you produce a list of the start times for bookings by members named 'David Farrell'?

SELECT starttime FROM cd.bookings b
INNER JOIN cd.members m
ON b.memid = m.memid
WHERE firstname || surname ILIKE 'davidfarrell%';


SELECT * FROM cd.members;
