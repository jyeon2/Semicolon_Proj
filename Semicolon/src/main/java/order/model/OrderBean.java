package order.model;

import java.sql.Date;

import org.hibernate.validator.constraints.NotBlank;

public class OrderBean {
	private int order_no;
	   private int house_no;
	   private int gno;
	   private String photo;
	   
	   @NotBlank(message="체크인 날짜를 선택하세요")
	   private String checkin;
	   
	   @NotBlank(message="체크아웃 날짜를 선택하세요")
	   private String checkout;
	   
	   @NotBlank(message="인원수를 선택하세요")
	   private String adult;
	   
	   @NotBlank(message="인원수를 선택하세요")
	   private String kid;
	   private int house_price;
	
	public OrderBean() {
		super();
	}
	
	public OrderBean(int order_no, int house_no, int gno, String photo, String checkin, String checkout, String adult, String kid,
			int house_price) {
		super();
		this.order_no = order_no;
		this.house_no = house_no;
		this.gno = gno;
		this.photo = photo;
		this.checkin = checkin;
		this.checkout = checkout;
		this.adult = adult;
		this.kid = kid;
		this.house_price = house_price;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getHouse_no() {
		return house_no;
	}
	public void setHouse_no(int house_no) {
		this.house_no = house_no;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getAdult() {
		return adult;
	}
	public void setAdult(String adult) {
		this.adult = adult;
	}
	public String getKid() {
		return kid;
	}
	public void setKid(String kid) {
		this.kid = kid;
	}
	public int getHouse_price() {
		return house_price;
	}
	public void setHouse_price(int house_price) {
		this.house_price = house_price;
	}
}
