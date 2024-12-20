-- This SQL file contains the schema of the database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- 'user' table to store all the user data during registration
CREATE TABLE "users" (
    "id" INTEGER,
    "joined" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "display_name" VARCHAR(50) CHECK(length("display_name") >= 5) NOT NULL,
    "about" VARCHAR(250),
    "type" VARCHAR(25) CHECK("type" IN ('person', 'organization')) NOT NULL,
    "username" VARCHAR(100) NOT NULL UNIQUE,
    "password" VARCHAR(100) NOT NULL,
    PRIMARY KEY ("id")
);
-- user profile with limited informations

-- 'threads' table to store all the threads
CREATE TABLE "threads" (
    "id" INTEGER,
    "user_id" INTEGER,
    "title" VARCHAR(250) NOT NULL,
    "posted_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "votes" INTEGER DEFAULT 0,
    -- TODO trigger to update votes
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE 
);

-- 'tags' table to store all tags corresponding to the threads
CREATE TABLE "tags" (
    "id" INTEGER,
    "name" VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

-- thread tags
CREATE TABLE "thread_tags" (
    "id" INTEGER,
    "thread_id" INTEGER NOT NULL,
    "tag_id" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("thread_id") REFERENCES "threads" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("tag_id") REFERENCES "tags" ("id")
);

-- 'posts' table to store all the posts
CREATE TABLE "posts" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "title" VARCHAR(250) NOT NULL,
    "content" TEXT NOT NULL,
    "posted_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "likes" INTEGER DEFAULT 0,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE
);

-- 'thread_posts' table will store 'posts' that are posted on a thread
CREATE TABLE "thread_posts" (
    "id" INTEGER,
    "thread_id" INTEGER,
    "post_id" INTEGER,
    UNIQUE("thread_id", "post_id"),
    PRIMARY KEY ("id"),
    FOREIGN KEY ("thread_id") REFERENCES "threads" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("post_id") REFERENCES "posts" ("id")
);

-- 'comments' table will store users' comments
CREATE TABLE "comments" (
    "id" INTEGER,
    "post_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "comment_id" INTEGER DEFAULT NULL,
    "comment" VARCHAR(250) NOT NULL,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("comment_id") REFERENCES "comments" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("post_id") REFERENCES "posts" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE
);


-- 'votes' table will store thread and user who upvoted the thread 
CREATE TABLE "votes" (
    "id" INTEGER,
    "thread_id" INTEGER,
    "user_id" INTEGER,
    UNIQUE ("thread_id", "user_id"),
    PRIMARY KEY("id"),
    FOREIGN KEY ("thread_id") REFERENCES "threads" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE
);

-- 'likes' table will store post and user who liked it
CREATE TABLE "likes" (
    "id" INTEGER,
    "post_id" INTEGER,
    "user_id" INTEGER,
    UNIQUE("post_id", "user_id"),
    PRIMARY KEY ("id"),
    FOREIGN KEY ("post_id") REFERENCES "posts" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE
);



-- Triggers
-- trigger to increase 'votes' on 'threads' table when the 'votes' is inserted with new record
CREATE TRIGGER "upvote"
AFTER INSERT ON "votes"
BEGIN
    UPDATE "threads" SET "votes" = "votes" + 1
    WHERE "threads"."id" = NEW."thread_id";
END;

-- trigger to decrease 'votes' on 'threads' when a record is deleted from 'likes'
CREATE TRIGGER "downvote"
BEFORE DELETE ON "votes"
BEGIN
    UPDATE "threads" SET "votes" = "votes" - 1
    WHERE "threads"."id" = OLD."thread_id";
END;

-- trigger to increase 'likes' on 'posts' table when the 'likes' is inserted with new record
CREATE TRIGGER "like"
AFTER INSERT ON "likes"
BEGIN
    UPDATE "posts" SET "likes" = "likes" + 1
    WHERE "posts"."id" = NEW."post_id";
END;

-- trigger to decrease 'likes' on 'posts' when a record is delete from 'likes'
CREATE TRIGGER "dislike"
BEFORE DELETE ON "likes"
BEGIN
    UPDATE "posts" SET "likes" = "likes" - 1
    WHERE "posts"."id" = OLD."post_id";
END;