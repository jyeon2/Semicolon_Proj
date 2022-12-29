package review.model;

import java.sql.Date;

import org.hibernate.validator.constraints.NotBlank;

public class ReviewBean {
	private int review_no;
	private int gno;
	private int house_no;
	private String name; //숙소이름
	private Date checkin;
	private Date checkout;
	private int pno;
	private String gname; //게스트 이름
	private double reviewavg;
	

	@NotBlank(message="만족도를 선택하세요")
	private String total;
	
	@NotBlank(message="내용을 작성해주세요")
	private String text;
	private Date reviewdate;
	
	public double getReviewavg() {
		return reviewavg;
	}
	public void setReviewavg(double reviewavg) {
		this.reviewavg = reviewavg;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
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
	
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getReviewdate() {
		return reviewdate;
	}
	public void setReviewdate(Date reviewdate) {
		this.reviewdate = reviewdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	
	
}
