package repository.facility.impl;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import repository.BaseRepository;
import repository.facility.IFacilityRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {

    private final String SELECT_ALL_FACILITY = "select * from dich_vu;";
    private final String CREATE_FACILITY = "insert into dich_vu (ten_dich_vu," +
            " dien_tich," +
            " chi_phi_thue," +
            " so_nguoi_toi_da," +
            " ma_kieu_thue," +
            " ma_loai_dich_vu," +
            " tieu_chuan_phong," +
            " mo_ta_tien_nghi_khac," +
            " dien_tich_ho_boi," +
            " so_tang," +
            "dich_vu_mien_phi_di_kem)"+
            "values (?,?,?,?,?,?,?,?,?,?,?);";

    private final String SELECT_RENTTYPE = "select * from kieu_thue ;";
    private final String SELECT_FACILITY_TYPE = "select * from loai_dich_vu;";
    private final String DELETE_FACILITY = "delete from dich_vu where ma_dich_vu = ?;";


    private final String UPDATE_FACILITY = "update dich_vu set ten_dich_vu = ?," +
            " dien_tich = ?," +
            " chi_phi_thue = ?," +
            " so_nguoi_toi_da = ?," +
            " ma_kieu_thue = ?," +
            " ma_loai_dich_vu = ?," +
            " tieu_chuan_phong = ?," +
            " mo_ta_tien_nghi_khac = ?," +
            " dien_tich_ho_boi = ?," +
            " so_tang = ?," +
            "dich_vu_mien_phi_di_kem = ?" +
            " where ma_dich_vu = ?;";
    private final String FIND_BY_ID_FACILITY = "select * from dich_vu where ma_dich_vu = ?;";


    @Override
    public List<Facility> selectAllFacility() {
        List<Facility> facilityList = new ArrayList<>();

        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_FACILITY);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int facilityId = resultSet.getInt("ma_dich_vu");
                String facilityName = resultSet.getString("ten_dich_vu");
                int facilityArea = resultSet.getInt("dien_tich");
                double facilityCost = resultSet.getDouble("chi_phi_thue");
                int facilityMaxPeople = resultSet.getInt("so_nguoi_toi_da");
                int rentTypeId = resultSet.getInt("ma_kieu_thue");
                int facilityTypeId = resultSet.getInt("ma_loai_dich_vu");
                String standardRoom = resultSet.getString("tieu_chuan_phong");
                String description = resultSet.getString("mo_ta_tien_nghi_khac");
                double poolArea = resultSet.getDouble("dien_tich_ho_boi");
                int numberOfFloor = resultSet.getInt("so_tang");
                String facilityFree = resultSet.getString("dich_vu_mien_phi_di_kem");
                facilityList.add(new Facility(facilityId,
                        facilityName,
                        facilityArea,
                        facilityCost,
                        facilityMaxPeople,
                        rentTypeId,
                        facilityTypeId,
                        standardRoom,
                        description,
                        poolArea,
                        numberOfFloor,
                        facilityFree));

            }
        }catch (SQLException exception){
            exception.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public void insertFacility(Facility facility) {

        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement ps = connection.prepareStatement(CREATE_FACILITY);
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
            ps.setString(11, facility.getFacilityFree());
            ps.executeUpdate();

        }catch (SQLException exception){
            exception.printStackTrace();
        }
    }

    @Override
    public void updateFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_FACILITY);
            ps.setString(1, facility.getFacilityName());
            ps.setInt(2, facility.getFacilityArea());
            ps.setDouble(3, facility.getFacilityCost());
            ps.setInt(4, facility.getFacilityMaxPeople());
            ps.setInt(5, facility.getRentTypeId());
            ps.setInt(6, facility.getFacilityTypeId());
            ps.setString(7, facility.getStandardRoom());
            ps.setString(8, facility.getDescription());
            ps.setDouble(9, facility.getPoolArea());
            ps.setInt(10, facility.getNumberOfFloor());
            ps.setString(11, facility.getFacilityFree());
            ps.setInt(12, facility.getFacilityId());
            ps.executeUpdate();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }

    @Override
    public void deleteFacility(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_FACILITY);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Facility findByIdFacility(int id) {
        Connection connection = BaseRepository.getConnectDB();
        Facility facility = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID_FACILITY);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int facilityId = resultSet.getInt("ma_dich_vu");
                String facilityName = resultSet.getString("ten_dich_vu");
                int facilityArea = resultSet.getInt("dien_tich");
                double facilityCost = resultSet.getDouble("chi_phi_thue");
                int facilityMaxPeople = resultSet.getInt("so_nguoi_toi_da");
                int rentTypeId = resultSet.getInt("ma_kieu_thue");
                int facilityTypeId = resultSet.getInt("ma_loai_dich_vu");
                String standardRoom = resultSet.getString("tieu_chuan_phong");
                String description = resultSet.getString("mo_ta_tien_nghi_khac");
                double poolArea = resultSet.getDouble("dien_tich_ho_boi");
                int numberOfFloor = resultSet.getInt("so_tang");
                String facilityFree = resultSet.getString("dich_vu_mien_phi_di_kem");
                facility = new Facility(facilityId,
                        facilityName,
                        facilityArea,
                        facilityCost,
                        facilityMaxPeople,
                        rentTypeId,
                        facilityTypeId,
                        standardRoom,
                        description,
                        poolArea,
                        numberOfFloor,
                        facilityFree);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facility;
    }

    @Override
    public List<RentType> showRentFacility() {
        List<RentType> rentTypeList = new ArrayList<>();

        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RENTTYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int rentTypeId = resultSet.getInt("ma_kieu_thue");
                String rentTypeName = resultSet.getString("ten_kieu_thue");
                rentTypeList.add(new RentType(rentTypeId, rentTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentTypeList;
    }

    @Override
    public List<FacilityType> showFacilityType() {
        List<FacilityType> facilityTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FACILITY_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int facilityTypeId = resultSet.getInt("ma_loai_dich_vu");
                String facilityTypeName = resultSet.getString("ten_loai_dich_vu");
                facilityTypeList.add(new FacilityType(facilityTypeId, facilityTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityTypeList;
    }
}
