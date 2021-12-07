/*TASK1*/
create table order_n (
    order_id int not null primary key,
    customer_id int,
    order_date varchar(50),
    order_place varchar(50)
);
alter table order_n alter column order_date set data type date
USING order_date::date;
create table Customer (
    customer_id int not null primary key,
    customer_name varchar(50),
    customer_contract varchar(50)
);

create table Customer_address(
    customer_id int,
    customer_address varchar(50),
    phone_number varchar(50)

);

create table Package
(
    type_name  varchar(50),
    weight     float,
    timeliness int,
    note       varchar(50),
    order_id   int,
    package_id int not null primary key
);

alter table package add column delivery_date date;

CREATE TABLE custom_house (
  order_id int,
  order_checking varchar(50),
  checking_stage varchar(50)
);

CREATE TABLE payment (
  payment_id int,
  payment_date varchar(50),
  payment_type  varchar(50),
  order_id  int,
  total varchar(50)
);
alter table payment add column customer_id int;
alter table payment alter column total set data type int
USING total::integer;

CREATE TABLE tracking (
  departure_place varchar(50),
  place_of_arrival varchar(50),
  currently_place varchar(50),
  vehicle_id int ,
  package_id int,
  foreign key (package_id) references Package (package_id)
);

CREATE TABLE International_shipment (
  order_id int,
  order_country varchar(50),
  order_date varchar(50),
  order_place varchar(255)
);



CREATE TABLE vehicle (
  vehicle_id int primary key ,
  vehicle_type varchar(50),
  currently_place varchar(50),
  type_of_vehicle varchar(255),
  vehicle_number varchar(50)
);

alter table vehicle drop column type_of_vehicle;

CREATE TABLE Contract (
  customer_id int,
  payment_type varchar(50) primary key

);
/*TASK3*/

alter table order_n
    add constraint fk_customer_id foreign key(customer_id) references Customer (customer_id);


alter table payment
    add constraint fk_customer_id foreign key(customer_id) references Customer (customer_id);

 alter table customer_address
   add constraint fk_customer_id foreign key (customer_id) references Customer (customer_id);

alter table package
    add constraint fk_order_id foreign key (order_id) references Order_n (order_id);

alter table custom_house
    add constraint fk_order_id foreign key (order_id) references Order_n (order_id);

alter table payment
    add constraint fk_order_id foreign key (order_id) references Order_n (order_id);

alter table payment
    add constraint fk_payment_type foreign key (payment_type) references Contract (payment_type);

alter table tracking
    add constraint fk_package_id foreign key (package_id) references Package (package_id);

alter table tracking
    add constraint fk_vehicle_id foreign key (vehicle_id) references vehicle (vehicle_id);

alter table International_shipment
    add constraint fk_order_id foreign key (order_id) references Order_n (order_id);

alter table Contract
    add constraint fk_customer_id foreign key (customer_id) references Customer (customer_id);


insert into order_n (order_id, customer_id, order_date, order_place) VALUES
(1,1,'21.02.2021','Pavlodar'),
(2,3,'14.11.2021','Almaty'),
(3,5,'26.07.2021','Nur-Sultan'),
(4,2,'14.05.2021','Karaganda'),
(5,11,'28.03.2021','Shymkent'),
(6,28,'11.06.2021','Kokshetau');

insert into order_n(order_id, customer_id, order_date, order_place) VALUES
(7,31,'15.02.2021','New_York'),
(8,32,'19.12.2021','Moscow'),
(9,33,'3.04.2021','Mexico'),
(10,34,'23.08.2021','Washington'),
(11,35,'9.03.2021','Buenos Airos'),
(12,36,'30.11.2021','Tokyo');

insert into Customer (customer_id, customer_name, customer_contract) VALUES
    (1,'Anelya Jakanov','No.1'),
    (2,'Aidar','No.2'),
    (3,'Mura','No.3'),
    (4,'Sula','No.4'),
    (5,'Alibek','No.5'),
    (11,'Rakhat','No.11'),
    (15,'Adil','No.15'),
    (28,'Aslan','No.28');

insert into Customer(customer_id, customer_name, customer_contract) VALUES
    (31,'Jake','No.31'),
    (32,'Anton','No.32'),
    (33,'Selena','No.33'),
    (34,'Josh','No.34'),
    (35,'Messi','No.35'),
    (36,'Hinata','No.36');

insert into Package(type_name, weight, timeliness, note, order_id, package_id) VALUES
    ('box',1.5,25,'Paperboard box',1,1),
    ('box',2.2,19,'Corrugated box',2,2),
    ('bag',3.4,14,'Poly bag',3,3),
    ('box',1.1,6,'Plastic box',4,4),
    ('bag',4.6,12,'Foil sealed bag',5,5),
    ('bag',7.1,36,'Poly bag',6,6);




