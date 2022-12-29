package host.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

public class HostBean {
	private int hno;
	@NotBlank(message="이메일을 입력하세요")
	private String email;

	@Pattern(regexp = "^.*[a-zA-Z0-9]{5,10}$", message = "5~10자의 영문, 숫자가 한 번씩은 들어가야 합니다.")
	private String password;

	@NotBlank(message="이름을 입력하세요")
	private String name;

	@NotBlank(message="전화번호를 입력하세요")
	private String phone;

	private String joindate;
	
	private int rv_cnt; //총 예약 건수
	
	private int rank; //등수
	
	private int cnt; //개수
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getRv_cnt() {
		return rv_cnt;
	}
	public void setRv_cnt(int rv_cnt) {
		this.rv_cnt = rv_cnt;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}