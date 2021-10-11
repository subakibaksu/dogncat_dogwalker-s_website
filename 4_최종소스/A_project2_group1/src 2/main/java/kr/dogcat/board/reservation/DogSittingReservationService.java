package kr.dogcat.board.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.ReservationDao;

public class DogSittingReservationService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
ActionForward forward = null;
		
		String email = request.getParameter("email");
		String madd = request.getParameter("madd");
		String sdate = request.getParameter("sdate").replace("-", "").substring(2).trim();
		String edate = request.getParameter("edate").replace("-", "").substring(2).trim();
		String msg="";
		String url="";
		
		System.out.println(sdate);
		System.out.println(edate);
		
		
		try {
			ReservationDao rvd = new ReservationDao();
			

			boolean result = rvd.dsReserv(email,sdate,edate);
				
			if (result) {
					msg = "등록이 완료되었습니다 !";
					url = "index.jsp";
				} else {
					msg = "등록을 완료하지 못했습니다 !";
					url = "index.jsp";
				}
				

			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return forward;
	}

}
