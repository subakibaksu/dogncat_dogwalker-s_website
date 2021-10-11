package kr.dogcat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.dogcat.dto.ReviewBoard;
import kr.dogcat.utils.ConnectionHelper;

public class ReviewBoardDao {

	// 게시물 총 건수 구하기
	public int totalBoardCount() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalcount = 0;
		try {
			
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select count(*) cnt from Rboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalcount = rs.getInt("cnt");
			}
			
		} catch (Exception e) {

		} finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(rs);
				ConnectionHelper.close(conn);
			} catch (Exception e) {

			}
		}
		return totalcount;
	}

	// 게시물 목록보기
	public List<ReviewBoard> list(int cpage, int pagesize) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewBoard> list = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			
			String sql = "select * from "
			  		   + "(select rownum rn, t.rbnum, m.mnic, t.rbdate,t.rbsubj,t.rbcont,t.point,t.ref,t.depth,t.step "
					   + "from ( SELECT * FROM Rboard ORDER BY ref DESC , step ASC ) t "
					   + "join Member m on t.email = m.email "
					   + "where rownum <= ?) where rn >= ?";
			
			pstmt = conn.prepareStatement(sql);
			// 공식같은 로직
			int start = cpage * pagesize - (pagesize - 1); // 현재 페이지의 첫번째 번호 (cpage-1)*pagesize+1
			int end = cpage * pagesize; // 현재 페이지의 마지막 번호
			//
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);

			rs = pstmt.executeQuery();
			list = new ArrayList<ReviewBoard>();
			while (rs.next()) {
				ReviewBoard board = new ReviewBoard();
				board.setRbnum(rs.getInt("rbnum"));
				board.setMnic(rs.getString("mnic"));
				board.setRbdate(rs.getDate("rbdate"));
				board.setRbsubj(rs.getString("rbsubj"));
				board.setRbcont(rs.getString("rbcont"));
				board.setPoint(rs.getInt("point"));

				// 계층형
				board.setRef(rs.getInt("ref"));
				board.setDepth(rs.getInt("depth"));
				board.setStep(rs.getInt("step"));

				list.add(board);
			}

		} catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		} finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(rs);
				ConnectionHelper.close(conn);// 반환
			} catch (Exception e2) {

			}
		}

		return list;
	}

	// 글쓰기(원글)
	public int writeok(ReviewBoard boarddata) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "insert into Rboard(rbnum, email, rbdate, rbsubj, rbcont, point, ref, depth, step)"
					+ " values(Rboard_rbnum.nextval,?,sysdate,?,?,?,?, 0, 0)";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, boarddata.getEmail());
			pstmt.setString(2, boarddata.getRbsubj());
			pstmt.setString(3, boarddata.getRbcont());
			pstmt.setInt(4, boarddata.getPoint());

			// 계층형 게시판
			// refer(참조값) , step , depth
			// 1. 원본글 : refer 생성? , step(0) default , depth(0) default
			// 2. 답변글 : refer 생성? , step +1 , depth +1

			int refermax = getMaxRefer();
			int refer = refermax + 1;
			pstmt.setInt(5, refer);

			row = pstmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);// 반환하기
			} catch (Exception e2) {

			}
		}

		return row;
	}

	// 글쓰기(원글) (refer) 값 생성하기
	private int getMaxRefer() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int refer_max = 0;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select nvl(max(ref),0) from Rboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				refer_max = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(rs);
				ConnectionHelper.close(conn); // 반납이요 ^^
			} catch (Exception e) {

			}
		}

		return refer_max;

	}

	// 게시물 상세보기 - 비동기
	public String getContent(int rbnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String boardcont = null;

		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select rbcont from Rboard where rbnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rbnum);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				boardcont = rs.getString("rbcont");
			}

		} catch (Exception e) {
			System.out.println("content: " + e.getMessage());
		} finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(rs);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {

			}
		}

		return boardcont;
	}

	// 게시글 수정하기 화면으로 이동
	public ReviewBoard getEditContent(String rbnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewBoard board = null;

		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select rbnum, rbsubj, rbcont, point from Rboard where rbnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(rbnum));

			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new ReviewBoard();
				board.setRbnum(rs.getInt("rbnum"));
				board.setRbsubj(rs.getString("rbsubj"));
				board.setRbcont(rs.getString("rbcont"));
				board.setPoint(rs.getInt("point"));
			}

		} catch (Exception e) {
			System.out.println("content: " + e.getMessage());
		} finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(rs);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {

			}
		}

		return board;
	}
	

	// 게시글 수정하기 처리
	public int boardEdit(HttpServletRequest boarddata) {
		int rbnum= Integer.parseInt(boarddata.getParameter("rbnum"));
		String rbsubj= boarddata.getParameter("rbsubj");
		String rbcont= boarddata.getParameter("rbcont");
		int point = 0;
		if(boarddata.getParameter("point")==null) {
			point = 0;
		}else {
			point= Integer.parseInt(boarddata.getParameter("point"));
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;

		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql_udpate = "update Rboard set rbsubj=? , rbcont=? , point=? where rbnum=?";

			pstmt = conn.prepareStatement(sql_udpate);
			pstmt.setString(1, rbsubj);
			pstmt.setString(2, rbcont);
			pstmt.setInt(3, point);
			pstmt.setInt(4, rbnum);

			row = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {

			}
		}

		return row;
	}

	// 게시글 삭제하기
	public int deleteOk(int rbnum) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ref = 0;
		int depth = 0;
		String rbsubj = "";
		int row1 = 0;
		int row2 = 0;
		int rowsum = 0;

		try {
			conn = ConnectionHelper.getConnection("oracle");

			// get ref , depth
			String sql_rd = "select rbsubj, ref, depth from Rboard where rbnum=?";

			// 게시글 삭제
			String sql_del = "delete from Rboard where rbnum=?";
			
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql_rd);
			pstmt.setInt(1, rbnum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				ref = rs.getInt("ref");
				depth = rs.getInt("depth");
				rbsubj = rs.getString("rbsubj");
				
				pstmt.close();
			}

			row1 = rbsubjEdit(ref, depth, rbsubj);
			System.out.println("row1 :"+row1);
			
			// 게시글 삭제 (원본글)
			pstmt = conn.prepareStatement(sql_del);
			pstmt.setInt(1, rbnum);
			row2 = pstmt.executeUpdate();
			System.out.println("row2 :"+row2);
			
			rowsum = row1 + row2;
			
			System.out.println("rowsum :"+rowsum);
			if (rowsum > 0) {
					conn.commit(); // 두개의 진행상황 실반영
			} else { // 삭제하는 글이 존재하지 않는 경우
				rowsum = 0;
			}

		} catch (Exception e) {
			// 예외가 발생하면 rollback
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

		} finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(rs);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {

			}
		}
		return rowsum;
	}

	// 게시글 삭제 - 답글 제목 변경
	public int rbsubjEdit(int ref, int depth, String rbsubj) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;

		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql_udpate = "update Rboard set rbsubj=? where ref=? and depth=?";

			pstmt = conn.prepareStatement(sql_udpate);
			pstmt.setString(1, "[원글삭제] " + rbsubj);
			pstmt.setInt(2, ref);
			pstmt.setInt(3, depth + 1);

			row = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {

			}
		}

		return row;
	}

	// 답글 쓰기
	public int reWriteOk(ReviewBoard boardata) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		int ref = 0;
		int depth = 0;
		int stepmax = 0;
		try {
			conn = ConnectionHelper.getConnection("oracle");

			int rbnum = boardata.getRbnum(); // 현재 읽은 글의 글번호
			String rbsubj = boardata.getRbsubj();
			String rbcont = boardata.getRbcont();

			// 현재 내가 읽은 글의 refer , depth , step (원본글 ,답글)
			String refer_depth_step_sal = "select ref , depth from Rboard where rbnum=?";

			// 답글 insert
			String sql = "insert into Rboard(rbnum, email, rbdate, rbsubj, rbcont, point, ref, depth, step)"
					+ " values(Rboard_rbnum.nextval,'admin@dogcat.com',sysdate,?,?,0,?,?,?)";

			pstmt = conn.prepareStatement(refer_depth_step_sal);
			pstmt.setInt(1, rbnum);
			rs = pstmt.executeQuery();

			if (rs.next()) { // 데이터가 있다면 ... 원본글의 refer , step , depth 존재
				ref = rs.getInt("ref");
				depth = rs.getInt("depth");
				stepmax = getStepMax(ref);
			
				pstmt.close();
			}

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, rbsubj);
				pstmt.setString(2, rbcont);
				pstmt.setInt(3, ref);
				pstmt.setInt(4, depth + 1); // 규칙 현재 읽은 글에 depth + 1
				pstmt.setInt(5, stepmax + 1);

				int row = pstmt.executeUpdate();
				if (row > 0) {
					result = row;
				} else {
					result = -1;
				}

			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();// 반환
			} catch (Exception e) {

			}
		}

		return result;
	}

	// 답글 쓰기 - step max 구하기
	public int getStepMax(int ref) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxstep = 0;

		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select nvl(max(step),0) from Rboard where ref=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				maxstep = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("content: " + e.getMessage());
		} finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(rs);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {

			}
		}

		return maxstep;
	}

}
