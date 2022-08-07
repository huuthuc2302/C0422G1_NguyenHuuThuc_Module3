package service.facility.impl;

import model.facility.Facility;
import repository.facility.IFacilityRepository;
import repository.facility.impl.FacilityRepository;
import service.facility.IFacilityService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FacilityService implements IFacilityService {

    private IFacilityRepository facilityRepository = new FacilityRepository();

    @Override
    public List<Facility> selectAllFacility() {
        return facilityRepository.selectAllFacility();
    }

    @Override
    public Facility selectFacility(int id) {
        return null;
    }

    @Override
    public Map<String, String> save(Facility facility) {
        Map<String, String> map = new HashMap<>();
        facilityRepository.insertFacility(facility);
        return map;
    }

    @Override
    public Map<String, String> updateFacility(Facility facility) {
        return null;
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
