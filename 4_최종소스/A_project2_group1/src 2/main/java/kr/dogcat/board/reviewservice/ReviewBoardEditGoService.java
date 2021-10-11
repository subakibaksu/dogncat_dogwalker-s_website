package kr.dogcat.board.reviewservice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.ReviewBoardDao;
import kr.dogcat.dto.ReviewBoard;

public class ReviewBoardEditGoService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		String rbnum = request.getParameter("rbnum");
		String cpage = request.getParameter("cp");

		String msg = "";
		String url = "";
		
		if (cpage == null || cpage.trim().equals("")) {
			cpage = "1"; // 1번째 페이지 보겠다
		}

		ReviewBoardDao rbd = new ReviewBoardDao();
		ActionForward forward = null;

		if (rbnum == null || rbnum.trim().equals("")) {
			try {
				response.sendRedirect("ReviewBoardList.bd");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}

		try {

			ReviewBoard board = rbd.getEditContent(rbnum);

			if (board == null) {

				msg = "데이터 오류";
				url = "ReviewBoardList.bd";

				request.setAttribute("board_msg", msg);
				request.setAttribute("board_url", url);

				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/WEB-INF/views/redirect.jsp");

			} else {

				request.setAttribute("cpage", cpage);
				request.setAttribute("rbnum", rbnum);
				request.setAttribute("board", board);

				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/WEB-INF/views/rboard/reviewupdate.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return forward;
	}

}
