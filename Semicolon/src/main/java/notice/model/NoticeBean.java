package notice.model;

import java.sql.Timestamp;


import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class NoticeBean {
	private int nno;
	
	@NotBlank(message="*제목을 입력해 주세요.")
	private String title;
	
	@Length(min=5,message="최소 5자 이상은 입력해야 합니다.")
	private String content;
	
	@NotEmpty(message="반드시 하나는 골라야 합니다.")
	private String cate;
	
	private String coupon;

	private Timestamp nt_date;
	private int n_readcount;
	private String nfile;//최종이미지 파일 변수
	
	//1.
	public MultipartFile upload; //파일찐업로드
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		System.out.println("upload.getName() : "+upload.getName());
		this.nfile= upload.getOriginalFilename(); //2.
	}
	
	
	public NoticeBean() {
		super();
	}
	public NoticeBean(int nno, String title, String content, String cate, String coupon, Timestamp nt_date,
			int n_readcount, String nfile, MultipartFile upload) {
		super();
		this.nno = nno;
		this.title = title;
		this.content = content;
		this.cate = cate;
		this.coupon = coupon;
		this.nt_date = nt_date;
		this.n_readcount = n_readcount;
		this.nfile = nfile;
		this.upload = upload;
	}
	
	public NoticeBean(int nno,String title, String content, String cate, String coupon) {
		super();
		this.nno = nno;
		this.title = title;
		this.content = content;
		this.cate = cate;
		this.coupon = coupon;
	}
	public String getCoupon() {
		return coupon;
	}
	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getNt_date() {
		return nt_date;
	}
	public void setNt_date(Timestamp nt_date) {
		this.nt_date = nt_date;
	}
	public int getN_readcount() {
		return n_readcount;
	}
	public void setN_readcount(int n_readcount) {
		this.n_readcount = n_readcount;
	}
	public String getNfile() {
		return nfile;
	}
	public void setNfile(String nfile) {
		this.nfile = nfile;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	
}	
	
	