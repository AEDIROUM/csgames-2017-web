-- Professeurs
CREATE TABLE users(
    id INTEGER NOT NULL PRIMARY KEY,
    username TEXT,
    password TEXT,
    name TEXT,
    bio TEXT,
    photo TEXT,
    rank TEXT
);

CREATE TABLE messages(
    id INTEGER NOT NULL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    content TEXT
);

CREATE TABLE comments(
    id INTEGER NOT NULL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    video_id INTEGER NOT NULL,
    content TEXT
);

CREATE TABLE history(
    id INTEGER NOT NULL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    video_id INTEGER NOT NULL,
    last_date INTEGER NOT NULL
);

create table videos (
    id integer not null primary key,
    title       TEXT,
    description TEXT,
    url         TEXT,
    thumbnail   TEXT
);

create table video_tags (
    video_id INTEGER,
    tag      TEXT
);


INSERT INTO users(username, password, rank)
       VALUES("admin", "admin", "admin"),
             ("user", "user", "user");




-- WITH RECURSIVE parent(category_id, nom, level) AS (SELECT category_id, name, 0 FROM categories WHERE id=? UNION ALL SELECT categories.category_id, categories.name, parent.level + 1 FROM categories JOIN parent ON parent.category_id=categories.id) SELECT * FROM parent

-- PRAGMA foreign_keys = ON;
insert into videos (id, title, description, url, thumbnail) values (
1,
"Drone Footage of High Rises in a City",
"Wow! A drone that flies over a city, that's surreal! ÉTS should buy a drone and make videos with one.",
"http://localhost:3000/videos/drone.mp4",
"http://localhost:3000/thumbnails/drone.png");

insert into video_tags values (1, "skyline");
insert into video_tags values (1, "streets");
insert into video_tags values (1, "high rises");
insert into video_tags values (1, "buildings");
insert into video_tags values (1, "aerial");
insert into video_tags values (1, "drone");
insert into video_tags values (1, "footage");

insert into videos (title, description, url, thumbnail) values (
		"Master hacker doing his work",
		"You thought you were a hacker? Look at this guy, typing on multiple screens at the same time.",
		"http://localhost:3000/videos/hackertype.mp4",
		"http://localhost:3000/thumbnails/hackertype.png");

		-- "tags" : ["matrix", "code", "hacker", "hacking", "terminal", "console", "programming", "program", "coding", "computer", "technology", "pc"]

insert into videos (title, description, url, thumbnail) values (
		"A person working on a MacBook",
		"It's a person. Maybe it's a guy, maybe it's a girl, who knows? Who knows what this person is up to? Nobody.",
		"http://localhost:3000/videos/macbook.mp4",
		"http://localhost:3000/thumbnails/macbook.png");
		-- "tags" : ["computer", "technology", "macbook", "apple", "typing", "notebook", "working", "writing"]
insert into videos (title, description, url, thumbnail) values (
		"Satellite orbiting in SPACE",
		"Now wait. How did it even get recorded? It doesn't make sense, but here is a video of a satellite orbiting in OUTER SPACE!",
		"http://localhost:3000/videos/satellite.mp4",
		"http://localhost:3000/thumbnails/satellite.png");

-- "tags" : ["satellite", "outer space", "orbit", "technology", "space"]

insert into videos (title, description, url, thumbnail) values (
    "Montreal skyline on Mount Royal",
    "How is that for a view? Pretty good indeed!",
    "http://localhost:3000/videos/montreal.mp4",
    "http://localhost:3000/thumbnails/montreal.png");

    -- "tags" : ["city", "people", "town", "view", "mount royal"]
