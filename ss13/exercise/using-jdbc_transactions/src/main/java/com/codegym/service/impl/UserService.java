package com.codegym.service.impl;

import com.codegym.model.User;
import com.codegym.repository.IUserRepository;
import com.codegym.repository.impl.UserRepository;
import com.codegym.service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {

    private static IUserRepository userRepository = new UserRepository();

    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public List<User> findCountry(String country) throws SQLException {
        return userRepository.findCountry(country);
    }

    @Override
    public List<User> sortByName() throws SQLException {
        return userRepository.sortByName();
    }

    @Override
    public void addUserTransaction(User user, int[] permision) {
        userRepository.addUserTransaction(user,permision);
    }
}
