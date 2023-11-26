create database lerning_Mysql;

use lerning_Mysql;

create table bus(
    bus_id int auto_increment unique primary key,
    bus_number nvarchar(256) not null unique,
    model nvarchar(256) not null,
    date_creation date not null,
    capacity bigint,
    exploited bool not null
);

create table route(
    route_id int auto_increment unique primary key,
    route_number nvarchar(128) not null unique,
    rote_create date not null,
    createdBy nvarchar(256) not null,
    exploited bool not null
);

create table driver(
    driver_id int auto_increment unique primary key,
    first_name nvarchar(256) not null,
    last_name nvarchar(256) not null,
    father_name nvarchar(256) not null,
    birth_day date not null,
    driver_license nvarchar(512) not null,
    date_of_employment timestamp default current_timestamp,
    working bool not null
);

create table conductor(
    conductor_id int auto_increment unique primary key,
    first_name nvarchar(256) not null,
    last_name nvarchar(256) not null,
    father_name nvarchar(256) not null,
    birth_day date not null,
    date_of_employment timestamp default current_timestamp,
    working bool not null
);

create table route_schedule (
    id int auto_increment unique primary key,
    route_id int not null ,
    bus_id int not null,
    driver_id int not null,
    conductor_id int not null,
    start timestamp default current_timestamp,
    foreign key (route_id) references route(route_id),
    foreign key (bus_id) references  bus(bus_id),
    foreign key (driver_id) references driver(driver_id),
    foreign key (conductor_id) references conductor(conductor_id)
);