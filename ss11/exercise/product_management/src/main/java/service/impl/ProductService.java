package service.impl;

import model.Products;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

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
    public List<Products> findByName(String name) {
        return productRepository.findByName(name);
    }

    @Override
    public Products findById(int id) {
        return productRepository.findById(id);
    }
}
