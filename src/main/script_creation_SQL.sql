CREATE TABLE employees (
    uuid serial PRIMARY KEY,
    name varchar (50) NOT NULL,
    email varchar (50) NOT NULL,
    birthdate date
);

CREATE TABLE moods (
    uuid serial PRIMARY KEY,
    mark int NOT NULL,
    name varchar (50),
    comment varchar (200)
);