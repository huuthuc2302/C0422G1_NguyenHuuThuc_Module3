drop database if exists thao_tac_ban_hang_ss3;

create database thao_tac_ban_hang_ss3;

use thao_tac_ban_hang_ss3;

create table khach_hang(
	cID int primary key,
    cName varchar(25),
    cAge tinyint
);

insert into khach_hang
values ('1', 'Minh Quan', '10'),
	   ('2', 'Ngoc Oanh', '20'),
	   ('3', 'Hong Ha', '50');

create table dat_hang(
	oID int primary key,
    cID int,
    oDate datetime,
    oTotalPrice int,
    foreign key (cID) 
		references khach_hang(cID)
);

insert into dat_hang(oID,cID,oDate)
values   ('1', '1', '2006/03/21'),
		 ('2', '2', '2006/03/23'),
		 ('3', '1', '2006/03/13');

create table san_pham(
	pID int primary key,
    pName varchar(25),
    pPrice int
);

insert into san_pham
values  ('1', 'May Giat', '3'),
		('2', 'Tu Lanh', '5'),
		('3', 'Dieu Hoa', '7'),
		('4', 'Quat', '1'),
		('5', 'Bep Dien', '2');

create table chi_tiet_dat(
	oID int,
    pID int,
    odQTY int,
    primary key (oID, pID),
    foreign key (oID)
		references dat_hang(oID),
    foreign key (pID) 
		references san_pham(pID)
);

insert into chi_tiet_dat
values  ('1', '1', '3'),
		('1', '3', '7'),
		('1', '4', '2'),
		('2', '1', '1'),
		('3', '1', '8'),
		('2', '5', '4'),
		('2', '3', '3');
        
-- Hiển thị thông tin gồm oID, oDate, oPrice của tất cả các đơn vị hóa trong bảng Order

select oID, oDate, oTotalPrice
from dat_hang;

-- Hiển thị danh sách khách hàng đang mua hàng và danh sách sản phẩm được khách hàng mua

select kh.cID, cName, pName
from khach_hang kh
join dat_hang dh 	  on kh.cID = dh.cID
join chi_tiet_dat ctd on dh.oID = ctd.oID
join san_pham sp 	  on ctd.pID = sp.pID;

-- Hiển thị tên của những người không mua bất kỳ sản phẩm
select kh.cID, cName
from khach_hang kh
left join dat_hang dh on kh.cID = dh.cID
where dh.oID is null;

-- Hiển thị đơn vị mã hóa, ngày bán và giá tiền của từng đơn vị hóa đơn 
-- (giá một đơn vị hóa đơn được tính bằng tổng giá bán của từng loại hàng hóa xuất hiện trong đơn vị hóa đơn. 
-- Giá bán từng loại được tính = odQTY * pPrice)

select dh.oID, oDate, sum(odQTY * pPrice) as total
from dat_hang dh
join chi_tiet_dat ctd on dh.oID = ctd.oID
join san_pham sp 	  on ctd.pID = sp.pID
group by oID;
