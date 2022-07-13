drop database if exists bai_tap;

create database bai_tap;

use bai_tap;

create table class(
	id_class int primary key,
	`name_class` varchar(55)
);

create table teacher(
	id_teacher int,
	`name_teacher` varchar(50),
	age_teacher int,
	country_teacher varchar(50)
);

insert into class values(1,"CO422G1");
insert into class values(2,"CO522G1");

insert into teacher values(1,"THUC",26,"DA NAMG"),(2,"VINH",24,"QUANG NAM");

select id_class from class;
