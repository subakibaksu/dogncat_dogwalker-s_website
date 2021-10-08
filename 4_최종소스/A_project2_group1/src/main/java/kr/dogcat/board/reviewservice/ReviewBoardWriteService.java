package kr.dogcat.board.reviewservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.ReviewBoardDao;
import kr.dogcat.dto.ReviewBoard;

public class ReviewBoardWriteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {


		String email = request.getParameter("email");
		String rbsubj = request.getParameter("rbsubj");
		String rbcont = request.getParameter("rbcont");
		int point = Integer.parseInt(request.getParameter("point"));
		String msg = "";
		String url = "";

		int result = 0;

		ReviewBoard board = new ReviewBoard();

		board.setEmail(email);
		board.setRbsubj(rbsubj);
		board.setRbcont(rbcont);
		board.setPoint(point);

		try {

			ReviewBoardDao rbd = new ReviewBoardDao();
			result = rbd.writeok(board);

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			msg = "후기가 등록되었습니다 !";
			url = "ReviewBoardList.bd";
		} else {
			msg = "등록 될 수 없는 후기입니다 !";
			url = "ReviewBoardWrite.bd";
		}

		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", url);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");

		return forward;

	}

}
