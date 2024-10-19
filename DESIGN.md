# Design Document

By Roufujjaman Rahat

Video overview: <URL HERE>

## Scope

The database is designed for a thread-based social platform fostering organized discussions and community engagement.

As such, included in the database's scope is:
* __Users__: Identyfying informations of an user, such as display name, username, password and joining date etc.
* __Threads__: Starts a disscussion stream with a title and tags, serving the core of any organized conversation
* __Posts__: Content shared by the users independently of across multiple threads
* __Tags__: Categorize threads and help find similar discussions stream 
* __Votes__: Attribute available for threads to either upvote or downvote
* __Comments__, __Likes__: Attributes availabe to posts

Out of the scope elements are a complete user profile, a ranking system for the threads for example by popularity or votes and othe non-core attributes.

## Functional Requirements

This database will support:

* All essential CRUD operations
* Creating thread, posting within a thread, rerposting to multiple threads, and tagging threads
* Upvoting the threads
* Comment on posts and like posts.


* What's beyond the scope of what a user should be able to do with your database?
* making firends and follow

## Representation

### Entities

####  Users
The `users` table includes:
* `id`, which specifies the unique ID for the user as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied
* `joined`, which specifies when the user joined the platform as a `DATETIME` data type. This column thus has `DEFAULT CURRENT_TIMESTAMP` constraint applied
* `display_name` `TEXT` NOT NULL
* `type` `TEXT` CHECK("type" IN ('person', 'organization')),
* `username` `TEXT` NOT NULL `UNIQUE`
* `password` `TEXT` NOT NULL

* `id` `INTEGER`
* `joined` `DATETIME `DEFAULT `CURRENT_TIMESTAMP`,
* `display_name` `VARCHAR`(50) CHECK(length(`display_name`) >= 5) NOT NULL
* `about` `VARCHAR(250)` 
* `type`  `VARCHAR(25)` CHECK(`type` IN ('person', 'organization')) NOT NULL
* `username`  `VARCHAR(100)` NOT NULL `UNIQUE` 
* `password`  `VARCHAR(100)` NOT NUL
* PRIMARY KEY (`id`)


#### Threads
The `threads` table includes:
* `id`, `PRRIMARY KEY` of the table 
* `id` `INTEGER` 
* `user_id` `INTEGER` 
* `title`  `TEXT` NOT NULL,
* `posted_at`  `DATETIME` DEFAULT `CURRENT_TIMESTAMP` 
* `votes`  `INTEGER` `DEFAULT 0`

In this section you should answer the following questions:

* Which entities will you choose to represent in your database?
* What attributes will those entities have?
* Why did you choose the types you did?
* Why did you choose the constraints you did?

### Relationships

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?

## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?
* What might your database not be able to represent very well?
