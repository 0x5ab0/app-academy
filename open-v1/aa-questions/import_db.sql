-- SETUP

DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON; -- turn on the foreign key constraints to ensure data integrity

-- DATA DEFINITION

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    author_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    author_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- SEEDING

INSERT INTO
    users (fname, lname)
VALUES
    ("Nayan", "Samuels"),
    ("Martin", "Naylor"),
    ("Mikaela", "Wood"),
    ("Jessica", "Summers"),
    ("Mustafa", "Beard")
;

INSERT INTO
    questions (author_id, title, body)
VALUES
    (3, "Help with SQLite3 pls", "I keep getting an error with the SQLite3 gem for Ruby. Help please!"),
    (2, "How to use WSL2?", "I just installed WSL2 (Ubuntu 20.04) and I'm a bit lost. Appreciate any assistance..."),
    (5, "What are your favorite hobbies?", "A bit off-topic, but I'm curious to know what y'all are interested in besides programming!")
;

INSERT INTO
    question_follows (user_id, question_id)
VALUES
    (3, 1),
    (1, 1),
    (2, 2),
    (5, 2),
    (1, 2),
    (5, 3),
    (1, 3),
    (2, 3),
    (3, 3),
    (4, 3)
;

INSERT INTO
    replies (author_id, question_id, parent_reply_id, body)
VALUES
    (1, 1, NULL, "Did you install the gem using bundle install sqlite3?"),
    (3, 1, 1, "Yeah... I tried bundle install sqlite and nothing's working..."),
    (1, 1, 2, "Bud, you're missing the version number! Try typing 'sqlite3' instead of 'sqlite'. :)"),
    (3, 1, 3, "Can't believe I missed that! Thanks so much!!!"),
    (5, 2, NULL, "Happy to help! Just shoot me a DM and I'll see what I can help you with."),
    (1, 2, NULL, "Could you be a bit more specific? What exactly do you need help with?"),
    (1, 2, 6, "There's plenty of documentation online if you want to have a general overview of how WSL2 works."),
    (1, 3, NULL, "Hah! Original question. I love skiing!"),
    (5, 3, 8, "Hey, I live for skiing! Let's hit the slopes sometime!"),
    (1, 3, 9, "You got it ;)"),
    (2, 3, NULL, "I'm a sucker for baking cakes. And muffins. And cupcakes. Pretty much anything that's fluffy lol."),
    (3, 3, NULL, "Honestly, programming is kind of 95% my life. All my hobbies involve coding somehow!"),
    (4, 3, NULL, "Running, cycling, swimming... I'm a thriatlon kind of guy!")
;

INSERT INTO
    question_likes (user_id, question_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 3),
    (4, 3),
    (5, 1)
;