update package set delivery_date='2021-02-21' where package_id=1;
update package set delivery_date='2021-11-14' where package_id=2;
update package set delivery_date='2021-07-27' where package_id=3;
update package set delivery_date='2021-05-16' where package_id=4;
update package set delivery_date='2021-03-28' where package_id=5;
update package set delivery_date='2021-06-21' where package_id=6;


alter table tracking add column day int;
insert into tracking (departure_place, place_of_arrival, currently_place, vehicle_id, package_id) VALUES
('Nur-Sultan','Pavlodar','Ekibastuz',1,1),
('Shymkent','Almaty','Almaty',2,2),
('Almaty','Nur-Sultan','Karagandy',3,3),
('Almaty','Karagandy','Balkhash',4,4),
('Kyzylorda','Shymkent','Kyzylorda',5,5),
('Nur-Sultan','Kokshetau','Nur-Sultan',6,6);

insert into tracking(day)values
(1),
(2),
(4),
(6),
(5),
(9);


insert into vehicle (vehicle_id, vehicle_type, currently_place, vehicle_number) VALUES
(1,'airplane','Ekibastuz','E455'),
(2,'train','Almaty','750I'),
(3,'car','Karagandy','111QR02'),
(4,'train','Balkhash','380T'),
(5,'airplane','Kyzylorda','A777'),
(6,'car','Nur-Sultan','777VIP02');

insert into Contract(customer_id, payment_type) VALUES
    (1,'Card1'),
    (2,'Card2'),
    (3,'Cash1'),
    (4,'Card3'),
    (5,'Cash2'),
    (11,'Cash3'),
    (15,'Card4'),
    (28,'Cash4');

insert into payment(payment_id, payment_date, payment_type, order_id, total,customer_id) VALUES
(1,'21.02.2021','Card1',1,'4500',1),
(2,'14.11.2021','Card2',2,'8700',2),
(3,'26.07.2021','Cash1',3,'5310',3),
(4,'14.05.2021','Card3',4,'2870',4),
(5,'28.03.2021','Cash2',5,'4800',5),
(6,'11.06.2021','Cash3',6,'14900',31);


insert into customer_address(customer_id, customer_address, phone_number) VALUES
    (1,'Rozybakieva 45,85','87771237815'),
    (2,'Abay 14,18','87784568193'),
    (3,'Bukhar-Zhyrau 51,6','87071897426'),
    (4,'Kabanbay Batyr 73, 98','87770267182'),
    (5,'Seifullin 15,96','87784527816'),
    (11,'Bogenbay Batyr 38,70','87718764974'),
    (15,'Turkistan 7,36','87061497534'),
    (28,'Turan 52,9','87775552278');

insert into International_shipment(order_id, order_place, order_date, order_country) VALUES
(7,'New-York','15.02.2021','USA'),
(8,'Moscow','19.12.2021','RUSSIA'),
(9,'Mexico','3.04.2021','Mexico'),
(10,'Washington','23.08.2021','USA'),
(11,'Buenos Airos','9.03.2021','Argentina'),
(12,'Tokyo','30.11.2021','Japan');

insert into custom_house(order_id, order_checking, checking_stage) VALUES
    (7,'USA','checked successfully'),
    (8,'Kazakhstan','in process'),
    (9,'Mexico','checked successfully'),
    (10,'USA, 98','checked successfully'),
    (11,'Kazakhstan','in process'),
    (12,'Kazakhstan','in process');


/*TASK4*/

/*2*/
SELECT
	customer_id,
	MAX (order_id)
FROM
	payment
GROUP BY
	customer_id;

/*3*/
SELECT
	customer_id,
	MAX (total) as maximum_spend
FROM
	payment
GROUP BY
	customer_id;

/*4*/
 create view street as select customer_address,
                              count(customer_address) as maxStr from customer_address group by customer_address;
select customer_address from street where MaxStr in (select max(maxStr) from street);


/*5*/
select
    customer_id,
      delivery_date - Order_n.order_date as days_of_late
from order_n
inner join package p on Order_n.order_id = p.order_id;

/*6*/
select Customer.customer_name,Customer.customer_id,Customer_address.Customer_address,
                Payment.total from Customer,Customer_address,payment
                order by (payment.customer_id - Customer_address.customer_id ,order_id-payment.order_id
                ,Customer.customer_id- Customer_address.customer_id);

/*1*/
create view crash as select package_id, currently_place, count(day) from tracking group by currently_place, package_id;
select customer.customer_id from customer, crash, order_n package c where c.order_id=crash.order_id and crash.count>0;
select order_id from order_n,crash,vehicle where Order_n.order_id=vehicle.vehicle_id and vehicle_id=6 and Order_n.order_date not between (order_id and crash.count>2);



