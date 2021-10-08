package kr.dogcat.board.reviewservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.ReviewBoardDao;

public class ReviewBoardEditOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String rbnum = request.getParameter("rbnum");
		String cpage = request.getParameter("cp");

		String msg = "";
		String url = "";
		ActionForward forward = null;
		
		if (cpage == null || cpage.trim().equals("")) {
			cpage = "1"; // 1번째 페이지 보겠다
		}
		
		try {
			ReviewBoardDao rbd = new ReviewBoardDao();
			
			if (rbnum == null || rbnum.trim().equals("")) {
				msg = "알 수 없는 글 번호 입니다 !";
				url = "ReviewBoardList.bd?cp="+cpage;
				
			}else {
								
				int result = rbd.boardEdit(request);
				
				if (result > 0) {
					msg = "수정이 완료되었습니다 !";
					url = "ReviewBoardList.bd?cp="+cpage;
				} else {
					msg = "수정 작업을 완료하지 못했습니다 !";
					url = "ReviewBoardEdit.bd?rbnum=" + rbnum;
				}
				
			}
			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect.jsp");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return forward;
	}

}
