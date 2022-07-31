package repository;

import model.Products;

import java.util.List;

public interface IProductRepository {
    List<Products> findAll();
    void create(Products product);
    void update(int id, Products product);
    void delete(int id);
    List<Products> findByName(String name);
    Products findById(int id);

}


//        findAll(): Trả về danh sách tất cả sản phẩm
//        creat(): Lưu một sản phẩm
//        update(): Cập nhật thông tin của một sản phẩm
//        delete(): Xoá một sản phẩm khỏi danh sách
//        findByName(): Tìm một sản phẩm theo Name
//        findById(): Tìm theo ID