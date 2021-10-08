package kr.dogcat.board.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.ManagerBoardDao;

public class AllCountingListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;

		try {
			ManagerBoardDao mbd = new ManagerBoardDao();

			List<Integer> chartlist = mbd.chartlist();
			
			request.setAttribute("list", chartlist);
			
			forward = new ActionForward();
			forward.setRedirect(false); // forward
			forward.setPath("/WEB-INF/views/admin/chartapi.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}
	

}
