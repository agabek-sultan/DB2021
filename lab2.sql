-- task 1

-- DDL is used to define data structure
-- DML manipulates data

-- a. at least 3 DDL commands;
-- CREATE table films ()
-- ALTER table films ADD column film_name varchar(50)
-- DROP table films;


-- b. at least 4 DML commands.
-- insert into films (id, film_name, director, date) values ('F_n1', 'Dune', 'Deni Villeneuve', '2021-10-22')
-- update films set date = '2021-09-21'
-- delete films where director = 'James Gunn'
-- select * from films

-- task 2

create table customer(
    id integer primary key,
    full_name varchar(50) not null,
    timestamp timestamp not null,
    delivery_address text not null
);

create table orders(
    code integer primary key,
    customer_id integer,
    total_sum double precision check (total_sum>0) not null,
    is_paid boolean not null,
    foreign key (customer_id) references customer
);

create table products(
    id varchar primary key,
    name varchar not null unique,
    description text,
    price double precision not null check (price>0)
);

create table order_items(
    order_code integer,
    product_id varchar,
    quantity integer not null check (quantity>0),
    primary key (order_code,product_id),
    foreign key (order_code) references orders,
    foreign key (product_id) references products
);

-- task 3

-- a) a students table storing data such as full name, age, birth date,
-- gender, average grade, information about yourself, the need for a dormitory, additional info.

create table students (
    student_id varchar primary key,
    full_name varchar(50) NOT NULL,
    age int NOT NULL,
    birth_date date NOT NULL,
    gender varchar NOT NULL check (gender = 'male' or gender = 'female'),
    average_grade double precision NOT NULL,
    info_about_yourself text,
    need_for_dorm boolean NOT NULL,
    add_info text
);



-- b) an instructors table storing data such as full name, speaking languages,
-- work experience, the possibility of having remote lessons.

create table instructors (
    instructor_id varchar primary key,
    full_name varchar(50) NOT NULL,
    speaking_lang text,
    work_xp int NOT NULL,
    remote_lessons boolean NOT NULL
);

-- c) a lesson participants table storing data such as lesson title, teaching
-- instructor, studying students, room number.

create table lesson (
    lesson_id varchar primary key,
    lesson_title varchar NOT NULL,
    l_instructor NOT NULL UNIQUE varchar references instructors(instructor_id),
    room_num int NOT NULL check (room_num > 0)
);

create table student_takes(
    student_id varchar NOT NULL references students(student_id),
    lesson_id varchar NOT NULL references lesson(lesson_id)
)

-- task 4

INSERT INTO customer(full_name, timestamp, delivery_address) values('Agabek Sultanbek','2021-09-21 14:30:00','Abay 77');
INSERT INTO orders values(1,1,1000,true);
INSERT INTO products values(1,'cola','with the coca cola company',600.00);
INSERT INTO order_items values(1,1,2);

UPDATE customer SET delivery_address='Tole bi 59' WHERE id=1;
UPDATE orders SET total_sum=1200 where customer_id=1;
UPDATE products SET price=650.00 where name='cola';
UPDATE order_items SET quantity=3 where order_code=1;

DELETE FROM order_items WHERE order_code=1;
DELETE FROM products WHERE name='cola';
DELETE FROM orders WHERE code=1;
DELETE FROM customer WHERE id=1;