package repository.facility.impl;

import model.facility.RentType;
import repository.BaseRepository;
import repository.facility.IRentTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RentTypeRepository implements IRentTypeRepository {
    private final String SELECT_RENT_TYPE = "select * from `rent_type`;";
    @Override
    public List<RentType> selectAll() {
        List<RentType> rentTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_RENT_TYPE);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int rentTypeId = resultSet.getInt("ma_kieu_thue");
                String rentTypeName = resultSet.getString("ten_kieu_thue");
                RentType rentType = new RentType(rentTypeId, rentTypeName);
                rentTypeList.add(rentType);
            }
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return rentTypeList;
    }

    @Override
    public Map<Integer, String> selectRentType() {
        Map<Integer, String> map = new HashMap<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_RENT_TYPE);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int rentTypeId = resultSet.getInt("ma_kieu_thue");
                String rentTypeName = resultSet.getString("ten_kieu_thue");
                map.put(rentTypeId,rentTypeName);
            }
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return map;
    }
}
