package admin.model;

import org.hibernate.validator.constraints.NotBlank;

public class CouponBean {
	//관리자
	@NotBlank(message="쿠폰 코드를 입력하세요")
	private String code;
	
	private String oldCode; //원래 쿠폰 코드
	
	@NotBlank(message="쿠폰 이름을 입력하세요")
	private String name;
	
	private int percent;
	private int sale;
	
	public CouponBean() {
		super();
	}
	public CouponBean(String code, String name, int percent, int sale) {
		super();
		this.code = code;
		this.name = name;
		this.percent = percent;
		this.sale = sale;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getOldCode() {
		return oldCode;
	}
	public void setOldCode(String oldCode) {
		this.oldCode = oldCode;
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
	
}
