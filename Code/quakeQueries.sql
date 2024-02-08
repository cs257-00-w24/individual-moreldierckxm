/* List all of the large earthquakes that occurred this past month. */

SELECT * FROM earthquakes WHERE magnitude>=6 ORDER BY magnitude DESC;

/* List the place and magnitude of all of the icequakes */

SELECT place, magnitude FROM earthquakes WHERE quaketype = 'ice quake' ORDER BY place;

/* Determine how many earthquakes in my dataset occurred between midnight and 6am local time in Alaska. 

ASSUMPTIONS and NOTES:
- Conveniently ignore the 10% of Alaska that's in a different time zone and use Alaska Time

- Timestamps are in GMT and AKST is 9 hours behind

- Use a bounding box around Alaska and assuming everything in that box is Alaska

*/

SELECT * FROM earthquakes WHERE quaketime::time BETWEEN '15:00' AND '21:00'
INTERSECT
SELECT * FROM earthquakes WHERE longitude BETWEEN -180 AND -130 AND latitude BETWEEN 52 AND 71
ORDER BY magnitude DESC;