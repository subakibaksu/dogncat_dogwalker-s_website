package kr.dogcat.service.pboard;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.PboardDao;
import kr.dogcat.dto.Member;
import kr.dogcat.dto.Pboard;
import kr.dogcat.utils.ThePager;

public class PboardListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		//로그인한 멤버 객체 불러오기
		HttpSession session = request.getSession();
		String useremail ="";
		if(session.getAttribute("loginUser") != null) {
			Member m = (Member)session.getAttribute("loginUser");
			useremail = m.getEmail();
		}

		response.setContentType("text/html; charset=UTF-8");
		
		ActionForward forward = null;

		
		try {
			String ps = request.getParameter("ps"); //pagesize
			String cp = request.getParameter("cp"); //current page
			String keyword = request.getParameter("keyword"); //검색어
			
			PboardDao dao = new PboardDao();
			int totalboardcount = dao.totalBoardCount(keyword);
			
			//List 페이지 처음 호출 ...
			if(ps == null || ps.trim().equals("")){
				//default 값 설정
				ps = "9"; //9개씩 
			}
		
			if(cp == null || cp.trim().equals("")){
				//default 값 설정
				cp = "1"; // 1번째 페이지 보겠다 
			}
			
			int pagesize = Integer.parseInt(ps);
			int cpage = Integer.parseInt(cp);
			int pagecount = 0;
			
			//23건  % 9 = 총 3페이지
			if(totalboardcount % pagesize == 0){
				pagecount = totalboardcount / pagesize;
			}else{
				pagecount = (totalboardcount / pagesize) + 1; 
			}
			
			//전체 목록 가져오기
			List<Pboard> list = dao.lists(useremail,keyword,cpage, pagesize);
			
			PrintWriter out = response.getWriter();
			
			if(list == null || list.size() == 0){
     			out.print("<tr><td colspan='5'>데이터가 없습니다</td></tr>");
     		}
			
			int pagersize = 3; //[1]
			ThePager pager = new ThePager(totalboardcount,cpage,pagesize,pagersize,"PboardList.pg");
			
			request.setAttribute("pagesize", pagesize);
			request.setAttribute("cpage", cpage);
			request.setAttribute("pagecount", pagecount);
			request.setAttribute("list", list);
			request.setAttribute("totalboardcount", totalboardcount);
			request.setAttribute("pager", pager);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/pboard/PboardList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return forward;
	}

}
