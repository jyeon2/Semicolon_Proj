package host.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class AllBean {
	private int house_no;

	@NotBlank(message = "테마를 선택하세요")
	private String tname;

	@NotBlank(message = "서브테마를 선택하세요")
	private String sname;

	@NotBlank(message = "이름을 입력하세요")
	private String name;

	private String photo;

	@NotBlank(message = "가격을 입력하세요")
	private String price;

	private String address;

	private String detailed;

	@NotNull(message = "facility 입력하세요")
	private String facility;

	@NotBlank(message = "인원수를 선택하세요")
	private String num;

	@NotBlank(message = "인원수를 선택하세요")
	private String maxnum;

	@NotBlank(message = "상세설명을 입력하세요")
	private String con1;

	@NotBlank(message = "상세설명을 입력하세요")
	private String con2;

	@NotBlank(message = "상세설명을 입력하세요")
	private String con3;

	private String notice;

	private String rule;

	private String checkinTime;
	private String checkoutTime;

	private String house_date;

	private int cnt; // 개수

	private MultipartFile upload;

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		this.photo = upload.getOriginalFilename();
	}

	public AllBean() {
		super();
	}

	public AllBean(int house_no, String tname, String sname, String name, String photo, String price, String address,
			String detailed, String facility, String num, String maxnum, String con1, String con2, String con3,
			String notice, String rule, String checkinTime, String checkoutTime, String house_date) {
		super();
		this.house_no = house_no;
		this.tname = tname;
		this.sname = sname;
		this.name = name;
		this.photo = photo;
		this.price = price;
		this.address = address;
		this.detailed = detailed;
		this.facility = facility;
		this.num = num;
		this.maxnum = maxnum;
		this.con1 = con1;
		this.con2 = con2;
		this.con3 = con3;
		this.notice = notice;
		this.rule = rule;
		this.checkinTime = checkinTime;
		this.checkoutTime = checkoutTime;
		this.house_date = house_date;
	}

	public String getDetailed() {
		return detailed;
	}

	public void setDetailed(String detailed) {
		this.detailed = detailed;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getHouse_no() {
		return house_no;
	}

	public void setHouse_no(int house_no) {
		this.house_no = house_no;
	}

	public String getHouse_date() {
		return house_date;
	}

	public void setHouse_date(String house_date) {
		this.house_date = house_date;
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

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFacility() {
		return facility;
	}

	public void setFacility(String facility) {
		System.out.println("setFacility");
		this.facility = facility;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
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

	public String getMaxnum() {
		return maxnum;
	}

	public void setMaxnum(String maxnum) {
		this.maxnum = maxnum;
	}

}
