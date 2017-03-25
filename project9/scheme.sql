-- Professeurs
CREATE TABLE users(
    id INTEGER NOT NULL PRIMARY KEY,
    email TEXT,
    password TEXT,
    rank TEXT
);


INSERT INTO users(email, password, rank)
       VALUES("admin", "admin", "admin"),
             ("user", "user", "user");


-- WITH RECURSIVE parent(category_id, nom, level) AS (SELECT category_id, name, 0 FROM categories WHERE id=? UNION ALL SELECT categories.category_id, categories.name, parent.level + 1 FROM categories JOIN parent ON parent.category_id=categories.id) SELECT * FROM parent

-- PRAGMA foreign_keys = ON;
