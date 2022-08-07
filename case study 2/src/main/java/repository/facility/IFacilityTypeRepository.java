package repository.facility;

import model.facility.Facility;
import model.facility.FacilityType;

import java.util.List;
import java.util.Map;

public interface IFacilityTypeRepository {
    List<FacilityType> selectAll();

    public Map<Integer, String> selectServiceType();
}
