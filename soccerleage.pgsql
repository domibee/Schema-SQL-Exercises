CREATE DATABASE soccer;
\c soccer;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name TEXT
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);
CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    player_name TEXT,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team1 INTEGER REFERENCES teams,
    team2 INTEGER REFERENCES teams,
    winner_result INTEGER references teams,
    seasonid INTEGER REFERENCES season
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    game_id INTEGER REFERENCES matches
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    ref_name TEXT,
    game_id INTEGER REFERENCES matches
);

INSERT INTO teams (team_name)
VALUES
('wow'),
('okay'),
('lol'),
('nice');

INSERT INTO season (start_date, end_date)
VALUES ('2021-05-23', '2021-10-10');

INSERT INTO players (player_name, team_id)
VALUES
('Ei',2),
('Tako',3),
('Mito',1),
('Corone',4);

INSERT INTO matches (team1, team2, winner_result, seasonid)
VALUES 
(1,4,1,1),
(2,1,1,1),
(3,4,3,1),
(2,3,2,1);

INSERT INTO goals (player_id, game_id)
VALUES 
(1,1),
(2,4),
(3,3),
(4,1);

INSERT INTO referees (ref_name, game_id)
VALUES
('Maro',3),
('Remu',2),
('Monblan',4),
('Kuri',1);
