package kr.dogcat.dto;

import java.util.Date;

public class Memo {
	private int memonum;
	private String email;
	private Date mmdate;
	private String mmcont;
	private String mnic;

	//원글번호 참조
	private int pbnum_fk;

	public Memo() {
	}

	public Memo(int memonum, String email, Date mmdate, String mmcont, int pbnum_fk, String mnic) {
		super();
		this.memonum = memonum;
		this.email = email;
		this.mmdate = mmdate;
		this.mmcont = mmcont;
		this.pbnum_fk = pbnum_fk;
		this.mnic = mnic;
	}

	public int getMemonum() {
		return memonum;
	}

	public void setMemonum(int memonum) {
		this.memonum = memonum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getMmdate() {
		return mmdate;
	}

	public void setMmdate(Date mmdate) {
		this.mmdate = mmdate;
	}

	public String getMmcont() {
		return mmcont;
	}

	public void setMmcont(String mmcont) {
		this.mmcont = mmcont;
	}

	public int getPbnum_fk() {
		return pbnum_fk;
	}

	public void setPbnum_fk(int pbnum_fk) {
		this.pbnum_fk = pbnum_fk;
	}
	
	public String getMnic() {
		return mnic;
	}

	public void setMnic(String mnic) {
		this.mnic = mnic;
	}
	
}


