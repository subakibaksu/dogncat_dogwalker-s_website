package kr.dogcat.board.reviewservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;

public class ReviewBoardRewriteGoService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String rbnum = request.getParameter("rbnum");
		String cp = request.getParameter("cp");
		
		ActionForward forward = new ActionForward();

		try {
			if (rbnum == null ||  rbnum.trim().equals("") ) {
				response.sendRedirect("ReviewBoardList.bd");
				return null;
			}
			if (cp == null) {
				cp = "1";
			}
		
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		request.setAttribute("rbnum", rbnum);
		request.setAttribute("cp", cp);
		

		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/rboard/reviewrewrite.jsp");
		
		
		
		return forward;
	}

}
