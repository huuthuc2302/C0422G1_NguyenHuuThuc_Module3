package service.customer.impl;

import model.customer.Customer;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;
import service.customer.ICustomerService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

public class CustomerService implements ICustomerService {

    private ICustomerRepository customerRepository = new CustomerRepository();

    public static final String REGEX_NAME = "^([A-Z][a-z]*)+(\\s[A-Z][a-z]*)*";

    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepository.selectAllCustomer();
    }

    @Override
    public Customer selectCustomer(int id) {
        return customerRepository.selectCustomer(id);
    }

//    @Override
//    public Map<String, String> insertCustomer(Customer customer) {
//        Map<String, String> map = new HashMap<>();
//        boolean flag = true;
//        if (!Pattern.matches(REGEX_NAME,customer.getCustomerName())){
//            flag = false;
//            map.put("name","Tên phải viết hoa chữ cái đầu");
//        }
//        if (flag){
//            customerRepository.insertCustomer(customer);
//        }
//        return map;
//    }
//
//    @Override
//    public Map<String, String> updateCustomer(Customer customer) {
//        return null;
//    }


    @Override
    public void insertCustomer(Customer customer){
        customerRepository.insertCustomer(customer);
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return customerRepository.updateCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public List<Customer> searchCustomer(String idSearch, String nameSearch) {
        return null;
    }
}
