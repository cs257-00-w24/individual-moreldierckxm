DROP TABLE IF EXISTS earthquakes;
CREATE TABLE earthquakes (
  quaketime timestamp,
  latitude float,
  longitude float,
  magnitude float,
  quakeid text,
  place text,
  quaketype text
);