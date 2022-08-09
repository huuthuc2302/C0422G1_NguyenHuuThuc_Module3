package service.facility;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;

import java.util.List;

public interface IFacilityService {

    public List<Facility> selectAllFacility();

    void insertFacility(Facility facility);

    void updateFacility(Facility facility);

    void deleteFacility(int id);

    Facility findByIdFacility(int id);

    List<RentType> showRentFacility();

    List<FacilityType> showFacilityType();

}
