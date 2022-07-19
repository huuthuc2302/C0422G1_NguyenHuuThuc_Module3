drop database if exists quan_ly_don_hang_ss2;

create database quan_ly_don_hang_ss2;

use quan_ly_don_hang_ss2;

create table phieu_xuat (
    ma_phieu_xuat int primary key auto_increment,
    ngay_xuat date not null
);

create table vat_tu (
    ma_vat_tu int primary key auto_increment,
    ten_vat_tu varchar(25) not null
);

create table chi_tiet_phieu_xuat (
    ma_phieu_xuat int,
    ma_vat_tu int,
    don_gia_xuat int not null,
    so_luong_xuat int not null,
    primary key (ma_phieu_xuat , ma_vat_tu),
    foreign key (ma_phieu_xuat) references phieu_xuat (ma_phieu_xuat),
    foreign key (ma_vat_tu) references vat_tu (ma_vat_tu)
);

create table phieu_nhap (
    ma_phieu_nhap int primary key auto_increment,
    ngay_nhap date not null
);

create table chi_tiet_phieu_nhap (
    ma_phieu_nhap int,
    ma_vat_tu int,
    primary key (ma_phieu_nhap , ma_vat_tu),
    foreign key (ma_phieu_nhap) references phieu_nhap (ma_phieu_nhap),
    foreign key (ma_vat_tu) references vat_tu (ma_vat_tu)
);

create table nha_cung_cap (
    ma_nha_cung_cap int primary key,
    ten_nha_cung_cap varchar(20) not null,
    dia_chi varchar(50) not null
);

create table so_dien_thoai (
    so_dien_thoai varchar(12) primary key,
    ma_nha_cung_cap int not null,
    foreign key (ma_nha_cung_cap) references nha_cung_cap (ma_nha_cung_cap)
);

create table don_dat_hang (
    ma_don_hang int primary key auto_increment,
    ngay_dat_hang date not null,
    ma_nha_cung_cap int not null,
    foreign key (ma_nha_cung_cap) references nha_cung_cap (ma_nha_cung_cap)
);

create table chi_tiet_don_dat_hang (
    ma_don_hang int,
    ma_vat_tu int,
    primary key (ma_don_hang , ma_vat_tu),
    foreign key (ma_don_hang) references don_dat_hang (ma_don_hang),
    foreign key (ma_vat_tu) references vat_tu (ma_vat_tu)
);