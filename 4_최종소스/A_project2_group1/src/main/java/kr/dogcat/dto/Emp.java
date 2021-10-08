package kr.dogcat.dto;

public class Emp {
	private int empno;
	private String ename;
	private String ephoto;
	private String eintro;
	private String aname;
	
	public Emp() {
		
	}

	public Emp(int empno, String ename, String ephoto, String eintro, String aname) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.ephoto = ephoto;
		this.eintro = eintro;
		this.aname = aname;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEphoto() {
		return ephoto;
	}

	public void setEphoto(String ephoto) {
		this.ephoto = ephoto;
	}

	public String getEintro() {
		return eintro;
	}

	public void setEintro(String eintro) {
		this.eintro = eintro;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + ", ephoto=" + ephoto + ", eintro=" + eintro + ", aname="
				+ aname + "]";
	}
	
	
}
