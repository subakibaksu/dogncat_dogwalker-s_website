package kr.dogcat.service.pboard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.PboardDao;
import kr.dogcat.dto.Member;

public class PboardReplyDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		//로그인한 멤버 객체 불러오기
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		String useremail = m.getEmail();
		
		response.setContentType("text/html; charset=UTF-8");
		
		//데이터 받기
		String replyemail = request.getParameter("replyemail");//댓글의 id(이메일)
		String memonum = request.getParameter("memonum");//댓글의 순번(PK)
		String pbnum_fk=request.getParameter("pbnum");//댓글의 원본 게시글 번호
		System.out.println(memonum);
		System.out.println(pbnum_fk);
    	
    	ActionForward forward = null;
    	
		String msg = "";
		String url = "";
    	
    	try {

			PrintWriter out = response.getWriter();
			
			if(pbnum_fk == null || memonum == null || memonum.trim().equals("")){
				out.print("<script>");
					out.print("alert('글번호가 넘어오지 않았습니다');");
					out.print("history.back();");
				out.print("</script>");
			}
			
			PboardDao dao = new PboardDao();
			int result = dao.replyDelete(memonum);

			// 처리하는 코드
			if (result > 0) {
				msg = "댓글 삭제 성공";
				url = "PboardContent.pg?pbnum=" + pbnum_fk;
			} else {
				msg = "댓글 삭제 실패";
				url = "PboardContent.pg?pbnum=" + pbnum_fk;
			}

			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect.jsp");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return forward;
	}

}
