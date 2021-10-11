package kr.dogcat.dto;

public class MemberBoard {
	
	private String email;
	private String mnic;
	private String mname;
	private String mphone;
	private String madd;
	private int count;
	private int totalp;
	
	
	public MemberBoard() {}


	public MemberBoard(String email, String mnic, String mname, String mphone, String madd, int count, int totalp) {
		super();
		this.email = email;
		this.mnic = mnic;
		this.mname = mname;
		this.mphone = mphone;
		this.madd = madd;
		this.count = count;
		this.totalp = totalp;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMnic() {
		return mnic;
	}


	public void setMnic(String mnic) {
		this.mnic = mnic;
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
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


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int getTotalp() {
		return totalp;
	}


	public void setTotalp(int totalp) {
		this.totalp = totalp;
	}


	@Override
	public String toString() {
		return "MemberBoard [email=" + email + ", mnic=" + mnic + ", mname=" + mname + ", mphone=" + mphone + ", madd="
				+ madd + ", count=" + count + ", totalp=" + totalp + "]";
	}
 
	
}