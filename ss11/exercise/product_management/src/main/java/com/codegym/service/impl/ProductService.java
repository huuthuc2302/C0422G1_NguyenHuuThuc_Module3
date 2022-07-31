package com.codegym.service.impl;

import com.codegym.model.Products;
import com.codegym.repository.IProductRepository;
import com.codegym.repository.impl.ProductRepository;
import com.codegym.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {

    private IProductRepository productRepository = new ProductRepository();


    @Override
    public List<Products> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void create(Products product) {
        productRepository.create(product);
    }

    @Override
    public void update(int id, Products product) {
        productRepository.update(id,product);

    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);

    }

    @Override
    public void view(Products product) {
        productRepository.view(product);

    }

    @Override
    public List<Products> findByName(String name) {
        return (List<Products>) productRepository.findByName(name);
    }

    @Override
    public Products findById(int id) {
        return productRepository.findById(id);
    }
}
