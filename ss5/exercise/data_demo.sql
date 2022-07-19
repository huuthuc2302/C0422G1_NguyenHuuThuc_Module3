drop database if exists data_demo_ss5;

create database data_demo_ss5;

use data_demo_ss5;

create table products(
	Id int primary key,
	productCode int,
	productName varchar(20),
	productPrice varchar(20),
	productAmount int,
	productDescription varchar(20),
	productStatus varchar(20)
);

insert into products (Id , productCode, productName , productPrice , productAmount , productDescription , productStatus)
value ('1','147','Iphone 13 Pro Max','27000000','10','hàng chính hãng','new seal'),
	('2','258','Iphone 12 ','20000000','15','hàng chính hãng','used'),
	('3','369','Samsung Note 22','30000000','20','hàng chính hãng','new seal'),
	('4','789','Xiaomi Mi Mix 3','18000000','5','hàng nhập khẩu','used');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index i_productCode on products (productCode);
drop index i_productCode on products;

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create  index i_productNamePrice on products (productName, productPrice);
drop index i_productNamePrice on products;

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select productCode from products where productCode >3;

explain select productName, productPrice 
		from 
			products 
		where productPrice = 10 and  productName = 'Iphone 13 Pro Max' 
		group by productName;

-- So sánh câu truy vấn trước và sau khi tạo index

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view v_products as
    select 
        productCode, productName, productPrice, productStatus
    from
        products; 

set data_demo_updates =0;

-- Tiến hành sửa đổi view
update v_products 
set 
    productName = 'Note 22 Ultra'
where
    productCode = 3;
set data_demo_updates =1;


-- Tiến hành xoá view
drop view v_products;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter $$
create procedure productInfo ()
begin
	select * from products;
end $$
delimiter ;

-- Tạo store procedure thêm một sản phẩm mới
delimiter $$
create procedure add_new_product (in id int, `code` int, `name` varchar(20), price varchar(20), amount int,`description` varchar(20),`status` varchar(20))
begin
	insert into products 
		value(id,`code`,`name`,price, amount, `description`, `status`);
end $$
delimiter ;

call add_new_product('5','258','Xiaomi Mi 11 Pro','15000000','15','hàng nhập khẩu','đã active');

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter $$
create procedure update_product (in id int, `code` int, `name` varchar(20), price varchar(20), amount int,`description` varchar(20),`status` varchar(20))
begin
	set data_demo_updates = 0;
	update products 
		set productCode = `code`, 
			productName = `name`,
			productPrice = price,
            productAmount = amount,
            productDescription = `description`, 
            productStatus = `status`
	where Id = id;
    set data_demo_updates =1;
end $$
delimiter ;
call update_product('2','159','Iphone 12 Pro Max','23000000','25','hàng chính hãng','new seal');

-- Tạo store procedure xoá sản phẩm theo id
delimiter $$+
create procedure delete_product (in id int)
begin
	delete from products where product_id = id;
end $$
delimiter ;
call delete_product(5);
