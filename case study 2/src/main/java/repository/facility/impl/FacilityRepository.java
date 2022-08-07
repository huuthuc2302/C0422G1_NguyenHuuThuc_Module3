package repository.facility.impl;

import model.facility.Facility;
import repository.BaseRepository;
import repository.facility.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {

    private final String SELECT_ALL_FACILITY = "SELECT * FROM service;";
    private final String INSERT_NEW_VILLA = "insert into service (ten_dich_vu," +
            " dien_tich," +
            " chi_phi_thue," +
            " so_nguoi_toi_da," +
            " ma_kieu_thue," +
            " ma_loai_dich_vu," +
            " tieu_chuan_phong," +
            " mo_ta_tien_nghi_khac," +
            " dien_tich_ho_boi," +
            " so_tang)" +
            "values (?,?,?,?,?,?,?,?,?,?);";


    @Override
    public List<Facility> selectAllFacility() {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_FACILITY);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int serviceId = resultSet.getInt("ma_dich_vu");
                String serviceName = resultSet.getString("ten_dich_vu");
                int serviceArea = resultSet.getInt("dien_tich");
                double serviceCost = resultSet.getDouble("chi_phi_thue");
                int serviceMaxPeople = resultSet.getInt("so_nguoi_toi_da");
                int rentTypeId = resultSet.getInt("ma_kieu_thue");
                int serviceTypeId = resultSet.getInt("ma_loai_dich_vu");
                String standardRoom = resultSet.getString("tieu_chuan_phong");
                String description = resultSet.getString("mo_ta_tien_nghi_khac");
                double poolArea = resultSet.getDouble("dien_tich_ho_boi");
                int numberOfFloor = resultSet.getInt("so_tang");
                Facility facility = new Facility(serviceId,
                        serviceName,
                        serviceArea,
                        serviceCost,
                        serviceMaxPeople,
                        rentTypeId,
                        serviceTypeId,
                        standardRoom,
                        description,
                        poolArea,
                        numberOfFloor);
                facilityList.add(facility);
            }
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public Facility selectEmployee(int id) {
        return null;
    }

    @Override
    public void insertFacility(Facility facility) {
        System.out.println(INSERT_NEW_VILLA);
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_NEW_VILLA);
            ps.setString(1,facility.getFacilityName());
            ps.setInt(2,facility.getFacilityArea());
            ps.setDouble(3,facility.getFacilityCost());
            ps.setInt(4,facility.getFacilityMaxPeople());
            ps.setInt(5,facility.getRentTypeId());
            ps.setInt(6,facility.getFacilityTypeId());
            ps.setString(7,facility.getStandardRoom());
            ps.setString(8,facility.getDescription());
            ps.setDouble(9,facility.getPoolArea());
            ps.setInt(10,facility.getNumberOfFloor());
            ps.executeUpdate();
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
    }

    @Override
    public boolean updateFacility(Facility facility) {
        return false;
    }

    @Override
    public boolean deleteFacility(int id) {
        return false;
    }

    @Override
    public List<Facility> searchFacility(String keyword) {
        return null;
    }
}
