package service;

import model.Products;

import java.util.List;

public interface IProductService {
    List<Products> findAll();
    void create(Products product);
    void update(int id, Products product);
    void delete(int id);
    void view(Products product);
    List<Products> findByName(String name);
    Products findById(int id);
}
