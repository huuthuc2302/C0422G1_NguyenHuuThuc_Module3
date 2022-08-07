package service.facility.impl;

import model.facility.RentType;
import repository.facility.IRentTypeRepository;
import repository.facility.impl.RentTypeRepository;
import service.facility.IRentTypeService;

import java.util.List;
import java.util.Map;

public class RentTypeService implements IRentTypeService {
    private IRentTypeRepository rentTypeRepository = new RentTypeRepository();

    @Override
    public List<RentType> selectAll() {
        return rentTypeRepository.selectAll();    }

    @Override
    public Map<Integer, String> selectRentType() {
        return rentTypeRepository.selectRentType();
    }
}
