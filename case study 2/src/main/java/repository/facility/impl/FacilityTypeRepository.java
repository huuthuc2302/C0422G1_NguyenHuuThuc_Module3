package repository.facility.impl;

import model.facility.FacilityType;
import repository.BaseRepository;
import repository.facility.IFacilityTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FacilityTypeRepository implements IFacilityTypeRepository {
    private final String SELECT_FACILITY_TYPE = "select * from `service_type`;";

    @Override
    public List<FacilityType> selectAll() {
        List<FacilityType> facilityTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_FACILITY_TYPE);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int facilityTypeId = resultSet.getInt("ma_loai_dich_vu");
                String facilityTypeName = resultSet.getString("ten_loai_dich_vu");
                FacilityType facilityType = new FacilityType(facilityTypeId,facilityTypeName);
                facilityTypeList.add(facilityType);
            }
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return facilityTypeList;
    }

    @Override
    public Map<Integer, String> selectServiceType() {
        Map<Integer, String> map = new HashMap<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_FACILITY_TYPE);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int serviceTypeId = resultSet.getInt("ma_loai_dich_vu");
                String serviceTypeName = resultSet.getString("ten_loai_dich_vu");
                map.put(serviceTypeId,serviceTypeName);
            }
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return map;
    }
}
