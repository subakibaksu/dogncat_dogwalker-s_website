package kr.dogcat.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.board.manager.AllCountingListService;
import kr.dogcat.board.manager.MemberManageDeleteService;
import kr.dogcat.board.manager.MemberManageListService;
import kr.dogcat.board.manager.MemberManageSearchService;
import kr.dogcat.board.manager.ReserveVisitingCommitService;
import kr.dogcat.board.manager.ReserveVisitingListService;
import kr.dogcat.board.manager.ReserveVisitingSearchService;
import kr.dogcat.board.manager.ReserveWalkingCommitService;
import kr.dogcat.board.manager.ReserveWalkingListService;
import kr.dogcat.board.manager.ReserveWalkingSearchService;
import kr.dogcat.board.manager.SitterManageListService;


@WebServlet("*.mb")
public class FrontManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public FrontManagerController() {
        super();

    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
	
    	Action action=null;
    	ActionForward forward=null;
    	
    	if(url_Command.equals("/ReserveWalkingList.mb")) { // 산책 예약 게시판 보기 -- 연결완료
    		action = new ReserveWalkingListService();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/ReserveWalkingSearch.mb")) { // 산책 예약 검색 -- 연결완료
    		action = new ReserveWalkingSearchService();
    		forward = action.execute(request, response);
    			
    	}else if(url_Command.equals("/ReserveWalkingCommit.mb")) { // 산책 예약 변경 -- 연결완료
    		action = new ReserveWalkingCommitService();
    		forward = action.execute(request, response);

    	/////////////////////////////////////////////////////////////////////////
    		
    	}else if(url_Command.equals("/ReserveVisitingList.mb")) { // 방문 예약 게시판 보기 -- 연결완료
    		action = new ReserveVisitingListService();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/ReserveVisitingSearch.mb")) { // 방문 예약 검색 -- 연결완료
    		action = new ReserveVisitingSearchService();
    		forward = action.execute(request, response);

    	}else if(url_Command.equals("/ReserveVisitingCommit.mb")) { // 방문 예약 변경 -- 연결완료
    		action = new ReserveVisitingCommitService();
    		forward = action.execute(request, response);
    		
    	//////////////////////////////////////////////////////////////////////////
    		
    	}else if(url_Command.equals("/MemberManageList.mb")) { // 회원 관리 목록 -- 연결완료
    		action = new MemberManageListService();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/MemberManageDelete.mb")) { // 회원 목록 삭제 -- 연결완료
    		action = new MemberManageDeleteService();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/MemberManageSearch.mb")) { // 회원 id(email), 이름으로 검색 -- 연결완료
    		action = new MemberManageSearchService();
    		forward = action.execute(request, response);

    	}else if(url_Command.equals("/SitterManageList.mb")) { // 시터 목록 조회
    		action = new SitterManageListService();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/AllCountingList.mb")) { // 내부 통계용 -- 연결완료
    		action = new AllCountingListService();
    		forward = action.execute(request, response);
    	}
    	
    	//-------위 : 클라이언트요청 -> 컨트롤러 -> 서비스 -----------아래 : 서비스 -> 컨트롤러 -> view
    	
    	if(forward != null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		}else { 
    			RequestDispatcher dis  = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}
    	
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
