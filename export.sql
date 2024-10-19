CREATE TABLE IF NOT EXISTS "users" (
    "id" INTEGER,
    "joined" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "display_name" VARCHAR(50) CHECK(length("display_name") >= 5) NOT NULL,
    "about" VARCHAR(250),
    "type" VARCHAR(25) CHECK("type" IN ('person', 'organization')) NOT NULL,
    "username" VARCHAR(50) NOT NULL UNIQUE,
    "password" VARCHAR(50) NOT NULL,
    PRIMARY KEY ("id")
);
CREATE TABLE IF NOT EXISTS "threads" (
    "id" INTEGER,
    "user_id" INTEGER,
    "title" VARCHAR(250) NOT NULL,
    "posted_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "votes" INTEGER DEFAULT 0,
    -- TODO trigger to update votes
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE 
);
CREATE TABLE IF NOT EXISTS "tags" (
    "id" INTEGER,
    "name" VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);
CREATE TABLE IF NOT EXISTS "thread_tags" (
    "id" INTEGER,
    "thread_id" INTEGER NOT NULL,
    "tag_id" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("thread_id") REFERENCES "threads" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("tag_id") REFERENCES "tags" ("id")
);
CREATE TABLE IF NOT EXISTS "posts" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "title" VARCHAR(250) NOT NULL,
    "content" TEXT NOT NULL,
    "posted_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "likes" INTEGER DEFAULT 0,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "post_comments" (
    "id" INTEGER,
    "comment_id" INTEGER DEFAULT NULL,
    "post_id" INTEGER DEFAULT NULL,
    "user_id" INTEGER NOT NULL,
    "comment" VARCHAR(250) NOT NULL,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("comment_id") REFERENCES "post_comments" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("post_id") REFERENCES "posts" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "post_likes" (
    "id" INTEGER,
    "post_id" INTEGER,
    "user_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("post_id") REFERENCES "posts" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE
);
CREATE TRIGGER "like"
AFTER INSERT ON "post_likes"
BEGIN
    UPDATE "posts" SET "likes" = "likes" + 1
    WHERE "posts"."id" = NEW."post_id";
END;
CREATE TRIGGER "unlike"
BEFORE DELETE ON "post_likes"
BEGIN
    UPDATE "posts" SET "likes" = "likes" - 1
    WHERE "posts"."id" = OLD."post_id";
