CREATE DATABASE movies;

CREATE TABLE person (
  personid   INT NOT NULL AUTO_INCREMENT,
  personname VARCHAR(255),
  surname    VARCHAR(255),
  nation     VARCHAR(255),
  birthdate  INT,
  sex        VARCHAR(10),
  PRIMARY KEY (personid)
);

CREATE TABLE movie (
  movieid     INT NOT NULL AUTO_INCREMENT,
  rating      DECIMAL(2, 1),
  title       VARCHAR(255),
  releasedate INT,
  location    VARCHAR(255),
  PRIMARY KEY (movieid)
);

CREATE TABLE genre (
  genreid   INT NOT NULL AUTO_INCREMENT,
  genrename VARCHAR(255),
  PRIMARY KEY (genreid)
);

CREATE TABLE moviegenre (
  genreid INT NOT NULL,
  movieid INT NOT NULL,
  FOREIGN KEY (genreid) REFERENCES genre (genreid),
  FOREIGN KEY (movieid) REFERENCES movie (movieid)
);

CREATE TABLE writer (
  writerid INT NOT NULL,
  FOREIGN KEY (writerid) REFERENCES person (personid)
);

CREATE TABLE writes (
  writerid INT NOT NULL,
  movieid  INT NOT NULL,
  FOREIGN KEY (writerid) REFERENCES writer (writerid),
  FOREIGN KEY (movieid) REFERENCES movie (movieid)
);

CREATE TABLE director (
  directorid INT NOT NULL,
  FOREIGN KEY (directorid) REFERENCES person (personid)
);

CREATE TABLE directs (
  directorid INT NOT NULL,
  movieid  INT NOT NULL,
  FOREIGN KEY (directorid) REFERENCES director (directorid),
  FOREIGN KEY (movieid) REFERENCES movie (movieid)
);

CREATE TABLE actor (
  actorid INT NOT NULL,
  FOREIGN KEY (actorid) REFERENCES person (personid)
);

CREATE TABLE acts (
  actorid INT NOT NULL,
  movieid  INT NOT NULL,
  FOREIGN KEY (actorid) REFERENCES actor (actorid),
  FOREIGN KEY (movieid) REFERENCES movie (movieid)
);

CREATE TABLE award (
  awardid   INT NOT NULL AUTO_INCREMENT,
  awardname VARCHAR(255),
  PRIMARY KEY (awardid)
);

CREATE TABLE awardtoperson (
  awardid  INT NOT NULL,
  personid INT NOT NULL,
  FOREIGN KEY (awardid) REFERENCES award (awardid),
  FOREIGN KEY (personid) REFERENCES person (personid)
);

CREATE TABLE awardtomovie (
  awardid INT NOT NULL,
  movieid INT NOT NULL,
  FOREIGN KEY (awardid) REFERENCES award (awardid),
  FOREIGN KEY (movieid) REFERENCES movie (movieid)
);

INSERT INTO movie VALUES
  (1, 9.2, 'The Shawshank Redemption ', 1994, 'US'),
  (2, 9.2, 'The Godfather', 1972, 'US'),
  (3, 9.0, 'The Godfather: Part II', 1974, 'US'),
  (4, 8.9, 'The Dark Knight', 2008, 'US'),
  (5, 8.9, 'The Lord of the Rings: The Return of the King', 2003, 'US');

INSERT INTO genre VALUES
  (1,'Action'),
  (2,'Adventure'),
  (3,'Animation'),
  (4,'Biography'),
  (5,'Comedy'),
  (6,'Crime'),
  (7,'Drama'),
  (8,'Family'),
  (9,'Fantasy'),
  (10,'Film-Noir'),
  (11,'History'),
  (12,'Horror'),
  (13,'Music'),
  (14,'Musical'),
  (15,'Mystery'),
  (16,'Romance'),
  (17,'Sci-Fi'),
  (18,'Sport'),
  (19,'Thriller'),
  (20,'War'),
  (21,'Western');

