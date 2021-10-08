package kr.dogcat.dto;

import java.util.Date;

public class WalkingBoard {

	private int rnum;
	private String email;
	private String mphone;
	private String madd;
	private Date udate;
	private String time;
	private int price;
	private Date rdate;
	private String rstatus;
	
	public WalkingBoard() {}

	public WalkingBoard(int rnum, String email, String mphone, String madd, Date udate, String time, int price,
			Date rdate, String rstatus) {
		super();
		this.rnum = rnum;
		this.email = email;
		this.mphone = mphone;
		this.madd = madd;
		this.udate = udate;
		this.time = time;
		this.price = price;
		this.rdate = rdate;
		this.rstatus = rstatus;
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

	public Date getUdate() {
		return udate;
	}

	public void setUdate(Date udate) {
		this.udate = udate;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
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

	@Override
	public String toString() {
		return "WalkingBoard [rnum=" + rnum + ", email=" + email + ", mphone=" + mphone + ", madd=" + madd + ", udate="
				+ udate + ", time=" + time + ", price=" + price + ", rdate=" + rdate + ", rstatus=" + rstatus + "]";
	}

	
	
}
