package kr.dogcat.board.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.ManagerBoardDao;

public class ReserveWalkingCommitService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = null;
		
		String rnumss = request.getParameter("rnum");
		int rstatuscode = Integer.parseInt(request.getParameter("rstatuscode"));
		String msg="";
		String url="";
		
		System.out.println(rnumss);
		System.out.println(rstatuscode);
		
		try {
			ManagerBoardDao mbd = new ManagerBoardDao();
			
			if (rnumss == null || rnumss.trim().equals("")) {
				msg = "알 수 없는 글 번호 입니다 !";
				url = "ReserveWalkingList.mb";
				
			}else {
				
				int rnum = Integer.parseInt(rnumss);
				int result = mbd.wcommmit(rnum,rstatuscode);
				
				if (result > 0) {
					msg = "수정이 완료되었습니다 !";
					url = "ReserveWalkingList.mb";
				} else {
					msg = "수정 작업을 완료하지 못했습니다 !";
					url = "ReserveWalkingList.mb";
				}
				
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
