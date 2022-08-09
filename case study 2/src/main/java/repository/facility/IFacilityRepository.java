package repository.facility;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;

import java.util.List;

public interface IFacilityRepository {

    public List<Facility> selectAllFacility();

    public void insertFacility(Facility facility);

    public void updateFacility(Facility facility);

    public void deleteFacility(int id);

    Facility findByIdFacility(int id);

    List<RentType> showRentFacility();

    List<FacilityType> showFacilityType();

}
