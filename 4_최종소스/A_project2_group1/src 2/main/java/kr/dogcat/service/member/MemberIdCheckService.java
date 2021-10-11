package kr.dogcat.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.MemberDao;

public class MemberIdCheckService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = null;
		String emailCheck = null;
		
		try {
			String email = request.getParameter("email");
	       	MemberDao dao = new MemberDao();
	       	emailCheck = dao.isCheckByEmail(email);
	       	
	    	request.setAttribute("message", emailCheck);
	    	
	    	System.out.println("emailcheck : " + emailCheck);
	    	
	    	forward = new ActionForward();
	    	forward.setRedirect(false);
	    	forward.setPath("/WEB-INF/views/member/uservalid.jsp"); //front 페이지 주소 확인
	    	
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}
	
}
