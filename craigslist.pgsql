CREATE DATABASE craigslist;
\c craigslist;

CREATE TABLE region(
    id SERIAL PRIMARY KEY,
    city TEXT
);

CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    location TEXT,
    region_id INTEGER REFERENCES region
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    preferred_region_id INTEGER REFERENCES location
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category TEXT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT,
    post_text TEXT,
    username_id INTEGER REFERENCES users,
    location_id INTEGER REFERENCES location,
    region_id INTEGER REFERENCES region,
    category_id INTEGER REFERENCES categories
);

INSERT INTO region (city)
VALUES
('San Francisco'),
('Atlanta'),
('Seattle'),
('Los Angeles');

INSERT INTO location (location,region_id)
VALUES 
('fish place',3),
('club',2),
('bridge',1),
('nobu',4),
('ghirardelli',1);

INSERT INTO users(username,preferred_region_id)
VALUES 
('sfluvr',1),
('yesrain',3),
('sunny',4),
('party2nite',2);

INSERT INTO categories (category)
VALUES
('job'),
('pets');

INSERT INTO posts(title, post_text, username_id, location_id, region_id, category_id)
VALUES
('SWE position','Looking for a talented worker',1,5,1,1),
('Lost puppy','Looking for cute golden doodle',2,1,3,2),
('FOUND PUPPY','Found a cute golden doodle',4,4,4,2);