INSERT INTO moviegenre VALUES
  (6, 1),
  (7, 1),
  (6, 2),
  (7, 2),
  (6, 3),
  (7, 3),
  (1, 4),
  (6, 4),
  (7, 4),
  (19, 4),
  (2, 5),
  (7, 5),
  (9, 5);

INSERT INTO person VALUES
  (1, 'Tim','Robbins', 'US', 1958, 'M'),
  (2, 'Morgan', 'Freeman' ,'US' ,1937 ,'M'),
  (3, 'Bob', 'Gunton', 'US', 1945 ,'M'),
  (4, 'Frank', 'Darabont' ,'France' , 1959 ,'M'),
  (5, 'Stephen', 'King', 'US', 1947 , 'M'),
  (6, 'Marlon', 'Brando', 'US', 1924 ,'M'),
  (7, 'Al', 'Pacino', 'US',1940, 'M'),
  (8, 'Francis Ford', 'Coppola' , 'US' , 1940 , 'M'),
  (10, 'Mario', 'Puzo' ,  'US', 1920, 'M'),
  (11, 'Robert' , 'Duvall', 'US' , 1931 ,'M'),
  (12, 'Diane', 'Keaton', 'US' , 1946, 'F'),
  (13, 'Christian','Bale', 'UK', 1974,'M'),
  (14, 'Health', 'Ledger', 'AU',1979 ,'M'),
  (15, 'Maggie', 'Gyllenhaal' , 'US',1977 ,'F'),
  (16, 'Christopher', 'Nolan', 'UK',1970 ,'M'),
  (17, 'Jonathan','Nolan' , 'UK',1976 ,'M'),
  (18, 'Peter', 'Jackson','NZ' ,1961 ,'M'),
  (19, 'J.R.R.', 'Tolkien' ,'UK' ,1973 ,'M'),
  (20, 'Elijah', 'Wood' ,'US' ,1981 ,'M'),
  (21, 'Orlando', 'Bloom', 'UK', 1977,'M'),
  (22, 'Viggo', 'Mortensen', 'US',1958 ,'M'),
  (23, 'Ian', 'McKellen','UK' ,1939 ,'M'),
  (24, 'Liv', 'Tyler', 'US', 1977,'F');

INSERT INTO actor VALUES
  (1),
  (2),
  (3),
  (5),
  (6),
  (7),
  (11),
  (12),
  (13),
  (14),
  (15),
  (20),
  (21),
  (22),
  (23),
  (24);

INSERT INTO acts VALUES
  (1,1),
  (2,1),
  (3,1),
  (6,2),
  (7,2),
  (7,3),
  (11,3),
  (12,3),
  (13,4),
  (14,4),
  (15,4),
  (20,5),
  (21,5),
  (22,5),
  (23,5),
  (24,5);

INSERT INTO director VALUES
  (4),
  (8),
  (16),
  (18);

INSERT INTO directs VALUES
  (4,1),
  (8,2),
  (8,3),
  (16,4),
  (18,5);

INSERT INTO writer VALUES
  (5),
  (9),
  (17),
  (19);

INSERT INTO writes VALUES
  (5,1),
  (9,2),
  (9,3),
  (17,4),
  (19,5);

INSERT INTO award VALUES
  (1,'Best Picture'),
  (2,'Best Director'),
  (3,'Best Actor in a Leading Role:'),
  (4,'Best Actor in a Supporting Role'),
  (5,'Best Cinematography'),
  (6,'Best Film Editing'),
  (7,'Best Visual Effects'),
  (8,'Best Writing'),
  (9,'Best Sound');

INSERT INTO awardtomovie VALUES
  (1,1),
  (5,1),
  (9,1),
  (1,2),
  (8,2);

INSERT INTO awardtoperson VALUES
  (3,1),
  (3,6);

