ALTER TABLE person ADD COLUMN dead INTEGER;
ALTER TABLE person ADD COLUMN phone_number CHAR(8);
ALTER TABLE person ADD COLUMN salary FLOAT;
ALTER TABLE person ADD COLUMN dob DATETIME;
ALTER TABLE person_pet ADD COLUMN purchased_on DATETIME;
ALTER TABLE pet ADD COLUMN parent INT;

UPDATE person SET
    dead = 0,
    phone_number = (
    CASE 
        WHEN person.id = 0 THEN "867-5309"
	WHEN person.id = 1 THEN "555-9021"
	WHEN person.id = 2 THEN "321-3097"
	WHEN person.id = 3 THEN "332-1826"
	ELSE "missing"
    END ),
    salary = (
    CASE 
        WHEN person.id <= 1 THEN 45000.00
	WHEN person.id > 1 THEN 65000.00
	ELSE 0
    END ),
    dob = '1988-02-02 03:00:00';


UPDATE pet

INNER JOIN person_pet ON pet.id = person_pet.pet_id

SET pet.parent = person_pet.person_id;


UPDATE person_pet 
SET purchased_on = (
    CASE
        WHEN person_pet.person_id >= 0 AND
	     person_pet.person_id <= 4 THEN '1998-02-02 03:00:00'
	WHEN person_pet.person_id = 5 OR
	     person_pet.person_id = 6 THEN '2000-02-02 03:04:00'
	WHEN person_pet.person_id = 7 THEN '2012-02-02 03:14:00'
	ELSE 0
    END);


INSERT INTO person
(id, first_name, last_name, age, dead, salary, dob, phone_number)
VALUES
    (4, "Rufus", "Mova", 21, 0, 25000.00, '1992-04-04 03:04:00', "123-4567"),
    (5, "Brutus", "Opah", 22, 0, 25000.00,'1991-04-05 03:04:00', "567-1234"),
    (6, "Wheatus", "TheBand", 34, 1, 100000.00, '1991-04-02 03:04:00',
        "434-0595"),
    (7, "Jolene", "Mean", 26, 0, 23000.00, '1987-04-06 03:04:00', "900-0904")
    ;


INSERT INTO pet
(id, name, breed, age, dead, parent)
VALUES
    (3, "Dirka", "Dragon", 4000, 0, 4),
    (4, "Quirka", "Wagon", 4, 0, 5),
    (5, "Jose", "Cat", 5,0, 6),
    (6, "Monty", "Python", 6,0, 7),
    (7, "Holly", "Grasshopper", 3,0, 5);



INSERT INTO person_pet
(person_id, pet_id, purchased_on)
VALUES
    (4,3,'2013-10-22 03:00:00'),
    (5,4,'2013-10-23 03:00:00'),
    (6,5,'2013-10-24 03:00:00'),
    (7,6,'2013-10-25 03:00:00'),
    (5,7,'2013-10-26 03:00:00');



SELECT pet.name, person.first_name
FROM pet, person, person_pet
WHERE
    person.id = person_pet.person_id
AND
    person_pet.purchased_on >= '2004-01-01 12:00:00';



SELECT person.first_name AS "The Owner",
       pet.name AS "The Pet",
       pet.breed AS "Pet Breed"
FROM pet, person
WHERE pet.parent = person.id
AND pet.parent IN
  (SELECT pet.parent
   FROM pet
   GROUP BY pet.parent
   HAVING COUNT(pet.parent) > 1)
ORDER BY pet.name ASC;