END;
+----+---------------------+---------------------+-------------------------------------------------+--------+---------------+-------------+
| id |       joined        |    display_name     |                      about                      |  type  |   username    |  password   |
+----+---------------------+---------------------+-------------------------------------------------+--------+---------------+-------------+
| 2  | 2024-09-21 17:13:01 | Lex Fridman         | AI researcher and podcaster.                    | person | lexfri        | lncvbnmirt  |
| 3  | 2024-09-21 17:13:01 | Yuval Noah Harari   | Historian and author of "Sapiens".              | person | yuvalnoah     | powedgvbcf  |
| 4  | 2024-09-21 17:13:01 | Ada Lovelace        | Pioneer of computer programming.                | person | adalove       | qwertyuiop  |
| 5  | 2024-09-21 17:13:01 | Elon Musk           | CEO of Tesla and SpaceX.                        | person | elonmusk      | asdzxcvbnm  |
| 6  | 2024-09-21 17:13:01 | Grace Hopper        | Inventor of the first compiler.                 | person | gracehop      | plmoknijb   |
| 7  | 2024-09-21 17:13:01 | Alan Turing         | Father of modern computer science.              | person | alanturing    | lkjhgfdsaz  |
| 8  | 2024-09-21 17:13:01 | Marie Curie         | Nobel-winning physicist and chemist.            | person | mariecurie    | poiuytrewq  |
| 9  | 2024-09-21 17:13:01 | Nikola Tesla        | Inventor and electrical engineer.               | person | nikolatesla   | zxcvbnmasd  |
| 10 | 2024-09-21 17:13:01 | Katherine Johnson   | NASA mathematician.                             | person | kathjohnson   | mnbvcxzasd  |
| 11 | 2024-09-21 17:13:01 | Tim Berners-Lee     | Inventor of the World Wide Web.                 | person | timberners    | asdfghjkl   |
| 12 | 2024-09-21 17:13:01 | Stephen Hawking     | Theoretical physicist, author.                  | person | stephenhawk   | qazwsxedc   |
| 13 | 2024-09-21 17:13:01 | Carl Sagan          | Astronomer, author, and science communicator.   | person | carlsagan     | edcrfvtgby  |
| 14 | 2024-09-21 17:13:01 | Jane Goodall        | Primatologist, chimpanzee researcher.           | person | janegoodall   | fghjklpoi   |
| 15 | 2024-09-21 17:13:01 | Rosalind Franklin   | Key contributor to DNA structure discovery.     | person | rosfranklin   | hjkluytre   |
| 16 | 2024-09-21 17:13:01 | Sundar Pichai       | CEO of Google.                                  | person | sundarp       | vbnmnbvcxz  |
| 17 | 2024-09-21 17:13:01 | Mark Zuckerberg     | Co-founder and CEO of Facebook.                 | person | markzuck      | nmkjlopokl  |
| 18 | 2024-09-21 17:13:01 | Jeff Bezos          | Founder of Amazon.                              | person | jeffbezos     | zxcvbmnbvc  |
| 19 | 2024-09-21 17:13:01 | Satya Nadella       | CEO of Microsoft.                               | person | satyanad      | lkjhgtfrde  |
| 20 | 2024-09-21 17:13:01 | Sheryl Sandberg     | COO of Facebook.                                | person | sheryls       | mnbvccxzas  |
| 21 | 2024-09-21 17:13:01 | Steve Jobs          | Co-founder of Apple.                            | person | stevejobs     | wertyuiklm  |
| 22 | 2024-09-21 17:13:01 | Bill Gates          | Co-founder of Microsoft.                        | person | billgates     | wertyuiopa  |
| 23 | 2024-09-21 17:13:01 | Larry Page          | Co-founder of Google.                           | person | larrypage     | qazxswedcv  |
| 24 | 2024-09-21 17:13:01 | Sergey Brin         | Co-founder of Google.                           | person | sergeybrin    | rtyuiklmnv  |
| 25 | 2024-09-21 17:13:01 | Linus Torvalds      | Creator of Linux kernel.                        | person | linust        | asdfqwerty  |
| 26 | 2024-09-21 17:13:01 | Dennis Ritchie      | Co-creator of Unix and C language.              | person | dennritchie   | poiuytrewq  |
| 27 | 2024-09-21 17:13:01 | John von Neumann    | Mathematician and polymath.                     | person | vonneumann    | plokijmnbv  |
| 28 | 2024-09-21 17:13:01 | Claude Shannon      | Father of information theory.                   | person | claudeshannon | hjklpoiuyt  |
| 29 | 2024-09-21 17:13:01 | Edwin Hubble        | Astronomer, discovered universe expansion.      | person | edhubble      | kjhgfdsawa  |
| 30 | 2024-09-21 17:13:01 | Richard Feynman     | Nobel-winning physicist.                        | person | richardfeyn   | mnbvghtrdx  |
| 31 | 2024-09-21 17:13:01 | George Boole        | Founder of Boolean algebra.                     | person | georgeboole   | qazplmnbvc  |
| 32 | 2024-09-21 17:13:01 | Isaac Newton        | Physicist, laws of motion and gravity.          | person | isaacnewton   | xswerdfghy  |
| 33 | 2024-09-21 17:13:01 | Leonhard Euler      | Mathematician, major contributions to calculus. | person | leoneuler     | xcvbnmlkjh  |
| 34 | 2024-09-21 17:13:01 | Blaise Pascal       | Mathematician, physicist, inventor.             | person | blaispascal   | wertyuiopl  |
| 35 | 2024-09-21 17:13:01 | Thomas Edison       | Inventor of the light bulb.                     | person | thomasedison  | poiuytrews  |
| 36 | 2024-09-21 17:13:01 | James Clerk Maxwell | Theorized electromagnetic waves.                | person | jamesclerk    | asdfghjklz  |
| 37 | 2024-09-21 17:13:01 | Robert Oppenheimer  | Father of the atomic bomb.                      | person | robertopp     | mnbvcxzasa  |
| 38 | 2024-09-21 17:13:01 | Niels Bohr          | Nobel-winning physicist, quantum theory.        | person | nielsbohr     | plokimnhgf  |
| 39 | 2024-09-21 17:13:01 | Max Planck          | Founder of quantum theory.                      | person | maxplanck     | zxcvbnmtyu  |
| 40 | 2024-09-21 17:13:01 | Marie Tharp         | Mapped the ocean floor.                         | person | marietharp    | qwertyvcxz  |
| 41 | 2024-09-21 17:13:01 | Richard Stallman    | Free software advocate.                         | person | richstallman  | mnbvtyujkm  |
| 42 | 2024-09-21 17:13:01 | Vint Cerf           | Co-inventor of the internet.                    | person | vintcerf      | kjhgfdsawe  |
| 43 | 2024-09-21 17:13:01 | Gordon Moore        | Co-founder of Intel.                            | person | gordonmoore   | vbnmasdfgh  |
| 44 | 2024-09-21 17:13:01 | Jon von Neumann     | Mathematician, game theory founder.             | person | jonneumann    | zxqwertybn  |
| 45 | 2024-09-21 17:13:01 | Charles Babbage     | Father of the computer.                         | person | charlesbabb   | poiuylkjhg  |
| 46 | 2024-09-21 17:13:01 | John McCarthy       | Pioneer of AI, Lisp creator.                    | person | johnmccarthy  | mnbvcxzqaz  |
| 47 | 2024-09-21 17:13:01 | Ada Yonath          | Nobel-winning crystallographer.                 | person | adayonath     | wertyuioplm |
| 48 | 2024-09-21 17:13:01 | Edsger Dijkstra     | Pioneer of algorithms.                          | person | edsgerdijk    | vcxzasdfgh  |
| 49 | 2024-09-21 17:13:01 | Barbara Liskov      | Programming language pioneer.                   | person | barbliskov    | qazplmnbvc  |
| 50 | 2024-09-21 17:13:01 | Donald Knuth        | Author of "The Art of Computer Programming".    | person | donaldknuth   | werfdcxzas  |
+----+---------------------+---------------------+-------------------------------------------------+--------+---------------+-------------+
CREATE TABLE IF NOT EXISTS "users" (
    "id" INTEGER,
    "joined" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "display_name" VARCHAR(50) CHECK(length("display_name") >= 5) NOT NULL,
    "about" VARCHAR(250),
    "type" VARCHAR(25) CHECK("type" IN ('person', 'organization')) NOT NULL,
    "username" VARCHAR(50) NOT NULL UNIQUE,
    "password" VARCHAR(50) NOT NULL,
    PRIMARY KEY ("id")
);
CREATE TABLE IF NOT EXISTS "threads" (
    "id" INTEGER,
    "user_id" INTEGER,
    "title" VARCHAR(250) NOT NULL,
    "posted_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "votes" INTEGER DEFAULT 0,
    -- TODO trigger to update votes
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE 
);
CREATE TABLE IF NOT EXISTS "tags" (
    "id" INTEGER,
    "name" VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);
