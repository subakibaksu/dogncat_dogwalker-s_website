package kr.dogcat.board.reviewservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.ReviewBoardDao;

public class ReviewBoardDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		int rbnum = Integer.parseInt(request.getParameter("rbnum"));
		String cpage = request.getParameter("cp"); // 현재 페이지
		
		if (cpage == null || cpage.trim().equals("")) {
			cpage = "1"; // 1번째 페이지 보겠다
		}
		
		ActionForward forward = new ActionForward();
		
		String msg="";
		String url="";
		
		ReviewBoardDao rbd = new ReviewBoardDao();
		try {
			
			int result = rbd.deleteOk(rbnum);
			
			if(result > 0){
				msg="삭제 성공 !";
				url="ReviewBoardList.bd?cp="+cpage;
			}else{
				msg="삭제 실패 !";
				url="ReviewBoardList.bd?cp="+cpage;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("board_msg",msg);
		request.setAttribute("board_url",url);
		
		

		forward.setRedirect(false); // forward
		forward.setPath("/WEB-INF/views/redirect.jsp");

		return forward;
		
	}

}
