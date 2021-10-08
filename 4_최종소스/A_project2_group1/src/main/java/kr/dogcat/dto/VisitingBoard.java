package kr.dogcat.dto;

import java.util.Date;

public class VisitingBoard {
	
	private int rnum;
	private String email;
	private String mphone;
	private String madd;
	private Date sdate;
	private Date edate;
	private int price;
	private Date rdate;
	private String rstatus;
	private String pet;
	private int useday;

	public VisitingBoard() {}

	public VisitingBoard(int rnum, String email, String mphone, String madd, Date sdate, Date edate, int price,
			Date rdate, String rstatus, String pet, int useday) {
		super();
		this.rnum = rnum;
		this.email = email;
		this.mphone = mphone;
		this.madd = madd;
		this.sdate = sdate;
		this.edate = edate;
		this.price = price;
		this.rdate = rdate;
		this.rstatus = rstatus;
		this.pet = pet;
		this.useday = useday;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public String getMadd() {
		return madd;
	}

	public void setMadd(String madd) {
		this.madd = madd;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getRstatus() {
		return rstatus;
	}

	public void setRstatus(String rstatus) {
		this.rstatus = rstatus;
	}

	public String getPet() {
		return pet;
	}

	public void setPet(String pet) {
		this.pet = pet;
	}

	public int getUseday() {
		return useday;
	}

	public void setUseday(int useday) {
		this.useday = useday;
	}

	@Override
	public String toString() {
		return "VisitingBoard [rnum=" + rnum + ", email=" + email + ", mphone=" + mphone + ", madd=" + madd + ", sdate="
				+ sdate + ", edate=" + edate + ", price=" + price + ", rdate=" + rdate + ", rstatus=" + rstatus
				+ ", pet=" + pet + ", useday=" + useday + "]";
	}
	
	
}
