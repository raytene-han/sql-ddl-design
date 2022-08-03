CREATE TABLE stars (
    star TEXT PRIMARY KEY,
    temp_in_K INT NOT NULL);

INSERT INTO stars(star, temp_in_K)
    VALUES('The Sun',5800),
    ('Proxima Centauri', 3042),
    ('Gliese 876', 3192);

CREATE TABLE planets (
    planet TEXT PRIMARY KEY,
    orbital_period_yrs FLOAT NOT NULL,
    star TEXT NOT NULL REFERENCES stars);

INSERT INTO planets(planet, orbital_period_yrs, star)
    VALUES ('Earth', 1.00, 'The Sun'),
    ('Mars',1.882, 'The Sun'),
    ('Venus', 0.62, 'The Sun'),
    ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
    ('Gliese 876 b', 0.236, 'Gliese 876');

CREATE TABLE moons (
    moon TEXT PRIMARY KEY,
    planet TEXT NOT NULL REFERENCES planets);

INSERT INTO moons (moon, planet)
    VALUES ('The Moon', 'Earth'),
    ('Phobos', 'Mars'),
    ('Deimos', 'Mars')

SELECT planets.planet, planets.orbits_around AS star, count(moons.*)
    FROM stars
    LEFT OUTER JOIN planets ON planets.orbits_around = stars.star
    LEFT OUTER JOIN moons ON moons.planet = planets.planet
    GROUP BY planets.planet
    ORDER BY planets.planet;
