package order.model;

import java.sql.Date;

public class PayforBean {
	private int pno;
	private int gno; //회원정보
	private int house_no; //숙소정보(어떤숙소인지)
	private String wpay; //결제방법
	private int coupon_no; //쿠폰사용번호
	private int coupon_price; //쿠폰 사용한 가격
	private int use_point; //포인트 사용한 가격
	private int st_no; //정기권사용번호
	private int st_price; //정기권 사용한 가격
	
	private int house_price; //숙소 전체 가격 (몇박)
	private int extra_price; //추가 인원 가격
	private int discount_price; //할인 가격
	private int totalPoint; //적립예정 포인트
	private int totalPrice; //총 결제금액
	private int order_no; //예약번호
	
	private String photo; //숙소 사진
	private Date checkin; //체크인날짜
	private Date checkout; //체크아웃날짜
	private int adult; //성인수
	private int kid; //어린이수
	private int review_use; //리뷰 썼는지 안 썼는지
	
	public int getReview_use() {
		return review_use;
	}
	public void setReview_use(int review_use) {
		this.review_use = review_use;
	}
	private String name; //숙소이름, 예약자이름
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getHouse_no() {
		return house_no;
	}
	public void setHouse_no(int house_no) {
		this.house_no = house_no;
	}
	public String getWpay() {
		return wpay;
	}
	public void setWpay(String wpay) {
		this.wpay = wpay;
	}
	public int getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}
	public int getCoupon_price() {
		return coupon_price;
	}
	public void setCoupon_price(int coupon_price) {
		this.coupon_price = coupon_price;
	}
	public int getUse_point() {
		return use_point;
	}
	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}
	public int getSt_no() {
		return st_no;
	}
	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}
	public int getSt_price() {
		return st_price;
	}
	public void setSt_price(int st_price) {
		this.st_price = st_price;
	}
	public int getHouse_price() {
		return house_price;
	}
	public void setHouse_price(int house_price) {
		this.house_price = house_price;
	}
	public int getExtra_price() {
		return extra_price;
	}
	public void setExtra_price(int extra_price) {
		this.extra_price = extra_price;
	}
	public int getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(int discount_price) {
		this.discount_price = discount_price;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
