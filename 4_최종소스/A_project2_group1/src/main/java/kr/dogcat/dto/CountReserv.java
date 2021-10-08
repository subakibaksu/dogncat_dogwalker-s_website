package kr.dogcat.dto;

public class CountReserv {
	private int july_w;
	private int july_vd;
	private int july_vc;
	private int august_w;
	private int august_vd;
	private int august_vc;
	private int sep_w;
	private int sep_vd;
	private int sep_vc;
	
	public CountReserv() {
		
	}

	public CountReserv(int july_w, int july_vd, int july_vc, int august_w, int august_vd, int august_vc, int sep_w,
			int sep_vd, int sep_vc) {
		super();
		this.july_w = july_w;
		this.july_vd = july_vd;
		this.july_vc = july_vc;
		this.august_w = august_w;
		this.august_vd = august_vd;
		this.august_vc = august_vc;
		this.sep_w = sep_w;
		this.sep_vd = sep_vd;
		this.sep_vc = sep_vc;
	}

	public int getJuly_w() {
		return july_w;
	}

	public void setJuly_w(int july_w) {
		this.july_w = july_w;
	}

	public int getJuly_vd() {
		return july_vd;
	}

	public void setJuly_vd(int july_vd) {
		this.july_vd = july_vd;
	}

	public int getJuly_vc() {
		return july_vc;
	}

	public void setJuly_vc(int july_vc) {
		this.july_vc = july_vc;
	}

	public int getAugust_w() {
		return august_w;
	}

	public void setAugust_w(int august_w) {
		this.august_w = august_w;
	}

	public int getAugust_vd() {
		return august_vd;
	}

	public void setAugust_vd(int august_vd) {
		this.august_vd = august_vd;
	}

	public int getAugust_vc() {
		return august_vc;
	}

	public void setAugust_vc(int august_vc) {
		this.august_vc = august_vc;
	}

	public int getSep_w() {
		return sep_w;
	}

	public void setSep_w(int sep_w) {
		this.sep_w = sep_w;
	}

	public int getSep_vd() {
		return sep_vd;
	}

	public void setSep_vd(int sep_vd) {
		this.sep_vd = sep_vd;
	}

	public int getSep_vc() {
		return sep_vc;
	}

	public void setSep_vc(int sep_vc) {
		this.sep_vc = sep_vc;
	}

	@Override
	public String toString() {
		return "CountReserv [july_w=" + july_w + ", july_vd=" + july_vd + ", july_vc=" + july_vc + ", august_w="
				+ august_w + ", august_vd=" + august_vd + ", august_vc=" + august_vc + ", sep_w=" + sep_w + ", sep_vd="
				+ sep_vd + ", sep_vc=" + sep_vc + "]";
	}
	
	
}
