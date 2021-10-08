package kr.dogcat.board.reviewservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.ReviewBoardDao;
import kr.dogcat.dto.ReviewBoard;

public class ReviewBoardRewriteOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String cpage = request.getParameter("cp");
		String strrbnum = request.getParameter("rbnum").trim();		
		String rbsubj = request.getParameter("rbsubj");
		String rbcont = request.getParameter("rbcont");
		String point = request.getParameter("point");
		String msg="";
	    String url="";
		
				
		try {
			int rbnum = Integer.parseInt(strrbnum);
			
			ReviewBoard board = new ReviewBoard();
			
			board.setRbnum(rbnum);
			board.setRbsubj(rbsubj);
			board.setRbcont(rbcont);
			board.setPoint(Integer.parseInt(point));

			ReviewBoardDao rbd = new ReviewBoardDao();
			
			int result = rbd.reWriteOk(board);

		    if(result > 0){
		    	msg ="답글 달기 성공";
		    	url ="ReviewBoardList.bd?cp="+cpage;
		    }else{
		    	msg ="답글 달기 실패 !";
		    	url ="ReviewBoardList.bd?cp="+cpage;
		    }
		    
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("board_msg",msg);
		request.setAttribute("board_url", url);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");
		
		return forward;
	}

}
