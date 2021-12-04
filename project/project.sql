create table customer(
    id integer PRIMARY KEY,
    name varchar(20) NOT NULL,
    street varchar(20) NOT NULL,
    city varchar(20) NOT NULL,
    country varchar(20) NOT NULL
);
create table deliv_company(
    id integer PRIMARY KEY,
    name varchar(30) NOT NULL
);
create table package(
    id integer PRIMARY KEY,
    name varchar(30) NOT NULL,
    type varchar(20) NOT NULL,
    price integer NOT NULL,
    amount integer NOT NULL DEFAULT 1
);
create table prices(
    type_of_package varchar(20) NOT NULL UNIQUE,
    cost integer NOT NULL
);
create table vehicle(
    name varchar(20) UNIQUE,
    price_of_del integer NOT NULL
);
create table bill(
    id integer PRIMARY KEY,
    total integer
);
create table del_order(
    id integer PRIMARY KEY,
    customer_id integer REFERENCES customer(id),
    deliv_comp_id integer REFERENCES deliv_company(id),
    package_id integer REFERENCES package(id),
    del_vehicle varchar(20) REFERENCES vehicle(name),
    bill_id integer REFERENCES bill(id)
);
create table payment(
    bill_id integer PRIMARY KEY REFERENCES bill(id),
    credit_card integer NOT NULL,
    date date NOT NULL
);
create table tracking_syst(
    track_id integer PRIMARY KEY REFERENCES del_order(id),
    start_loc varchar(20) NOT NULL,
    cur_loc varchar(20) NOT NULL,
    end_loc varchar(20) NOT NULL,
    vehicle varchar(20) NOT NULL,
    status varchar(20) NOT NULL
);
create table tracking_hist(
    hist_id integer REFERENCES tracking_syst(track_id),
    location varchar(20) NOT NULL,
    date date NOT NULL
);

--customer table
insert into customer(id,name,street,city,country) values(24,'Artem','Nitkalieva','Almaty','Kazakhstan');
insert into customer(id,name,street,city,country) values(21,'Azamat','Panfilova','Taraz','Kazakhstan');
insert into customer(id,name,street,city,country) values(80,'Amir','Nitkalieva','Prague','Czekh');
insert into customer(id,name,street,city,country) values(8,'Temirlan','ToleBi','Taraz','Kazakhstan');
insert into customer(id,name,street,city,country) values(15,'Oleg','Pushkina','Tomsk','Russia');
insert into customer(id,name,street,city,country) values(29,'Kirill','Gogolya','Voronezh','Russia');
insert into customer(id,name,street,city,country) values(13,'Sanzhar','Zhambyla','Taraz','Kazakhstan');
insert into customer(id,name,street,city,country) values(20,'Alina','Nazarbaeva','Astana','Kazakhstan');
insert into customer(id,name,street,city,country) values(7,'Togzhan','Lermontova','St.Petersburg','Russia');
insert into customer(id,name,street,city,country) values(58,'Egor','Bulvar','Los-Angeles','America');

--deliv_company table
insert into deliv_company(id,name) values(98,'Stol-shipping');
insert into deliv_company(id,name) values(5,'Back-carrying');
insert into deliv_company(id,name) values(23,'Hand-handling');
insert into deliv_company(id,name) values(3,'Air-giving');

--package table
insert into package(id,name,type,price,amount) values(67,'Clocks','small_pack',200,1);
insert into package(id,name,type,price,amount) values(12,'Ext_cable','small_pack',50,1);
insert into package(id,name,type,price,amount) values(2,'Headphones','express',549,1);
insert into package(id,name,type,price,amount) values(56,'Fridge','big_pack',45999,2);
insert into package(id,name,type,price,amount) values(100,'Mouse','small_pack',2499,3);
insert into package(id,name,type,price,amount) values(152,'Mirror','fragile',7633,7);
insert into package(id,name,type,price,amount) values(31,'ChristmasTree','express',32821,1);

--price table
insert into prices(type_of_package,cost) values('small_pack',500);
insert into prices(type_of_package,cost) values('fragile',2000);
insert into prices(type_of_package,cost) values('express',1500);
insert into prices(type_of_package,cost) values('big_pack',1500);

--vehicle table
insert into vehicle(name,price_of_del) values('Car1',5000);
insert into vehicle(name,price_of_del) values('Car2',7000);
insert into vehicle(name,price_of_del) values('Plane1',10000);
insert into vehicle(name,price_of_del) values('Plane2',13500);
insert into vehicle(name,price_of_del) values('Truck',8799);

--bill table
insert into bill(id,total) values(401,10848);
insert into bill(id,total) values(402,14050);
insert into bill(id,total) values(403,5700);
insert into bill(id,total) values(404,9499);
insert into bill(id,total) values(405,12997);
insert into bill(id,total) values(406,41321);
insert into bill(id,total) values(407,10550);
insert into bill(id,total) values(408,12049);
insert into bill(id,total) values(409,64230);
insert into bill(id,total) values(410,98498);

