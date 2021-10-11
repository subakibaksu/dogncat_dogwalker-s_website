package kr.dogcat.service.pboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.PboardDao;
import kr.dogcat.dto.Member;

public class PboardDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setContentType("text/html; charset=UTF-8");

		//로그인한 멤버 객체 불러오기
		HttpSession session = request.getSession();
		session.getAttribute("loginUser");
		
		//글번호 받기
		String pbnum= request.getParameter("pbnum"); 
		
		ActionForward forward = null;
		
		try {
			//글 번호를 가지고 오지 않았을 경우 예외처리
			if(pbnum == null || pbnum.trim().equals("")){
				System.out.println("글번호 입력 오류");
				response.sendRedirect("PboardList.pg");
			}
			
			PboardDao dao = new PboardDao();
			int result = dao.deleteOk(pbnum);

			String msg="";
			String url="";
			
			if(result > 0){
				msg="삭제되었습니다.";
				url="PboardList.pg";
			}else{
				msg="삭제 실패";
				url="PboardList.pg";
			}
	        
			request.setAttribute("board_msg",msg);
			request.setAttribute("board_url",url);
	        
	        forward = new ActionForward();
	        forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect.jsp");

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
