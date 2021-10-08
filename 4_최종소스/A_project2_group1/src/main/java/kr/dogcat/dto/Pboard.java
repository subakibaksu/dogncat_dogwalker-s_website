package kr.dogcat.dto;

import java.util.Date;

public class Pboard {
	//not null (필수 입력)
	private int pbnum;
	private String email;
	private Date pbdate; //default SYSDATE
	private String pbsubj;
	private String pbcont;
	
	private String pfilename; 
	private int pfilesize;    //default 0
	private int heart;
	
	private String mnic;
	private String gubun;


	public Pboard() {
	}

	public Pboard(int pbnum, String email, Date pbdate, String pbsubj, String pbcont, String pfilename,
			int pfilesize, int heart, String mnic) {
		super();
		this.pbnum = pbnum;
		this.email = email;
		this.pbdate = pbdate;
		this.pbsubj = pbsubj;
		this.pbcont = pbcont;
		this.pfilename = pfilename;
		this.pfilesize = pfilesize;
		this.heart = heart;
		this.mnic = mnic;
	}

	public int getPbnum() {
		return pbnum;
	}

	public void setPbnum(int pbnum) {
		this.pbnum = pbnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getPbdate() {
		return pbdate;
	}

	public void setPbdate(Date pbdate) {
		this.pbdate = pbdate;
	}

	public String getPbsubj() {
		return pbsubj;
	}

	public void setPbsubj(String pbsubj) {
		this.pbsubj = pbsubj;
	}

	public String getPbcont() {
		return pbcont;
	}

	public void setPbcont(String pbcont) {
		this.pbcont = pbcont;
	}

	public String getPfilename() {
		return pfilename;
	}

	public void setPfilename(String pfilename) {
		this.pfilename = pfilename;
	}

	public int getPfilesize() {
		return pfilesize;
	}

	public void setPfilesize(int pfilesize) {
		this.pfilesize = pfilesize;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}
	
	public String getMnic() {
		return mnic;
	}

	public void setMnic(String mnic) {
		this.mnic = mnic;
	}

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	
	
}
