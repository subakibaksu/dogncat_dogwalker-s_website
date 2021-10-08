package kr.dogcat.board.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.ReservationDao;
import kr.dogcat.dao.ReviewBoardDao;

public class AddressCheckService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;

		String email = request.getParameter("email");
		String madd;

		try {
			
			ReservationDao rvd = new ReservationDao();

			madd = rvd.getAddress(email);
			
			request.setAttribute("message", madd);
			
			forward = new ActionForward();
			forward.setRedirect(false); // forward
			forward.setPath("/WEB-INF/views/rboard/uservalid.jsp");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return forward;
	}

}
