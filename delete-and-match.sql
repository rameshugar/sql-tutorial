DELETE FROM pet WHERE id IN (
    SELECT person_pet.pet_id
    FROM person_pet, person
    WHERE
    person.id = person_pet.person_id AND
    person.first_name = "Zed");


SELECT * FROM pet;

SELECT * FROM person_pet;

DELETE FROM person_pet
    WHERE pet_id NOT IN (
        SELECT id FROM pet
    );

SELECT * FROM person_pet;
