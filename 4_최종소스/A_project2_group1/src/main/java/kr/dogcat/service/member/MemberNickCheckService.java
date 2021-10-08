package kr.dogcat.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.MemberDao;

public class MemberNickCheckService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		String nickCheck = null;
		
		try {
			String mnic = request.getParameter("mnic");
	       	MemberDao dao = new MemberDao();
	       	nickCheck = dao.isCheckByNick(mnic);
	       	
	    	request.setAttribute("message", nickCheck);
	    	
	    	forward = new ActionForward();
	    	forward.setRedirect(false);
	    	forward.setPath("/WEB-INF/views/member/uservalid.jsp"); //front 페이지 주소 확인
	    	
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return forward;
	}

}

