USE world;

SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

-- 1
SELECT * FROM city WHERE CountryCode='IDN' ORDER BY Population DESC LIMIT 10;

-- 2
SELECT ID as id, Name as Nama_kota, District, Population
FROM city ORDER BY Population DESC LIMIT 10;

-- 3
SELECT CL.CountryCode as Code, C.Name, CL.Language, CL.IsOfficial, CL.Percentage
FROM countrylanguage as CL
JOIN country as C ON C.Code = CL.CountryCode
WHERE CL.Language ='English' AND IsOfficial = 'T' 
ORDER BY Percentage DESC LIMIT 10;

-- 4
SELECT Name, Continent, LifeExpectancy, GNP FROM country
WHERE Continent='Asia' AND LifeExpectancy > (SELECT AVG(LifeExpectancy) FROM country WHERE Continent='Europe')
ORDER BY LifeExpectancy DESC LIMIT 10;