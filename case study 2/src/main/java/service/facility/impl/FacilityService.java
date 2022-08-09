package service.facility.impl;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import repository.facility.IFacilityRepository;
import repository.facility.impl.FacilityRepository;
import service.facility.IFacilityService;

import java.util.List;


public class FacilityService implements IFacilityService {

    private IFacilityRepository facilityRepository = new FacilityRepository();

    @Override
    public List<Facility> selectAllFacility() {
        return facilityRepository.selectAllFacility();
    }

    @Override
    public void insertFacility(Facility facility) {
        facilityRepository.insertFacility(facility);
    }

    @Override
    public void updateFacility(Facility facility) {
        facilityRepository.updateFacility(facility);
    }

    @Override
    public void deleteFacility(int id) {
        facilityRepository.deleteFacility(id);
    }

    @Override
    public Facility findByIdFacility(int id) {
        return facilityRepository.findByIdFacility(id);
    }

    @Override
    public List<RentType> showRentFacility() {
        return facilityRepository.showRentFacility();
    }

    @Override
    public List<FacilityType> showFacilityType() {
        return facilityRepository.showFacilityType();
    }
}
