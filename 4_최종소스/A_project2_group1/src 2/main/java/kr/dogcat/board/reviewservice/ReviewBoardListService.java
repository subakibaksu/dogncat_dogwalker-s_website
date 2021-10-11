package kr.dogcat.board.reviewservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.ReviewBoardDao;
import kr.dogcat.dto.ReviewBoard;
import kr.dogcat.utils.ThePager;

public class ReviewBoardListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = null;
		
		try {
			ReviewBoardDao rbd = new ReviewBoardDao();

			// 게시물 총 건수
			int totalboardcount = rbd.totalBoardCount();
			
			// 상세보기 >> 다시 LIST 넘어올때 >> 현재 페이지 설정
			String ps = request.getParameter("ps"); // pagesize 조회 개수
			String cp = request.getParameter("cp"); // current page 현재페이지

			// List 페이지 처음 호출할 때의 default 값 설정
			if (ps == null || ps.trim().equals("")) {
				ps = "10"; // 10개씩
			}

			if (cp == null || cp.trim().equals("")) {
				cp = "1"; // 1번째 페이지 보겠다
			}

			// ps와 cp 정수화 >> 페이지 계산하기 위해 정수화
			int pagesize = Integer.parseInt(ps); // 한 페이지에 조회 건수
			int cpage = Integer.parseInt(cp); // 현재 페이지
			int pagecount = 0; // 총 페이지 : 0으로 초기화

			// 전체 페이지 결정 하기
			if (totalboardcount % pagesize == 0) { // ex) 120개 % 5개 = 24
				pagecount = totalboardcount / pagesize; 
			} else {
				pagecount = (totalboardcount / pagesize) + 1; // +1 은 나머지를 처리 하기 위한 페이지
			}
			
			//-----------------위까지 페이징 작업------------------

			// 102건 : pagesize=5 >> pagecount=21페이지

			
			// 전체 목록 가져오기
			List<ReviewBoard> list = rbd.list(cpage, pagesize); // list >> 1 , 20
    		
			int pagersize = 10; // 페이저블락의 개수 [1][2][3]....[9][10]
			ThePager pager = new ThePager(totalboardcount,cpage,pagesize,pagersize,"ReviewBoardList.bd");
			// 페이징 라인 주소 받아서 보내줌
			
			request.setAttribute("pagesize", pagesize);
			request.setAttribute("cpage", cpage);
			request.setAttribute("pagecount", pagecount);
			request.setAttribute("list", list);
			request.setAttribute("totalboardcount", totalboardcount);
			request.setAttribute("pager", pager);

			forward = new ActionForward();
			forward.setRedirect(false); // forward
			forward.setPath("/WEB-INF/views/rboard/reviewboard.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;		

	}

}
