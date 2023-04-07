CREATE EXTENSION IF NOT EXISTS postgis;

CREATE INDEX facilities_idx ON facilities USING GIST (geom);
CREATE INDEX festival_arena_idx ON festival_arena USING GIST (geom);
CREATE INDEX food_stall_idx ON food_stall USING GIST (geom);
CREATE INDEX fun_activities_idx ON fun_activities USING GIST (geom);
CREATE INDEX stages_idx ON stages USING GIST (geom);

--- User Specific Queries ---

SELECT facilities.*
FROM facilities, stages
WHERE ST_DWithin(facilities.geom, stages.geom, 100) AND facilities.facility = 'Toilet';

SELECT facilities.*
FROM facilities, stages
WHERE ST_DWithin(facilities.geom, stages.geom, 50)
AND facilities.facility = 'Trash Bin';

SELECT *, ST_Distance(geom, ST_SetSRID(ST_MakePoint( 71.545865, 37.490060), 4326))
AS distance_to_user
FROM food_stall
WHERE type = 'Drinks'
ORDER BY distance_to_user ASC
LIMIT 2;

--- To see the performance of Madina ---

SELECT name, start_time,end_time
FROM performances
where performer_id = 5;

--- To find events between a time frame ---

select name,type, capacity
from events
where start_time >= '10:30:00' and end_time < '17:30:00';

--- Dynaimc to Show food stall ---

SELECT *, ST_Distance(geom, ST_SetSRID(ST_MakePoint( 71.545865, 37.490060), 4326)) AS distance_to_user
FROM food_stall
WHERE type = 'Traditional'
ORDER BY distance_to_user ASC
LIMIT 2;

--- Dynamic with Path to traditional food---

WITH nearest_food_stall AS (
    SELECT *, ST_Distance(geom, ST_SetSRID(ST_MakePoint(71.545865, 37.490060), 4326)) AS distance_to_user
    FROM food_stall
    WHERE type = 'Traditional'
    ORDER BY distance_to_user ASC
    LIMIT 1
)
SELECT ST_ShortestLine(ST_SetSRID(ST_MakePoint(71.545865, 37.490060), 4326), nearest_food_stall.geom) AS displacement_line, nearest_food_stall.*
FROM nearest_food_stall;


--- Dynamic with Path to Roller Coaster---


WITH roller_coaster AS (
    SELECT *, ST_Distance(geom, ST_SetSRID(ST_MakePoint(71.545865, 37.490060), 4326)) AS distance_to_user
    FROM fun_activities
    WHERE name = 'Roller Coaster'
    ORDER BY distance_to_user ASC
    LIMIT 1
)
SELECT ST_ShortestLine(ST_SetSRID(ST_MakePoint(71.545865, 37.490060), 4326), roller_coaster.geom) AS displacement_line,roller_coaster.*
FROM roller_coaster;


--- View for traditional food --- 

 CREATE VIEW Traditional_Food AS
 select * from food_stall
 where type = 'Traditional'

--- View for Music performances ---

 CREATE VIEW Music_Performance AS
 select * from performances
 where name = 'Music'

--- View for all the toilets ---

CREATE VIEW All_Toilet AS
select * from toilets

--- View for all the garbage bins --- 
CREATE VIEW garbage_bin AS
select * from garbage_bins

--- View for all the garbage bins --- 
CREATE VIEW garbage_bin AS
select * from garbage_bins

--- View for first aid stations --- 
CREATE VIEW first_aid_station AS
select * from first_aid_stations



