package kr.dogcat.dto;

public class Member {
	String email;
	String mnic;
	String mname;
	String mpwd;
	String madd;
	String mphone;
	
	public Member() {
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

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getMadd() {
		return madd;
	}

	public void setMadd(String madd) {
		this.madd = madd;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	@Override
	public String toString() {
		return "Member [email=" + email + ", mnic=" + mnic + ", mname=" + mname + ", mpwd=" + mpwd + ", madd=" + madd
				+ ", mphone=" + mphone + "]";
	}
	
}