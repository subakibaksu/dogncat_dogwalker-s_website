package kr.dogcat.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.MemberDao;
import kr.dogcat.dto.Member;

public class MemberJoinService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String email = request.getParameter("email"); 
		String mnic = request.getParameter("mnic"); 
		String mname = request.getParameter("mname"); 
		String mpwd = request.getParameter("mpwd"); 
		String madd1 = request.getParameter("madd1");  
		String madd2 = request.getParameter("madd2"); 
		String madd3 = request.getParameter("madd3");
		String mphone = request.getParameter("mphone"); 
    	String madd = madd1 + " " + madd2 + " " + madd3;
    	//memo m = new memo();  //권장사항
    	//m.setId(id);
    	
		Member m = new Member();
		m.setEmail(email);
		m.setMnic(mnic);
		m.setMname(mname);
		m.setMpwd(mpwd);
		m.setMadd(madd);
		m.setMphone(mphone);
		
    	MemberDao dao = new MemberDao(); //POINT
		int result = dao.insertMember(m);
		
		//mcount 테이블 insert
		dao.insertMcount(email);
    	
		 	String msg="";
		 	String url="";
		    if(result > 0){
		    	msg ="가입성공";
		    	url ="index.jsp";
		    }else{
		    	msg="가입실패";
		    	url="index.jsp";
		    }
		    
		    request.setAttribute("board_msg",msg);
		    request.setAttribute("board_url", url);
		
		    ActionForward forward = new ActionForward();
		    forward.setRedirect(false);
		    forward.setPath("/WEB-INF/views/redirect.jsp");
		    
		return forward;
	}

}






