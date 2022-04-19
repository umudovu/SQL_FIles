
CREATE DATABASE IMDB
USE IMDB

CREATE TABLE Movies
(
Id int primary key identity,
Name nvarchar(50) NOT NULL,
IMDBRating float CHECK(IMDBRating BETWEEN 0 AND 10)
)


CREATE TABLE Actors
(
Id int primary key identity,
Name nvarchar(50) NOT NULL
)

CREATE TABLE Directors
(
Id int primary key identity,
Name nvarchar(50) NOT NULL
)

CREATE TABLE Genres
(
Id int primary key identity,
Name nvarchar(50) NOT NULL
)

CREATE TABLE Actors_Movies
(
Id int primary key identity,
Movies_Id int references Movies(Id),
Actors_Id int references Actors(Id)
)

CREATE TABLE Movies_Directors
(
Id int primary key identity,
Movies_Id int references Movies(Id),
Directors_Id int references Directors(Id)
)

CREATE TABLE Movies_Genres
(
Id int primary key identity,
Movies_Id int references Movies(Id),
Genres_Id int references Genres(Id)
)


------1-------
SELECT * FROM Movies

SELECT m.Name 'MovieName',m.IMDBRating 'IMDBRating',g.Name'GenreName',d.Name'DirectorName',ac.Name'ActorsName' FROM  Movies m
JOIN Movies_Genres mg 
ON 
m.Id=mg.Movies_Id
JOIN Genres g
ON
g.Id=mg.Genres_Id
JOIN Actors_Movies acm
ON
acm.Movies_Id=m.Id
JOIN Actors ac
ON
acm.Actors_Id=ac.Id
JOIN Movies_Directors mv
ON
mv.Movies_Id=m.Id
JOIN Directors d
ON
d.Id=mv.Directors_Id
WHERE m.IMDBRating>6

----2-----


SELECT m.Name 'MovieName',m.IMDBRating 'IMDBRating',g.Name'GenreName' FROM  Movies m
JOIN Movies_Genres mg
ON
mg.Movies_Id=m.Id
JOIN Genres g
ON
g.Id=mg.Genres_Id
WHERE g.Name LIKE '%a%'

----3------
SELECT m.Name 'MovieName',m.IMDBRating 'IMDBRating',g.Name'GenreName',m.Duration 'Duration' FROM  Movies m
JOIN Movies_Genres mg
ON
mg.Movies_Id=m.Id
JOIN Genres g
ON
g.Id=mg.Genres_Id
WHERE LEN(m.Name)>10

----4-----

SELECT m.Name 'MovieName',m.IMDBRating 'IMDBRating',g.Name'GenreName',m.Duration 'Duration',D.Name'Director Name' FROM  Movies m
JOIN Movies_Genres mg
ON
mg.Movies_Id=m.Id
JOIN Genres g
ON
g.Id=mg.Genres_Id
JOIN Movies_Directors mv
ON
mv.Movies_Id=m.Id
JOIN Directors d
ON
d.Id=mv.Directors_Id
WHERE m.IMDBRating> (SELECT AVG(IMDBRating) FROM Movies)
ORDER BY IMDBRating DESC





