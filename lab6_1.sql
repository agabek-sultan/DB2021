-- task1

-- a. combine each row of dealer table with each row of client table
-- объединить каждую строку таблицы дилера с каждой строкой таблицы client

SELECT * FROM dealer CROSS JOIN client;

-- b. find all dealers along with client name, city, grade, sell number, date, and amount
-- найти всех дилеров вместе с именем клиента, городом, классом, номером продажи, датой и суммой

SELECT dealer.name, client.name, client.city, client.priority, sell.id, sell.date, sell.amount
FROM (client FULL JOIN dealer on client.dealer_id = dealer.id) FULL JOIN sell on client.id = sell.client_id;


-- c. find the dealer and client who belongs to same city
-- найти дилера и клиента из одного города

SELECT dealer.name, client.name, city
FROM client INNER JOIN dealer ON client.city = dealer.location;


-- d. find sell id, amount, client name, city those sells where sell amount exists between
-- 100 and 500

 -- найти идентификатор продажи, сумму, имя клиента, город продаж, где сумма продажи находится в диапазоне от 100 до 500

SELECT sell.id, amount, client.name, city
FROM sell INNER JOIN client ON sell.client_id = client.id AND sell.amount >= 100 AND sell.amount <= 500;

-- e. find dealers who works either for one or more client or not yet join under any of
-- the clients
-- найти дилеров, которые работают на одного или нескольких клиентов или еще не присоединились ни к одному из клиентов

SELECT * FROM client RIGHT JOIN dealer on client.dealer_id = dealer.id;

-- f. find the dealers and the clients he service, return client name, city, dealer name,
-- commission.
-- найти дилеров и клиентов, которых он обслуживает, вернуть имя клиента, город, название дилера, комиссию.

SELECT client.name, client.city, dealer.name, dealer.charge
FROM dealer INNER JOIN client ON dealer.id = client.dealer_id;


-- g. find client name, client city, dealer, commission those dealers who received a
-- commission from the sell more than 12%
-- найти имя клиента, город клиента, дилера, комиссию тех дилеров, которые получили комиссию от продажи более 12%

SELECT client.name, city, dealer.name, charge
FROM client INNER JOIN dealer ON client.dealer_id = dealer.id AND charge > 0.12;

-- h. make a report with client name, city, sell id, sell date, sell amount, dealer name
-- and commission to find that either any of the existing clients haven’t made a
-- purchase(sell) or made one or more purchase(sell) by their dealer or by own.

-- составьте отчет с указанием имени клиента, города, идентификатора продажи, даты продажи, суммы продажи, имени дилера
-- и комиссии, чтобы обнаружить, что любой из существующих клиентов не совершил покупку (продажу)
-- или совершил одну или несколько покупок (продаж) своими у дилера или самостоятельно.

SELECT client.name, city, sell.id, date, amount, dealer.name,charge
FROM (client FULL JOIN sell on client.id = sell.client_id) FULL JOIN dealer on dealer.id = client.dealer_id;

-- i. find dealers who either work for one or more clients. The client may have made,
-- either one or more purchases, or purchase amount above 2000 and must have a
-- grade, or he may not have made any purchase to the associated dealer. Print
-- client name, client grade, dealer name, sell id, sell amount

-- найти дилеров, которые работают на одного или нескольких клиентов. Клиент мог сделать,
-- либо одна или несколько покупок, либо сумма покупки превышает 2000 и должна иметь
-- оценка, иначе он мог не покупать у ассоциированного дилера. Распечатать
-- имя клиента, рейтинг клиента, имя дилера, идентификатор продажи, сумма продажи

SELECT client.name, client.priority, dealer.name, sell.id, sell.amount
FROM (dealer LEFT JOIN client ON dealer.id = client.dealer_id) LEFT JOIN sell ON client.id = sell.client_id
WHERE sell.amount >= 2000 AND client.priority IS NOT NULL;
