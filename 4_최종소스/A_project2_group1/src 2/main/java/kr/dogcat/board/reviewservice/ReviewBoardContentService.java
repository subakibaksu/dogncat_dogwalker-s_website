package kr.dogcat.board.reviewservice;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.ReviewBoardDao;

public class ReviewBoardContentService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;

		String rbnum = request.getParameter("rbnum"); // 글번호

		String cont;

		try {
			
			ReviewBoardDao rbd = new ReviewBoardDao();
			
			// 글 번호를 가지고 오지 않았을 경우 예외처리
			if (rbnum == null || rbnum.trim().equals("")) {
				response.sendRedirect("ReviewBoardList.bd");
				return null;
			}
			
			rbnum = rbnum.trim();

			cont = rbd.getContent(Integer.parseInt(rbnum));
			
			request.setAttribute("message", cont);
			
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
