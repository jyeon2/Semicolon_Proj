package admin.model;

import org.hibernate.validator.constraints.NotBlank;

public class SubThemeBean {
	private int sno;
	
	@NotBlank(message="서브테마 이름을 입력하세요")
	private String name;
	private String theme_cate;
	
	@NotBlank(message="서브테마 상세설명을 입력하세요")
	private String contents;
	
	public int getSno() {
		return sno;
	}
	public String getTheme_cate() {
		return theme_cate;
	}
	public void setTheme_cate(String theme_cate) {
		this.theme_cate = theme_cate;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
}
