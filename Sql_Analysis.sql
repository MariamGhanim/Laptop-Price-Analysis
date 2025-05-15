-- ALL Queries

USE laptop_data;
-- 1)  average laptop price by brand
SELECT Brand, FLOOR(AVG(`Price ($)`)) AS Avg_Price
FROM laptop_prices
GROUP BY Brand
ORDER BY Avg_Price DESC;
-- 2)avg price 
SELECT  FLOOR(AVG(`Price ($)`)) AS Avg_Price
FROM laptop_prices;

-- 3) The effect of the processor on the price
SELECT Processor, FLOOR(AVG(`Price ($)`)) AS Avg_Price
FROM laptop_prices
GROUP BY Processor
ORDER BY Avg_Price DESC;

-- 4) The relationship between RAM and price
SELECT `RAM (GB)`,FLOOR(AVG(`Price ($)`)) AS Avg_Price
FROM laptop_prices
GROUP BY `RAM (GB)`
ORDER BY `RAM (GB)`;



-- 5) Which companies offer laptops with longer battery life?
SELECT Brand, ROUND(AVG(`Battery Life (hours)`),2) AS Avg_Battery
FROM laptop_prices
GROUP BY Brand
ORDER BY Avg_Battery DESC;

-- 6) Do high resolution laptops reduce battery life?
SELECT Resolution, AVG(`Battery Life (hours)`) AS Avg_Battery
FROM laptop_prices
GROUP BY Resolution
ORDER BY Avg_Battery DESC;



-- 7) Least used OS and most used OS
SELECT 
    (SELECT `Operating System`
     FROM laptop_prices
     GROUP BY `Operating System`
     ORDER BY COUNT(*) ASC
     LIMIT 1) AS Least_Used_OS,

    (SELECT `Operating System`
     FROM laptop_prices
     GROUP BY `Operating System`
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS Most_Used_OS;




-- 8) Average prices by screen size 
SELECT `Screen Size (inch)`, FLOOR(AVG(`Price ($)`)) AS Avg_Price
FROM laptop_prices
GROUP BY `Screen Size (inch)`
ORDER BY Avg_Price DESC;

-- 9)What are the common screen sizes for high-priced laptops
SELECT `Screen Size (inch)`, COUNT(*) AS Count
FROM laptop_prices
WHERE `Price ($)` > (SELECT AVG(`Price ($)`) FROM laptop_prices)
GROUP BY `Screen Size (inch)`
ORDER BY Count DESC;

-- 10)What is the relationship between the storage size and the price of laptops across different screen sizes?
SELECT `Screen Size (inch)`, `Storage`, FLOOR(AVG(`Price ($)`)) AS Avg_Price
FROM laptop_prices
GROUP BY `Screen Size (inch)`, `Storage`
ORDER BY `Screen Size (inch)`, `Storage` ;


-- 11) Average prices by Storage
SELECT Storage, FLOOR(AVG(`Price ($)`)) AS Avg_Price
FROM laptop_prices
GROUP BY Storage
ORDER BY Avg_Price ASC;