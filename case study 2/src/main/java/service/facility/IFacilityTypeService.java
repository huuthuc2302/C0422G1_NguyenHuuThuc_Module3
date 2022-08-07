package service.facility;

import model.facility.FacilityType;

import java.util.List;
import java.util.Map;

public interface IFacilityTypeService {
    List<FacilityType> selectAll();

    public Map<Integer, String> selectFacilityType();
}
