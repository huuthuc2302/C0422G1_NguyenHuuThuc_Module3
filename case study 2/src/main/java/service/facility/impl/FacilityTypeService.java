package service.facility.impl;

import model.facility.FacilityType;
import repository.facility.IFacilityTypeRepository;
import repository.facility.impl.FacilityTypeRepository;
import service.facility.IFacilityTypeService;

import java.util.List;
import java.util.Map;

public class FacilityTypeService implements IFacilityTypeService {
    private IFacilityTypeRepository facilityTypeRepository = new FacilityTypeRepository();
    @Override
    public List<FacilityType> selectAll() {
        return facilityTypeRepository.selectAll();
    }

    @Override
    public Map<Integer, String> selectFacilityType() {
        return facilityTypeRepository.selectServiceType();
    }
}