CREATE TABLE IF NOT EXISTS "thread_tags" (
    "id" INTEGER,
    "thread_id" INTEGER NOT NULL,
    "tag_id" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("thread_id") REFERENCES "threads" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("tag_id") REFERENCES "tags" ("id")
);
CREATE TABLE IF NOT EXISTS "posts" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "title" VARCHAR(250) NOT NULL,
    "content" TEXT NOT NULL,
    "posted_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "likes" INTEGER DEFAULT 0,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "post_comments" (
    "id" INTEGER,
    "comment_id" INTEGER DEFAULT NULL,
    "post_id" INTEGER DEFAULT NULL,
    "user_id" INTEGER NOT NULL,
    "comment" VARCHAR(250) NOT NULL,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("comment_id") REFERENCES "post_comments" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("post_id") REFERENCES "posts" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "post_likes" (
    "id" INTEGER,
    "post_id" INTEGER,
    "user_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("post_id") REFERENCES "posts" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE
);
CREATE TRIGGER "like"
AFTER INSERT ON "post_likes"
BEGIN
    UPDATE "posts" SET "likes" = "likes" + 1
    WHERE "posts"."id" = NEW."post_id";
END;
CREATE TRIGGER "unlike"
BEFORE DELETE ON "post_likes"
BEGIN
    UPDATE "posts" SET "likes" = "likes" - 1
    WHERE "posts"."id" = OLD."post_id";
END;
