CREATE TABLE person (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INTEGER
);


INSERT INTO person
(id, first_name, last_name, age)
VALUES
  (0, 'Zed', 'Shaw', 37),
  (1, 'Terry', 'Berry', 42),
  (2, 'Tyler', 'Brown', 25),
  (3, 'Frank', 'Smith', 100);
