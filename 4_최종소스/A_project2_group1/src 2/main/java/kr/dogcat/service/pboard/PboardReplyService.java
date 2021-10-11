package kr.dogcat.service.pboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.naming.NamingException;
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

public class PboardReplyService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		//로그인한 멤버 객체 불러오기
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		String useremail = m.getEmail();
		
		//데이터 받기
		String email = request.getParameter("email");
		String mmcont = request.getParameter("mmcont");
		String pbnum_fk = request.getParameter("pbnum");
		System.out.println("reply: pbnum_fk : " + pbnum_fk);
    	
    	ActionForward forward = null;
    	
    	try {
			PboardDao dao = new PboardDao();
			int result = dao.replywrite(Integer.parseInt(pbnum_fk), email, mmcont);
			
			//처리하는 코드
			String msg = "";
			String url = "";
			
			if(result > 0){
				msg = "댓글 입력 성공";
				url = "PboardContent.pg?pbnum="+pbnum_fk;
			}else{
				msg = "댓글 입력 실패";
				url = "cPboardContent.pg?pbnum="+pbnum_fk;
			}
			
			request.setAttribute("board_msg",msg);
			request.setAttribute("board_url", url);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	    return forward;
	}

}
