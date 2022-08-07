drop database if exists demo;

create database demo;

use demo;

create table users (
    id int(3) not null auto_increment,
    name varchar(120) not null,
    email varchar(220) not null,
    country varchar(120),
    primary key (id)
);


create table Permision (
    id int(11) primary key,
    name varchar(50)
);

 
create table User_Permision (
    permision_id int(11),
    user_id int(11)
);



insert into users(name, email, country) values('Minh','minh@codegym.vn','Việt Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
insert into users(name, email, country) values('Cao Tuấn','caotuan94@gmail.com','Việt Nam');
insert into users(name, email, country) values('Như Vinh','nhuvinhvo@gmail.com','Việt Nam');
insert into users(name, email, country) values('Maria','maria8x@gmail.com','Nhật Bản');
insert into users(name, email, country) values('Mikami','yua98@gmail.com','Nhật Bản');
insert into users(name, email, country) values('Hana Quỳnh','hana96@gmail.com','Mỹ');
insert into users(name, email, country) values('Jony Đặng','jony7x@gmail.com','Mỹ');
insert into users(name, email, country) values('Hữu Thức','thucthuc2302@gmail.com','Pháp');


insert into Permision(id, name) values(1, 'add');

insert into Permision(id, name) values(2, 'edit');

insert into Permision(id, name) values(3, 'delete');

insert into Permision(id, name) values(4, 'view');



DELIMITER $$

create procedure insert_user(
in user_name varchar(50),
in user_email varchar(50),
in user_country varchar(50)
)
begin
    insert into users(name, email, country) values(user_name, user_email, user_country);
    end$$
    
DELIMITER ;



DELIMITER $$

create procedure select_all_user()
begin
    select *
    from users;
    end$$
    
DELIMITER ;



DELIMITER $$

create procedure select_user(in user_id int)
    begin
    select users.name, users.email, users.country
    from users
    where users.id = user_id;
end$$

DELIMITER ;



DELIMITER $$

create procedure delete_user(in user_id int)
begin
    delete from users
    where users.id = user_id;
    end$$
    
DELIMITER ;



DELIMITER $$

create procedure update_user(
    in user_id int,
    in user_name varchar(50),
    in user_email varchar(50),
    in user_country varchar(50)
)
begin
    update users
    set users.name = user_name, users.email = user_email, users.country = user_country
    where users.id = user_id;
    end$$
    
DELIMITER ;



DELIMITER $$

create procedure find_country(in user_country varchar(50))
begin
    select *
    from users
    where country like user_country;
    end$$
    
DELIMITER ;



DELIMITER $$

create procedure sort_by_name()
begin
    select *
    from users
    order by name;
    end$$
    
DELIMITER ;









DELIMITER $$

create procedure get_user_by_id(in user_id int)
begin
	select users.name, users.email, users.country
    from users
    where users.id = user_id;
    end$$
    
DELIMITER ;