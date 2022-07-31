package repository.impl;

import model.Products;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {

    private static List<Products> productsList = new ArrayList<>();

    static {
        productsList.add(new Products(1, "iPhone 13 Pro Max", 27000000, "Mới chính hãng", "Apple"));
        productsList.add(new Products(2, "Xiaomi Mi Mix 3", 18000000, "Mới nhập khẩu", "Xiaomi"));
        productsList.add(new Products(3, "Samsung Note 22 Ultra", 20000000, "Mới chính hãng", "Samsung"));
        productsList.add(new Products(4, "iPhone 12 Mini", 15000000, "Mới chính hãng", "Apple"));
        productsList.add(new Products(5, "Xiaomi Mi 11 Pro", 18000000, "Mới nhập khẩu", "Xiaomi"));
        productsList.add(new Products(6, "Samsung Note 20", 14000000, "Qua sử dụng", "Samsung"));
    }

    @Override
    public List<Products> findAll() {
        return productsList;
    }

    @Override
    public void create(Products product) {
        productsList.add(product);
    }

    @Override
    public void update(int id, Products product) {
        for (int i = 0; i < productsList.size(); i++) {
            if(productsList.get(i).getId()==id) {
                productsList.set(i, product);
            }
        }

    }

    @Override
    public void delete(int id) {
        for (int i = 0; i < productsList.size(); i++) {
            if(productsList.get(i).getId()==id) {
                productsList.remove(i);
            }
        }
    }

    @Override
    public List<Products> findByName(String name) {
        List<Products> productList1 = new ArrayList<>();
        for (Products p : productsList) {
            if (p.getName().toLowerCase().contains(name.toLowerCase())) {
                productList1.add(p);
            }
        }
        return productList1;
    }

    @Override
    public Products findById(int id) {
        Products product = null;
        for (Products p:productsList) {
            if (p.getId() == id) {
                product = p;
                break;
            }
        }
        return product;
    }
}
