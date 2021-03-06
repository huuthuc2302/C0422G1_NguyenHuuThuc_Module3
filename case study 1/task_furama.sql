use furama_data;

-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là 
-- một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự
 select * 
 from nhan_vien
 where ( ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%' ) and (char_length(ho_ten) <= 15)
 order by ho_ten;
 
 -- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi
 -- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
 
 select * 
 from khach_hang
 where ((timestampdiff(year,ngay_sinh,curdate()) >=18) and (timestampdiff(year,ngay_sinh,curdate()) <=50)) and  (dia_chi like "%Đà Nẵng" or dia_chi like "%Quảng Trị");
 
 -- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
 -- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
 -- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
 
 select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(*) as so_lan_dat_phong
from
    loai_khach
        join
    khach_hang on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
        join
    hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
where
    loai_khach.ten_loai_khach = 'Diamond'
group by hop_dong.ma_khach_hang
order by so_lan_dat_phong;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
--  (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select
    khach_hang.ma_khach_hang,
    khach_hang.ho_ten,
    loai_khach.ten_loai_khach,
    hop_dong.ma_hop_dong,
    dich_vu.ten_dich_vu,
    hop_dong.ngay_lam_hop_dong,
    hop_dong.ngay_ket_thuc,
    case
        when hop_dong_chi_tiet.so_luong is null then sum(dich_vu.chi_phi_thue)
        else sum(dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia)
    end as tong_tien
from
    loai_khach
        left join
    khach_hang on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
        left join
    hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
        left join
    dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        left join
    hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
        left join
    dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by case
    when hop_dong.ma_hop_dong is null then ho_ten
    else hop_dong.ma_hop_dong
end;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- -- -- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
from
    dich_vu dv
        join
    loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        join
    hop_dong hd on dv.ma_dich_vu = hd.ma_hop_dong
where
    dv.ma_dich_vu not in (select 
            hd.ma_dich_vu
        from
            hop_dong hd
        where
            (hd.ngay_lam_hop_dong between '2021-01-01' and '2021-03-31')
                or (hd.ngay_ket_thuc between '2021-01-01' and '2021-03-31'))

group by hd.ma_dich_vu;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của 
-- -- -- tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.so_nguoi_toi_da,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
from
    dich_vu dv
        join
    loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        join
    hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where
    dv.ma_dich_vu in (select 
            hd.ma_dich_vu
        from
            hop_dong hd
        where
            year(hd.ngay_lam_hop_dong) = '2020'
                or year(hd.ngay_ket_thuc) = '2020'
                and dv.ma_dich_vu not in (select 
                    hd.ma_dich_vu
                from
                    hop_dong hd
                where
                    year(hd.ngay_lam_hop_dong) = '2021'
                        or year(hd.ngay_ket_thuc) = '2021'))
group by dv.ma_dich_vu;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- -- -- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- Cách 1:
select
    ho_ten
from
    khach_hang
group by ho_ten;
-- Cách 2:
select distinct
    ho_ten
from
    khach_hang;
-- Cách 3:
select
    t.ho_ten
from
    (select
        ho_ten, count(ho_ten) as a
    from
        khach_hang
    group by ho_ten
    having a = 1) as t;
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select
    month(hd.ngay_lam_hop_dong) as `#thang`,
    count(month(hd.ngay_lam_hop_dong)) as so_luong_khach_hang
from
    hop_dong hd
where
    year(hd.ngay_lam_hop_dong) = '2021'
group by `#thang`
order by `#thang`;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- -- -- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from
    hop_dong hd
        left join
    hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng 
-- -- -- bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select 
    dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from
    hop_dong hd
        join
    hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
        join
    dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        join
    khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
        join
    loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where
    lk.ten_loai_khach = 'Diamond'
        and (kh.dia_chi like '% Vinh'
        or kh.dia_chi like '% Quảng Ngãi');

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
-- -- --  so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở hop_dong_chi_tiet), tien_dat_coc của tất cả các dịch vụ
-- -- --  đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select 
    hd.ma_hop_dong,
    nv.ho_ten as ho_ten_nhan_vien,
    kh.ho_ten as ho_ten_khach_hang,
    kh.so_dien_thoai as sdt_khach_hang,
    hd.ma_dich_vu,
    hd.tien_dat_coc,
    hd.ngay_lam_hop_dong,
    ifnull(sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem
from
    khach_hang kh
         left join
    hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
         left join
    nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
        left  join
    dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
        left  join
    hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
where
    (month(hd.ngay_lam_hop_dong) in (10 , 11, 12))
        and hd.ma_hop_dong not in (select 
            hd.ma_hop_dong
        from
            hop_dong hd
        where
            (date(hd.ngay_lam_hop_dong) between '2021 - 01 - 01' and '2021 - 06 - 30'))
            group by ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- -- -- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select 
    dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    sum(hdct.so_luong) as so_lan_su_dung
from
    hop_dong_chi_tiet hdct 
        join
    dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having so_lan_su_dung = (select
        max(`table`.so_lan)
    from
        (select
            sum(so_luong) as so_lan
        from
            hop_dong_chi_tiet
        group by ma_dich_vu_di_kem) as `table`);
    
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- -- -- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select 
    hd.ma_hop_dong,
    ldv.ten_loai_dich_vu,
    dvdk.ten_dich_vu_di_kem,
    count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from
    hop_dong hd
        join
    dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
        join
    loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        join
    hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
        join
    dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem) = 1
order by hd.ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten,
-- -- --  ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select 
    nv.ma_nhan_vien,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi
from
    nhan_vien nv
        join
    trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
        join
    bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
        join
    hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where
    year(hd.ngay_lam_hop_dong) between '2020' and '2021'
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) <= 3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

