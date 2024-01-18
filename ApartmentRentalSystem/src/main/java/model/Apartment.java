package model;

public class Apartment {
    private int id;
    private int floorNo;
    private int doorNo;
    private String advanceCost;
    private String rentalCost;
    private String bedroom;
    private String floorSpace;
    private String status;
    private String noticePeriod;
	
	
	
	public Apartment() {
		super();
	}
	public Apartment(int id, int floorNo, int doorNo, String advanceCost, String rentalCost, String bedroom,
			String floorSpace, String status, String noticePeriod) {
		super();
		this.id = id;
		this.floorNo = floorNo;
		this.doorNo = doorNo;
		this.advanceCost = advanceCost;
		this.rentalCost = rentalCost;
		this.bedroom = bedroom;
		this.floorSpace = floorSpace;
		this.status = status;
		this.noticePeriod = noticePeriod;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFloorNo() {
		return floorNo;
	}
	public void setFloorNo(int floorNo) {
		this.floorNo = floorNo;
	}
	public int getDoorNo() {
		return doorNo;
	}
	public void setDoorNo(int doorNo) {
		this.doorNo = doorNo;
	}
	public String getAdvanceCost() {
		return advanceCost;
	}
	public void setAdvanceCost(String advanceCost) {
		this.advanceCost = advanceCost;
	}
	public String getRentalCost() {
		return rentalCost;
	}
	public void setRentalCost(String rentalCost) {
		this.rentalCost = rentalCost;
	}
	public String getBedroom() {
		return bedroom;
	}
	public void setBedroom(String bedroom) {
		this.bedroom = bedroom;
	}
	public String getFloorSpace() {
		return floorSpace;
	}
	public void setFloorSpace(String floorSpace) {
		this.floorSpace = floorSpace;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNoticePeriod() {
		return noticePeriod;
	}
	public void setNoticePeriod(String noticePeriod) {
		this.noticePeriod = noticePeriod;
	}

    // Constructors, getters, and setters
    
}