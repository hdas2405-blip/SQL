use world;
select * from country;
#Question 1 : Count how many cities are there in each country?
SELECT CountryCode, COUNT(city_name) AS City_Count
FROM city
GROUP BY CountryCode;

#Question 2 : Display all continents having more than 30 countries?
SELECT Continent, COUNT(country_code) AS Country_Count
FROM country
GROUP BY Continent
HAVING COUNT(*) > 30;

#Question 3 : List regions whose total population exceeds 200 million?
select Region, sum(country_pop) as total_pop from country group by Region
having total_pop > 200000000;

#Question 4 : Find the top 5 continents by average GNP per country?
select Continent, avg(GNP) as AVG_GNP from country group by Continent limit 5;

#Question 5 : Find the total number of official languages spoken in each continent?
SELECT co.Continent, COUNT(cl.Language) AS Total_Official_Languages
FROM country co
JOIN countrylanguage cl ON country_Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY co.Continent;

#Question 6 : Find the maximum and minimum GNP for each continent?
SELECT Continent, 
       MAX(GNP) AS Maximum_GNP, 
       MIN(GNP) AS Minimum_GNP
FROM country
GROUP BY Continent;

#Question 7 : Find the country with the highest average city population?
SELECT co.Name, AVG(country_pop) AS Average_City_Population
FROM country co
JOIN city ci ON country_code = ci.CountryCode
GROUP BY co.Name
ORDER BY Average_City_Population DESC
LIMIT 1;

#Question 8 : List continents where the average city population is greater than 200,000?
SELECT co.Continent, AVG(country_pop) AS Average_City_Population
FROM country co
JOIN city ci ON country_code = ci.CountryCode
GROUP BY co.Continent
HAVING Average_City_Population > 200000;

#Question 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending?
select continent, sum(country_pop) as Total_pop, avg(Lifeexpectancy) as AVG_Lifeexpectancy
 from country 
group by continent order by AVG_Lifeexpectancy desc;

#Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million?
select continent, 
sum(country_pop) as Total_pop, 
avg(Lifeexpectancy) as avg_lifeexpectancy from country group by continent
having total_pop > 200000000 
order by avg_lifeexpectancy desc limit 3;