--del_order table
insert into del_order(id,customer_id,deliv_comp_id,package_id,del_vehicle,bill_id,order_date,deliv_date)
values(1,24,3,2,'Truck',401,'24-10-2000','05-11-2000');
insert into del_order(id,customer_id,deliv_comp_id,package_id,del_vehicle,bill_id,order_date,deliv_date)
values(2,21,5,12,'Plane2',402,'21-04-2003','25-04-2003');
insert into del_order(id,customer_id,deliv_comp_id,package_id,del_vehicle,bill_id,order_date,deliv_date)
values(3,80,23,67,'Car1',403,'08-12-2003','14-12-2003');
insert into del_order(id,customer_id,deliv_comp_id,package_id,del_vehicle,bill_id,order_date,deliv_date)
values(4,8,98,67,'Truck',404,'08-09-2020','11-09-2020');
insert into del_order(id,customer_id,deliv_comp_id,package_id,del_vehicle,bill_id,order_date,deliv_date)
values(5,15,98,100,'Car1',405,'15-06-2020','21-06-2020');
insert into del_order(id,customer_id,deliv_comp_id,package_id,del_vehicle,bill_id,order_date,deliv_date)
values(6,29,98,31,'Car2',406,'29-12-2021','06-01-2021');
insert into del_order(id,customer_id,deliv_comp_id,package_id,del_vehicle,bill_id,order_date,deliv_date)
values(7,13,23,12,'Plane1',407,'13-01-2019','26-01-2019');
insert into del_order(id,customer_id,deliv_comp_id,package_id,del_vehicle,bill_id,order_date,deliv_date)
values(8,20,5,2,'Plane1',408,'20-06-2020','30-06-2020');
insert into del_order(id,customer_id,deliv_comp_id,package_id,del_vehicle,bill_id,order_date,deliv_date)
values(9,7,5,152,'Truck',409,'07-05-2021','09-05-2021');
insert into del_order(id,customer_id,deliv_comp_id,package_id,del_vehicle,bill_id,order_date,deliv_date)
values(10,58,5,56,'Car1',410,'01-10-2019','10-10-2019');

--tracking_syst and tracking_hist tables
insert into tracking_syst(track_id,start_loc,cur_loc,end_loc,vehicle,status)
values(1,'China','Kazakhstan','Kazakhstan','Truck','Delivered');
insert into tracking_hist(hist_id,location,date) values(1,'China','24-10-2000');
insert into tracking_hist(hist_id,location,date) values(1,'German','26-10-2000');
insert into tracking_hist(hist_id,location,date) values(1,'Australia','28-10-2000');
insert into tracking_hist(hist_id,location,date) values(1,'Belgium','01-11-2000');
insert into tracking_hist(hist_id,location,date) values(1,'Kazakhstan','05-11-2000');

insert into tracking_syst(track_id,start_loc,cur_loc,end_loc,vehicle,status)
values(2,'China','Kazakhstan','Kazakhstan','Plane2','Delivered');
insert into tracking_hist(hist_id,location,date) values(2,'China','21-04-2003');
insert into tracking_hist(hist_id,location,date) values(2,'France','23-04-2003');
insert into tracking_hist(hist_id,location,date) values(2,'Kazakhstan','25-04-2003');

insert into tracking_syst(track_id,start_loc,cur_loc,end_loc,vehicle,status)
values(3,'London','Vietnam','Czekh','Car1','OnTheWay');
insert into tracking_hist(hist_id,location,date) values(3,'London','08-12-2003');
insert into tracking_hist(hist_id,location,date) values(3,'Vietnam','10-12-2003');

insert into tracking_syst(track_id,start_loc,cur_loc,end_loc,vehicle,status)
values(4,'Switzerland','Kazakhstan','Kazakhstan','Truck','Delivered');
insert into tracking_hist(hist_id,location,date) values(4,'Switzerland','08-09-2020');
insert into tracking_hist(hist_id,location,date) values(4,'Finland','09-09-2020');
insert into tracking_hist(hist_id,location,date) values(4,'Swedish','10-09-2020');
insert into tracking_hist(hist_id,location,date) values(4,'Kazakhstan','11-09-2020');

insert into tracking_syst(track_id,start_loc,cur_loc,end_loc,vehicle,status)
values(5,'Egypt','Russia','Russia','Car1','Delivered');
insert into tracking_hist(hist_id,location,date) values(5,'Egypt','15-06-2020');
insert into tracking_hist(hist_id,location,date) values(5,'Netherlands','20-06-2020');
insert into tracking_hist(hist_id,location,date) values(5,'Russia','21-06-2020');

