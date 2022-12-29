package host.model;
import org.springframework.web.multipart.MultipartFile;

public class HouseBean {//상품
	private int house_no;
	private int hno;
	private String tname;
	private String sname;
	private String name;
	private String facility;
	private String num;
	private String maxnum;
	private String price;
	private int point;
	private String house_date;
	private String photo;

	private String original_name; //전에 있는 테마,서브테마이름
	
	private MultipartFile upload;
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		this.photo = upload.getOriginalFilename();
	}
	
	
	
	public HouseBean() {
		super();
	}
	public HouseBean(int house_no, int hno, String tname, String sname, String name, String facility,
			String num, String maxnum, String price,int point, String house_date, String photo
			) {
		super();
		this.house_no = house_no;
		this.hno = hno;
		this.tname = tname;
		this.sname = sname;
		this.name = name;
		this.facility = facility;
		this.num = num;
		this.maxnum = maxnum;
		this.price = price;
		this.point = point;
		this.house_date = house_date;
		this.photo = photo;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public int getHouse_no() {
		return house_no;
	}
	public void setHouse_no(int house_no) {
		this.house_no = house_no;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFacility() {
		return facility;
	}
	public void setFacility(String facility) {
		this.facility = facility;
	}
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getHouse_date() {
		return house_date;
	}
	public void setHouse_date(String house_date) {
		this.house_date = house_date;
	}
	public String getMaxnum() {
		return maxnum;
	}
	public void setMaxnum(String maxnum) {
		this.maxnum = maxnum;
	}
	public String getOriginal_name() {
		return original_name;
	}
	public void setOriginal_name(String original_name) {
		this.original_name = original_name;
	}
	
}
