package kr.dogcat.service.pboard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.PboardDao;
import kr.dogcat.dto.Member;
import kr.dogcat.dto.Memo;
import kr.dogcat.dto.Pboard;

public class PboardContentService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		//글번호 받기
		String pbnum= request.getParameter("pbnum"); 
		
		ActionForward forward = null;
		
		try {
			
			//글 번호를 가지고 오지 않았을 경우 예외처리
			if(pbnum == null || pbnum.trim().equals("")){
				response.sendRedirect("PboardList.pg");
			}
			
			pbnum = pbnum.trim();
			//board_content.jsp?pbnum=19&cp=1&ps=9  //다시 목록으로 돌아가도 현재 page 유지
			String cpage = request.getParameter("cp"); //current page
			String pagesize = request.getParameter("ps"); //pagesize
			
			//List 페이지 처음 호출
			if(cpage == null || cpage.trim().equals("")){
				//default 값 설정
				cpage = "1"; 
			}
		
			if(pagesize == null || pagesize.trim().equals("")){
				//default 값 설정
				pagesize = "9"; 
			}
			
			PboardDao dao = new PboardDao();
			
			//데이터 조회 (1건 (row))
			Pboard pboard = dao.getContent(Integer.parseInt(pbnum));
			System.out.println(pboard);
			System.out.println("닉네임22 : " + pboard.getMnic());
			System.out.println("제목 : " + pboard.getPbsubj());
			
			request.setAttribute("cpage", cpage);
			request.setAttribute("pagesize", pagesize);
			request.setAttribute("pbnum", pbnum);
			request.setAttribute("pboard", pboard);
			
			System.out.println("pbnum : " + pbnum);

			
			List<Memo> replylist = dao.replylist(pbnum);
			System.out.println(replylist);			
			request.setAttribute("replylist", replylist);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/pboard/PboardContent.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
