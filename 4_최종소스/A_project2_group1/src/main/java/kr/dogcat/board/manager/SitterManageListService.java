package kr.dogcat.board.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.ManagerBoardDao;
import kr.dogcat.dto.Emp;

public class SitterManageListService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		int acode = Integer.parseInt(request.getParameter("acode"));
		try {
			ManagerBoardDao mbd = new ManagerBoardDao();

			List<Emp> list = mbd.slist(acode);

			request.setAttribute("list", list);

			forward = new ActionForward();
			forward.setRedirect(false); // forward
			forward.setPath("/WEB-INF/views/admin/MapAPI.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return forward;
		
	}

}
