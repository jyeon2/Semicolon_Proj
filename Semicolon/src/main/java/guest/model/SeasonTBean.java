package guest.model;

public class SeasonTBean {

	private int st_no;
	private int gno;
	private int ticket_choice;
	private int money;
	
	public SeasonTBean() {
		super();
	}
	public SeasonTBean(int st_no, int gno, int ticket_choice,int money) {
		super();
		this.st_no = st_no;
		this.gno = gno;
		this.ticket_choice = ticket_choice;
		this.money = money;
	}
	public int getSt_no() {
		return st_no;
	}
	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getTicket_choice() {
		return ticket_choice;
	}
	public void setTicket_choice(int ticket_choice) {
		this.ticket_choice = ticket_choice;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	
}
