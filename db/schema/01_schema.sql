DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS provinces CASCADE;
DROP TABLE IF EXISTS destinations CASCADE;
DROP TABLE IF EXISTS province_destinations CASCADE;
DROP TABLE IF EXISTS user_favorites CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL, 
  name VARCHAR(255) NOT NULL, 
  avatar VARCHAR(255)
);

CREATE TABLE provinces (
  id SERIAL PRIMARY KEY NOT NULL, 
  full_name VARCHAR(255) NOT NULL,
  short_name VARCHAR(255) NOT NULL
);

CREATE TABLE destinations (
  id SERIAL PRIMARY KEY NOT NULL, 
  name VARCHAR(255) NOT NULL,
  google_place_id VARCHAR(255) NOT NULL
);

CREATE TABLE province_destinations (
  id SERIAL PRIMARY KEY NOT NULL, 
  province_id INTEGER REFERENCES provinces(id) ON DELETE CASCADE,
  destination_id INTEGER REFERENCES destinations(id) ON DELETE CASCADE
);

CREATE TABLE user_favorites (
  id SERIAL PRIMARY KEY NOT NULL, 
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  destination_id INTEGER REFERENCES destinations(id) ON DELETE CASCADE
);