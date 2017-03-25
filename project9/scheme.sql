-- Professeurs
CREATE TABLE users(
    id INTEGER NOT NULL PRIMARY KEY,
    username TEXT,
    password TEXT,
    rank TEXT
);

create table videos (
    title       TEXT,
    description TEXT,
    url         TEXT,
    thumbnail   TEXT
);

create table tags (
    id INTEGER NOT NULL PRIMARY KEY,
    name TEXT
);

create table videos_tags (
    video_id INTEGER,
    tag_id   INTEGER
);

INSERT INTO users(username, password, rank)
       VALUES("admin", "admin", "admin"),
             ("user", "user", "user");


-- WITH RECURSIVE parent(category_id, nom, level) AS (SELECT category_id, name, 0 FROM categories WHERE id=? UNION ALL SELECT categories.category_id, categories.name, parent.level + 1 FROM categories JOIN parent ON parent.category_id=categories.id) SELECT * FROM parent

-- PRAGMA foreign_keys = ON;
