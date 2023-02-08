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

INSERT INTO employees (name, email, birthdate) VALUES ('Tom Kauffmann', 'tkauffmann@takima.fr', '23-04-1999');
INSERT INTO employees (name, email, birthdate) VALUES ('Steven Tien', 'stien@takima.fr', '23-10-1999');
INSERT INTO employees (name, email, birthdate) VALUES ('Gabriel de Montcheuil', 'gdemontcheuil@takima.fr', '19-02-1998');

INSERT INTO moods (mark, name, comment) VALUES (1, 'Gabriel de Montcheuil', 'ceci est un test de commentaire random : hibernate on te déteste');