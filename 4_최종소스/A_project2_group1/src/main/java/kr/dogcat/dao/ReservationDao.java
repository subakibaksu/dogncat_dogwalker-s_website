package kr.dogcat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import kr.dogcat.utils.ConnectionHelper;

public class ReservationDao {

	// 주소 찾기
	public String getAddress(String email) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String madd = "";
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select madd from Member where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				madd = rs.getString("madd");
				System.out.println(madd);
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
		return madd;
	}
	
	// 방문 - 고양이 등록
	public boolean csReserv(String email, String sdate, String edate) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "insert into Reserv_v(rnum, email, rdate, sdate, edate, useday, price, pet, rstatuscode) "
					   + "values(Reserv_num.nextval,?,sysdate,?,?,?,?,'고양이',1)";
			int useday = Integer.parseInt(edate)-Integer.parseInt(sdate);
			int price = useday * 100000;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, sdate);
			pstmt.setString(3, edate);
			pstmt.setInt(4, useday);
			pstmt.setInt(5, price);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				check = true;
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
		return check;
	}
	
	// 방문 - 강아지 등록
	public boolean dsReserv(String email, String sdate, String edate) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "insert into Reserv_v(rnum, email, rdate, sdate, edate, useday, price, pet, rstatuscode) "
					   + "values(Reserv_num.nextval,?,sysdate,?,?,?,?,'개',1)";
			int useday = Integer.parseInt(edate)-Integer.parseInt(sdate);
			int price = useday * 100000;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, sdate);
			pstmt.setString(3, edate);
			pstmt.setInt(4, useday);
			pstmt.setInt(5, price);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				check = true;
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
		return check;
	}
	
	// 산책 - 강아지 등록
	public boolean dwReserv(String email, String udate, int wtcode) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "insert into Reserv_w(rnum, email, rdate, udate, price, wtcode, rstatuscode) "
					   + "values(Reserv_num.nextval,?,sysdate,?,50000,?,1)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, udate);
			pstmt.setInt(3, wtcode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				check = true;
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
		return check;
	}
	
}
