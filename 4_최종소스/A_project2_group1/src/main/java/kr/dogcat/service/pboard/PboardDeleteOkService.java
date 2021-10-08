package kr.dogcat.service.pboard;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.PboardDao;
import kr.dogcat.dto.Member;
import kr.dogcat.dto.Pboard;

public class PboardDeleteOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		//로그인한 멤버 객체 불러오기
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		String useremail = m.getEmail();
		
		//글번호 받기
		String phnum= request.getParameter("phnum"); 
		
		ActionForward forward = null;
		
		try {
			PboardDao dao = new PboardDao();
			int result = dao.deleteOk(phnum);

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
