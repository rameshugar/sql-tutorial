CREATE TABLE pet (
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT,
    age INTEGER,
    dead INTEGER);


CREATE TABLE person_pet (
    person_id INTEGER,
    pet_id INTEGER);



CREATE TABLE vehicle (
    id INTEGER PRIMARY KEY,
    name TEXT,
    company TEXT,
    year INTEGER,
    mileage INTEGER);
