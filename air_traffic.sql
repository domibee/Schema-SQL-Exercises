-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name_id INTEGER REFERENCES passengers NOT NULL,
  last_name_id INTEGER REFERENCES passengers NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines NOT NULL,
  from_city_id INTEGER REFERENCES cities NOT NULL,
  from_country_id INTEGER REFERENCES countries NOT NULL,
  to_city_id INTEGER REFERENCES cities NOT NULL,
  to_country_id INTEGER REFERENCES countries NOT NULL
);

INSERT INTO countries (country_name)
VALUES 
  ('United States'), ('Japan'), ('United Kingdom'), ('Mexico'), ('France'), ('Morroco'), ('UAE'), ('China'),('Brazil'),('Chile');

INSERT INTO cities (city_name)
VALUES
  ('Washington DC'), ('Seattle'), ('Tokyo'), ('London'), ('Los Angeles'), ('Las Vegas'), ('Mexico City'), 
  ('Paris'), ('Casablanca'), ('Dubai'), ('Beijing'), ('New York'), ('Charlotte'), ('Cedar Rapids'), ('Chicago'), ('New Orleans'),
  ('Sao Paolo'), ('Santiago');

INSERT INTO airlines (airline_name)
VALUES
  ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brasil');

INSERT INTO passengers (first_name, last_name)
VALUES 
  ('Jennifer','Finch'), ('Thadeus','Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'), ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'), ('Cory', 'Squibbes');

INSERT INTO tickets
  (first_name_id, last_name_id, seat, departure, arrival, airline_id, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
  (1, 1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2, 1),
  (2, 2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 2, 4, 3),
  (3, 3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 1, 5, 1),
  (1, 1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 7, 4),
  (4, 4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 5, 9, 6),
  (2, 2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 7, 11, 8),
  (5,5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 1, 13, 1),
  (6,6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 1, 15, 1),
  (5,5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 1, 16, 1),
  (7,7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 9, 18, 10);

