package host.model;

public class AddressBean {//주소(지도에서 사용)
	private int address_no;
	private int house_no;
	private String address;
	private String detailed;
	
	
	
	public AddressBean() {
		super();
	}
	public AddressBean(int address_no, int house_no, String address, String detailed) {
		super();
		this.address_no = address_no;
		this.house_no = house_no;
		this.address = address;
		this.detailed = detailed;
	}
	
	public String getDetailed() {
		return detailed;
	}
	public void setDetailed(String detailed) {
		this.detailed = detailed;
	}
	public int getAddress_no() {
		return address_no;
	}
	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}
	public int getHouse_no() {
		return house_no;
	}
	public void setHouse_no(int house_no) {
		this.house_no = house_no;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