insert into tracking_syst(track_id,start_loc,cur_loc,end_loc,vehicle,status)
values(6,'Mexico','Poland','Russia','Car2','OnTheWay');
insert into tracking_hist(hist_id,location,date) values(6,'Mexico','29-12-2021');
insert into tracking_hist(hist_id,location,date) values(6,'Poland','31-12-2021');

insert into tracking_syst(track_id,start_loc,cur_loc,end_loc,vehicle,status)
values(7,'Russia','Kazakhstan','Kazakhstan','Plane1','Delivered');
insert into tracking_hist(hist_id,location,date) values(7,'Russia','13-01-2019');
insert into tracking_hist(hist_id,location,date) values(7,'Kazakhstan','26-01-2019');

insert into tracking_syst(track_id,start_loc,cur_loc,end_loc,vehicle,status)
values(8,'Denmark','German','Kazakhstan','Plane1','OnTheWay');
insert into tracking_hist(hist_id,location,date) values(8,'Denmark','20-06-2020');
insert into tracking_hist(hist_id,location,date) values(8,'German','23-06-2020');

insert into tracking_syst(track_id,start_loc,cur_loc,end_loc,vehicle,status)
values(9,'Denmark','Russia','Russia','Truck','Delivered');
insert into tracking_hist(hist_id,location,date) values(9,'Denmark','07-05-2021');
insert into tracking_hist(hist_id,location,date) values(9,'Norwegian','08-05-2021');
insert into tracking_hist(hist_id,location,date) values(9,'Russia','09-05-2021');

insert into tracking_syst(track_id,start_loc,cur_loc,end_loc,vehicle,status)
values(10,'Russia','America','America','Car1','Delivered');
insert into tracking_hist(hist_id,location,date) values(10,'Russia','01-10-2019');
insert into tracking_hist(hist_id,location,date) values(10,'Belarus','05-10-2019');
insert into tracking_hist(hist_id,location,date) values(10,'Algeria','06-10-2019');
insert into tracking_hist(hist_id,location,date) values(10,'America','15-10-2019');

--payment table
insert into payment(bill_id,credit_card,date) values(401,123456,'24-10-2000');
insert into payment(bill_id,credit_card,date) values(402,789012,'21-04-2003');
insert into payment(bill_id,credit_card,date) values(403,937955,'08-12-2003');
insert into payment(bill_id,credit_card,date) values(404,294863,'08-09-2020');
insert into payment(bill_id,credit_card,date) values(405,917374,'15-06-2020');
insert into payment(bill_id,credit_card,date) values(406,538293,'29-12-2021');
insert into payment(bill_id,credit_card,date) values(407,914523,'13-01-2019');
insert into payment(bill_id,credit_card,date) values(408,103476,'20-06-2020');
insert into payment(bill_id,credit_card,date) values(409,293592,'07-05-2021');
insert into payment(bill_id,credit_card,date) values(410,435235,'01-10-2019');

--first queries

--Assume Car1 is destroyed in a crash. Find all customers who had a package on that
--truck at the time of the crash
select customer.id,customer.name
from customer inner join del_order on customer.id = del_order.customer_id
where del_order.id in (
    select track_id
    from tracking_syst
    where vehicle='Car1' and status='OnTheWay'
    );
--Find the last successful delivery by that truck prior to the crash
select track_id,start_loc,end_loc,vehicle
from tracking_syst
where vehicle='Car1' and status='Delivered';

--second query

--Find the customer who has shipped the most packages
select customer.name
from customer
where customer.id in (
    select customer_id
    from del_order inner join package on del_order.package_id = package.id
    where package.amount =(
        select max(amount)
        from package
    )
);

--third query
--Find the customer who has spent the most money on shipping in the past year
select customer.name
from customer
where customer.id in (
    select customer_id
    from del_order,bill
    where del_order.bill_id=bill.id and bill.total=(
        select max(bill.total)
        from bill
    ) and del_order.order_date in (
        select order_date
        from del_order
        where extract(year from order_date)=2019
    )
);

--fourth query

--Find the country with the most customers
select country,number
from (
    select country,count(country) as number
    from customer
    group by country
)sub
where number in(
    select max(count)
    from (
        select country,count(country)
        from customer
        group by country
    )sub
);

--fifth query

--Find those packages that were not delivered within the promised time.
select package.id,package.name
from package
where package.id in(
    select del_order.package_id
    from del_order,tracking_hist
    where del_order.id=tracking_hist.hist_id and del_order.deliv_date<tracking_hist.date
);

--sixth query

--Bill
select del_order.bill_id,package.amount*package.price as tot_pack_sum,vehicle.price_of_del as tot_veh_sum,
       prices.cost as tot_type_sum,bill.total as tot_sum
from del_order,package,vehicle,prices,bill
where del_order.package_id=package.id and del_order.del_vehicle=vehicle.name and package.type=prices.type_of_package
and bill.id=del_order.bill_id;