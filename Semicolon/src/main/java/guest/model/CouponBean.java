package guest.model;

public class CouponBean {
	//게스트
	private int coupon_no; 
	private int gno; //어떤 게스트인지
	private String code; //어떤 쿠폰인지
	private String name; //관리자 : 쿠폰이름
	private int percent; //관리자 : 쿠폰퍼센트
	private int sale; //관리자 : 쿠폰세일
	private int use; //사용했는지 안햇는지 (사용가능 : 1 / 사용불가 : 0)
	private String period; //사용기간
	
	
	
	public CouponBean() {
		super();
	}
	public CouponBean(int coupon_no, int gno, String code, String name, int percent, int sale, int use, String period) {
		super();
		this.coupon_no = coupon_no;
		this.gno = gno;
		this.code = code;
		this.name = name;
		this.percent = percent;
		this.sale = sale;
		this.use = use;
		this.period = period;
	}
	public int getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public int getUse() {
		return use;
	}
	public void setUse(int use) {
		this.use = use;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	
}
