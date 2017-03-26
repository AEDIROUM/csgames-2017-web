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
    from_user_id INTEGER NOT NULL,
    content TEXT,
    last_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE comments(
    id INTEGER NOT NULL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    video_id INTEGER NOT NULL,
    content TEXT
);

CREATE TABLE history(
    id INTEGER NOT NULL PRIMARY KEY,
    user_id INTEGER,
    video_id INTEGER NOT NULL,
    last_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

create table videos (
    id integer not null primary key,
    title       TEXT,
    description TEXT,
    url         TEXT,
    thumbnail   TEXT,
    added       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

create table video_tags (
    video_id INTEGER,
    tag      TEXT
);


INSERT INTO users(username, password, rank, name, bio)
       VALUES("admin", "admin", "admin", "Kévin", "jeune boloss parisiien du 64 wesh tro cho le mek tavu"),
             ("user", "user", "user", "Bernard Pivot", "Bernard Pivot, né le 5 mai 1935 à Lyon dans le Rhône, est un journaliste français, animateur d'émissions culturelles à la télévision.");




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

insert into video_tags values (2, "matrix");
insert into video_tags values (2, "code");
insert into video_tags values (2, "hacker");
insert into video_tags values (2, "hacking");
insert into video_tags values (2, "terminal");
insert into video_tags values (2, "console");
insert into video_tags values (2, "programming");
insert into video_tags values (2,"program");
insert into video_tags values (2,"coding");
insert into video_tags values (2,"computer");
insert into video_tags values (2, "technology");
insert into video_tags values (2, "pc");

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


INSERT INTO comments
VALUES(NULL, 1, 1, "wesh tro chelou mec put1 la viiiiid de sa mere");

INSERT INTO messages(user_id, from_user_id, content)
       VALUES(1, 1, "wesh kévin ces kévin on se conné ptd r!!1"),
             (1, 2, "Excuse-moi petit, mais tu devrais soigner ton orthographe...");
