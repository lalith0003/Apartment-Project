package model;

public class AllRequest {
	int id;
	int floor_no;
	int door_no;
	String username; 
    String contact; 
    String comment;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFloor_no() {
		return floor_no;
	}
	public void setFloor_no(int floor_no) {
		this.floor_no = floor_no;
	}
	public int getDoor_no() {
		return door_no;
	}
	public void setDoor_no(int door_no) {
		this.door_no = door_no;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public AllRequest(int id, int floor_no, int door_no, String username, String contact, String comment) {
		super();
		this.id = id;
		this.floor_no = floor_no;
		this.door_no = door_no;
		this.username = username;
		this.contact = contact;
		this.comment = comment;
	}
    
}
