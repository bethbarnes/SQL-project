CREATE TABLE movies (
  id INTEGER PRIMARY KEY,
  name TEXT DEFAULT NULL,
  year INTEGER DEFAULT NULL,
  rank REAL DEFAULT NULL
);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY,
  first_name TEXT DEFAULT NULL,
  last_name TEXT DEFAULT NULL,
  gender TEXT DEFAULT NULL
);

CREATE TABLE roles (
  actor_id INTEGER,
  movie_id INTEGER,
  role_name TEXT DEFAULT NULL
);

SELECT name, year FROM movies WHERE year=1994;

SELECT *
FROM actors
WHERE last_name LIKE "%stack%";

to find most common:

SELECT first_name FROM actors
GROUP BY first_name
HAVING COUNT(*) = (
                   SELECT MAX(Cnt)
                   FROM(
                         SELECT COUNT(*) as Cnt


SELECT first_name FROM actors GROUP BY first_name ORDER BY count(first_name) DESC LIMIT 10;


SELECT first_name, last_name, count(roles.actor_id)
FROM roles
Inner JOIN actors
ON actors.id=roles.actor_id  GROUP BY actor_id ORDER BY count(roles.actor_id) DESC LIMIT 10;

SELECT genre
FROM movies_genres
GROUP BY genre
ORDER BY count(genre)
ASC;


SELECT id
FROM movies
WHERE name='Braveheart'
46169

SELECT first_name, last_name
FROM roles
JOIN actors
ON id = actor_id
WHERE movie_id='46169'
ORDER BY last_name
ASC;

SELECT first_name, last_name
FROM movies_genres
JOIN movies
ON movies.id = movies_genres.movie_id
JOIN movies_directors
ON movies.id = movies_directors.movie_id
JOIN directors
ON directors.id = movies_directors.director_id
WHERE (year % 4 ) = 0 AND genre = 'Film-Noir';

22591

SELECT movies.name, first_name, last_name
FROM roles
JOIN movies_genres
ON roles.movie_id = movies_genres.movie_id
JOIN roles AS roles2
ON roles2.movie_id = roles.movie_id
JOIN actors
ON actors.id = roles2.actor_id
JOIN movies
ON movies.id = roles2.movie_id
WHERE roles.actor_id = '22591' AND genre = "Drama" AND roles2.actor_id != '22591'
ORDER BY movies.name
DESC;

