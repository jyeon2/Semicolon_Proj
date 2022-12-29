package host.model;

public class ContentBean {//¼÷¼Ò ¼³¸í
	private int content_no;
	private int house_no;
	private String con1;
	private String con2;
	private String con3;
	private String notice;
	private String rule;
	private String checkinTime;
	private String checkoutTime;
	
	
	
	public ContentBean() {
		super();
	}
	public ContentBean(int content_no, int house_no, String con1, String con2, String con3, String notice, String rule,
			String checkinTime, String checkoutTime) {
		super();
		this.content_no = content_no;
		this.house_no = house_no;
		this.con1 = con1;
		this.con2 = con2;
		this.con3 = con3;
		this.notice = notice;
		this.rule = rule;
		this.checkinTime = checkinTime;
		this.checkoutTime = checkoutTime;
	}
	public int getContent_no() {
		return content_no;
	}
	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}
	public int getHouse_no() {
		return house_no;
	}
	public void setHouse_no(int house_no) {
		this.house_no = house_no;
	}
	public String getCon1() {
		return con1;
	}
	public void setCon1(String con1) {
		this.con1 = con1;
	}
	public String getCon2() {
		return con2;
	}
	public void setCon2(String con2) {
		this.con2 = con2;
	}
	public String getCon3() {
		return con3;
	}
	public void setCon3(String con3) {
		this.con3 = con3;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getRule() {
		return rule;
	}
	public void setRule(String rule) {
		this.rule = rule;
	}
	public String getCheckinTime() {
		return checkinTime;
	}
	public void setCheckinTime(String checkinTime) {
		this.checkinTime = checkinTime;
	}
	public String getCheckoutTime() {
		return checkoutTime;
	}
	public void setCheckoutTime(String checkoutTime) {
		this.checkoutTime = checkoutTime;
	}
	
	
	
}
