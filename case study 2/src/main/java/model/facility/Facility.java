package model.facility;

public class Facility {
    private int facilityId;     //mã dịch vụ
    private String facilityName;    //tên dịch vụ
    private int facilityArea;   //diện tích
    private double facilityCost;    //chi phí thuê
    private int facilityMaxPeople;  //số người tối đa
    private int rentTypeId;     //mã kiểu thuê
    private int facilityTypeId;     //mã loại dịch vụ
    private String standardRoom;    //tiêu chuẩn phòng
    private String description;     //mô tả tiện nghi khác
    private double poolArea;    //diện tích hồ bơi
    private int numberOfFloor;  //số tầng

    public Facility(String facilityName, int facilityArea, double facilityCost, int facilityMaxPeople, int rentTypeId, int facilityTypeId, String standardRoom, String description, double poolArea, int numberOfFloor) {
    }

    public Facility(int facilityId, String facilityName, int facilityArea, double facilityCost,
                    int facilityMaxPeople, int rentTypeId, int facilityTypeId, String standardRoom,
                    String description, double poolArea, int numberOfFloor) {
        this.facilityId = facilityId;
        this.facilityName = facilityName;
        this.facilityArea = facilityArea;
        this.facilityCost = facilityCost;
        this.facilityMaxPeople = facilityMaxPeople;
        this.rentTypeId = rentTypeId;
        this.facilityTypeId = facilityTypeId;
        this.standardRoom = standardRoom;
        this.description = description;
        this.poolArea = poolArea;
        this.numberOfFloor = numberOfFloor;
    }

    public int getFacilityId() {
        return facilityId;
    }

    public void setFacilityId(int facilityId) {
        this.facilityId = facilityId;
    }

    public String getFacilityName() {
        return facilityName;
    }

    public void setFacilityName(String facilityName) {
        this.facilityName = facilityName;
    }

    public int getFacilityArea() {
        return facilityArea;
    }

    public void setFacilityArea(int facilityArea) {
        this.facilityArea = facilityArea;
    }

    public double getFacilityCost() {
        return facilityCost;
    }

    public void setFacilityCost(double facilityCost) {
        this.facilityCost = facilityCost;
    }

    public int getFacilityMaxPeople() {
        return facilityMaxPeople;
    }

    public void setFacilityMaxPeople(int facilityMaxPeople) {
        this.facilityMaxPeople = facilityMaxPeople;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public int getFacilityTypeId() {
        return facilityTypeId;
    }

    public void setFacilityTypeId(int facilityTypeId) {
        this.facilityTypeId = facilityTypeId;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getNumberOfFloor() {
        return numberOfFloor;
    }

    public void setNumberOfFloor(int numberOfFloor) {
        this.numberOfFloor = numberOfFloor;
    }
}










