package host.model;

import java.sql.Date;

public class ReserveBean {
	private int gno; //회원정보
	private String gname; // 회원이름, 원래 name이라서 as gname 해주기
	private String email;//회원이메일
	//guest
	private String hsname;
	private int pno;
	private int hno;
	private int house_no; //숙소정보(어떤숙소인지)
	private String tname; //테마네임
	private String sname; //서브테마네임
	private String name;//집이름 , 
	private String city;
	private String street;
	//house // allbean으로 받아야됌

	private String wpay; //결제방법
	private int st_no; //정기권사용번호
	private int totalPrice; //총 결제금액
	//payfor
	private int order_no; //예약번호
	private Date checkin; //체크인날짜
	private Date checkout; //체크아웃날짜
	private int adult; //성인수
	private int kid; //어린이수
	//order_house
	
	
	
	
	public ReserveBean() {
		super();
	}
	public ReserveBean(int gno, String gname, String email, int hno, int house_no, String tname, String sname,
			String name, String city, String street, String wpay, int st_no, int totalPrice, int order_no,
			Date checkin, Date checkout, int adult, int kid) {
		super();
		this.gno = gno;
		this.gname = gname;
		this.email = email;
		this.hno = hno;
		this.house_no = house_no;
		this.tname = tname;
		this.sname = sname;
		this.name = name;
		this.city = city;
		this.street = street;
		this.wpay = wpay;
		this.st_no = st_no;
		this.totalPrice = totalPrice;
		this.order_no = order_no;
		this.checkin = checkin;
		this.checkout = checkout;
		this.adult = adult;
		this.kid = kid;
	}

	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getHsname() {
		return hsname;
	}
	public void setHsname(String hsname) {
		this.hsname = hsname;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public int getHouse_no() {
		return house_no;
	}
	public void setHouse_no(int house_no) {
		this.house_no = house_no;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getWpay() {
		return wpay;
	}
	public void setWpay(String wpay) {
		this.wpay = wpay;
	}
	public int getSt_no() {
		return st_no;
	}
	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public Date getCheckin() {
		return checkin;
	}
	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}
	public Date getCheckout() {
		return checkout;
	}
	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getKid() {
		return kid;
	}
	public void setKid(int kid) {
		this.kid = kid;
	}
}

