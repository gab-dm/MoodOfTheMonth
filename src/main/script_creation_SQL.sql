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

INSERT INTO employees (name, email, birthdate) VALUES ('Tom Kauffmann', 'tkauffmann@takima.fr', '1999-04-23');
INSERT INTO employees (name, email, birthdate) VALUES ('Steven Tien', 'stien@takima.fr', '1998-10-23');
INSERT INTO employees (name, email, birthdate) VALUES ('Gabriel de Montcheuil', 'gdemontcheuil@takima.fr', '1998-02-19');

INSERT INTO moods (mark, name, comment) VALUES (1, 'Gabriel de Montcheuil', 'ceci est un test de commentaire random : hibernate on te déteste');
