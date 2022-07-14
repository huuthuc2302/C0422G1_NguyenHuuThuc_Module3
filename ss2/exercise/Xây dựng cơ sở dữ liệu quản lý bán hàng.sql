drop database if exists quan_ly_ban_hang;

create database quan_ly_ban_hang;

use quan_ly_ban_hang;

create table khach_hang(
	cID int primary key,
    cName varchar(45),
    cAge int
);

create table dat_hang(
	oID int primary key,
    cID int,
    oDate date,
    oTotalPrice int,
    foreign key (cID) references khach_hang(cID)
);

create table san_pham(
	pID int primary key,
    pName varchar(45),
    pPrice int
);

create table chi_tiet_dat(
	oID int,
    pID int,
    odQTY int,
    primary key (oID, pID),
    foreign key (oID) references dat_hang(oID),
    foreign key (pID) references san_pham(pID)
);