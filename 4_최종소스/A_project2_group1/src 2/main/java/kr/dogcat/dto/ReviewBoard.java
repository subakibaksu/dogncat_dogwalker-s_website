package kr.dogcat.dto;

import java.util.Date;

public class ReviewBoard {
	private int rbnum; // 글번호
	private String mnic; // 닉네임
	private String email; // 이메일
	private Date rbdate; // 작성일
	private String rbsubj; // 글제목
	private String rbcont; // 글 내용
	private int point; // 만족도
	private int ref; // 그룹번호
	private int depth; // 들여쓰기
	private int step; // 답변정렬
	
	public ReviewBoard() {}

	public ReviewBoard(int rbnum, String mnic, String email, Date rbdate, String rbsubj, String rbcont, int point,
			int ref, int depth, int step) {
		super();
		this.rbnum = rbnum;
		this.mnic = mnic;
		this.email = email;
		this.rbdate = rbdate;
		this.rbsubj = rbsubj;
		this.rbcont = rbcont;
		this.point = point;
		this.ref = ref;
		this.depth = depth;
		this.step = step;
	}

	public int getRbnum() {
		return rbnum;
	}

	public void setRbnum(int rbnum) {
		this.rbnum = rbnum;
	}

	public String getMnic() {
		return mnic;
	}

	public void setMnic(String mnic) {
		this.mnic = mnic;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRbdate() {
		return rbdate;
	}

	public void setRbdate(Date rbdate) {
		this.rbdate = rbdate;
	}

	public String getRbsubj() {
		return rbsubj;
	}

	public void setRbsubj(String rbsubj) {
		this.rbsubj = rbsubj;
	}

	public String getRbcont() {
		return rbcont;
	}

	public void setRbcont(String rbcont) {
		this.rbcont = rbcont;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	@Override
	public String toString() {
		return "ReviewBoard [rbnum=" + rbnum + ", mnic=" + mnic + ", email=" + email + ", rbdate=" + rbdate
				+ ", rbsubj=" + rbsubj + ", rbcont=" + rbcont + ", point=" + point + ", ref=" + ref + ", depth=" + depth
				+ ", step=" + step + "]";
	}

	

	
				
	
}
