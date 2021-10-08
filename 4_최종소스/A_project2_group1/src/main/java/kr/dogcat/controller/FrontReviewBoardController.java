package kr.dogcat.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.board.reviewservice.ReviewBoardContentService;
import kr.dogcat.board.reviewservice.ReviewBoardDeleteService;
import kr.dogcat.board.reviewservice.ReviewBoardEditGoService;
import kr.dogcat.board.reviewservice.ReviewBoardEditOkService;
import kr.dogcat.board.reviewservice.ReviewBoardListService;
import kr.dogcat.board.reviewservice.ReviewBoardRewriteGoService;
import kr.dogcat.board.reviewservice.ReviewBoardRewriteOkService;
import kr.dogcat.board.reviewservice.ReviewBoardWriteService;
import kr.dogcat.dto.Member;


@WebServlet("*.bd")
public class FrontReviewBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontReviewBoardController() {
        super();

    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
	
    	Action action=null;
    	ActionForward forward=null;
    	
    	if(url_Command.equals("/ReviewBoardList.bd")) { // 리뷰 게시판 보기 -- 연결완료
    		action = new ReviewBoardListService();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/ReviewBoardWrite.bd")) { // 리뷰 남기기 (view) -- 연결완료
    		forward = new ActionForward();
    		
    		HttpSession session = request.getSession();
			Member m = (Member)session.getAttribute("loginUser");
			System.out.println(m);
    		
    		if(m==null) {
    			
    			String msg="로그인이 필요합니다 !";
    			String url="login.jsp";
    		    
    			request.setAttribute("board_msg", msg);
    			request.setAttribute("board_url", url);
    			
    			forward = new ActionForward();
    			forward.setRedirect(false);
    			forward.setPath("/WEB-INF/views/redirect.jsp");
    			
    		}else {
    		
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/rboard/reviewupload.jsp");
    		
    		}
    		
    	}else if(url_Command.equals("/ReviewBoardWriteOK.bd")) { // 리뷰 남기기 (DB) -- 연결완료
    		action = new ReviewBoardWriteService();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/ReviewBoardContent.bd")) { // 리뷰 내용 보기 -- 연결완료
    		action = new ReviewBoardContentService();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/ReviewBoardEdit.bd")) { // 리뷰 수정하기 (수정 창) -- 연결완료
    		action = new ReviewBoardEditGoService();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/ReviewBoardEditOk.bd")) { // 리뷰 수정하기 (DB) -- 연결완료
    		action = new ReviewBoardEditOkService();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/ReviewBoardDelete.bd")) { // 리뷰 삭제하기 -- 연결완료
    		action = new ReviewBoardDeleteService();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/ReviewBoardRewrite.bd")) { // 관리자 - 답글쓰기 (답글 창) -- 연결완료
    		action = new ReviewBoardRewriteGoService();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/ReviewBoardRewriteOk.bd")) { // 관리자 - 답글쓰기 (DB) -- 연결완료
    		action = new ReviewBoardRewriteOkService();
    		forward = action.execute(request, response);
    		
//    	}else if(url_Command.equals("/ReviewBoardSearch.bd")) { // 후기 검색하기 -- 예정
//    		action = new ReviewBoardSearchService();
//    		forward = action.execute(request, response);

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
