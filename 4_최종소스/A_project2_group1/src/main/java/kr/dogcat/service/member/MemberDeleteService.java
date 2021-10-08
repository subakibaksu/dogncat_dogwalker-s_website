package kr.dogcat.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.MemberDao;

public class MemberDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		String email = request.getParameter("email");
				
    	MemberDao dao = new MemberDao(); //POINT
    	int result = dao.deleteMember(email);
    	
		 	String msg="";
		 	String url="";
		    if(result > 0){
		    	msg ="삭제되었습니다";
		    	url ="Memberlist.me";
		    }else{
		    	msg="삭제 실패";
		    	url="Memberlist.me";
		    }
		    
		    request.setAttribute("board_msg",msg);
		    request.setAttribute("board_url", url);
		
		    ActionForward forward = new ActionForward();
		    forward.setRedirect(false);
		    forward.setPath("/WEB-INF/views/redirect.jsp");
		    
		return forward;
	}
}
