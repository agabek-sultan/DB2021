-- task 2

-- a. count the number of unique clients, compute average and total purchase amount of client orders by each date.

CREATE VIEW a AS SELECT date,count(distinct client_id), avg(amount), sum(amount) FROM sell GROUP BY date;

SELECT * FROM a;

DROP VIEW a;

-- b. find top 5 dates with the greatest total sell amount

CREATE VIEW b AS SELECT date, sum(amount) FROM sell GROUP BY date ORDER BY sum(amount) DESC LIMIT 5;

SELECT * FROM b;

DROP VIEW b;

-- c. count the number of sales, compute average and total amount of all sales of each dealer

CREATE VIEW c AS SELECT dealer.name, count(sell.id), avg(amount), sum(amount)
FROM (dealer INNER JOIN sell ON dealer.id = sell.dealer_id) GROUP BY dealer.name;

SELECT * FROM c;

DROP VIEW c;

-- d. compute how much all dealers earned from charge(total sell amount * charge) in each location

CREATE VIEW d AS SELECT location, sum(amount), sum(amount)*(dealer.charge)
FROM (dealer INNER JOIN sell ON dealer.id = sell.dealer_id) GROUP BY location, charge;

SELECT * FROM d;

DROP VIEW d;

-- e. compute number of sales, average and total amount of all sales dealers
-- made in each location

CREATE VIEW e AS SELECT location, count(sell.id), sum(amount), avg(amount)
FROM (dealer INNER JOIN sell ON dealer.id = sell.dealer_id) GROUP BY dealer.location;

SELECT * FROM e;

DROP VIEW e;

-- f. compute number of sales, average and total amount of expenses in each city clients made.

CREATE VIEW f AS SELECT city, count(sell.id), sum(amount), avg(amount)
FROM (client INNER JOIN sell ON client.id = sell.client_id) GROUP BY city;

SELECT * FROM f;

DROP VIEW f;

-- g. find cities where total expenses more than total amount of sales in locations

CREATE VIEW g AS SELECT *
FROM (SELECT city, sum(amount) AS city_expenses FROM client INNER JOIN sell ON client.id = sell.client_id GROUP BY city) P
INNER JOIN
     (SELECT location, sum(amount) AS location_sales FROM dealer INNER JOIN sell ON dealer.id = sell.dealer_id GROUP BY location) O
ON city_expenses > location_sales AND P.city = O.location;

SELECT * FROM g;

DROP VIEW g;