set sql_safe_updates = 0;
delete from nhan_vien 
where
    ma_nhan_vien not in (select 
        ma_nhan_vien
    from
        hop_dong
    
    where
        year(ngay_lam_hop_dong) between 2019 and 2021);
set sql_safe_updates = 1;

-- 17.	Cập nhật thông tin những khách hàng có ma_loai_khach từ Platinum lên Diamond, 
-- -- -- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

update khach_hang 
set 
    ma_loai_khach = 1
where
    ma_khach_hang in (select 
            ma_khach_hang
        from
            (select 
                kh.ma_khach_hang,
				kh.ho_ten,
				sum(dv.chi_phi_thue + ifnull(hdct.so_luong * dvdk.gia, 0)) as tong_tien
            from
                khach_hang kh
            left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
            left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
            left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
            left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
            where
                kh.ma_loai_khach = 2
            group by hd.ma_hop_dong
            having tong_tien > 1000000) as temp);

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

set sql_safe_updates = 0;
set foreign_key_checks = 0;
delete from khach_hang 
where
    ma_khach_hang in (select 
        ma_khach_hang
    from
        hop_dong hd
    
    where
        year(ngay_lam_hop_dong) < 2021);
	
    set sql_safe_updates = 1;
    set foreign_key_checks = 1;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

set sql_safe_updates = 0;
set foreign_key_checks = 0;
update dich_vu_di_kem 
set 
    gia = gia * 2
where
    ma_dich_vu_di_kem in (select 
            ma_dich_vu_di_kem
        from
            (select 
                hdct.ma_dich_vu_di_kem, sum(hdct.so_luong) as so_lan_su_dung
            from
                hop_dong_chi_tiet hdct
            join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
            where
                year(hd.ngay_lam_hop_dong) = 2020
            group by ma_dich_vu_di_kem
            having so_lan_su_dung > 10) as temp);
set sql_safe_updates = 1;
set foreign_key_checks = 1;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- -- -- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select 
    ma_nhan_vien as id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
from
    nhan_vien 
union select 
    ma_khach_hang as id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
from
    khach_hang; 
