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
import kr.dogcat.service.pboard.PboardContentService;
import kr.dogcat.service.pboard.PboardDeleteService;
import kr.dogcat.service.pboard.PboardEditOkService;
import kr.dogcat.service.pboard.PboardEditService;
import kr.dogcat.service.pboard.PboardListService;
import kr.dogcat.service.pboard.PboardReplyDeleteService;
import kr.dogcat.service.pboard.PboardReplyService;
import kr.dogcat.service.pboard.PboardWriteService;

@WebServlet("*.pg")
public class FrontPboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FrontPboardController() {
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
	
    	Action action=null;
    	ActionForward forward=null;
    	
    	if(url_Command.equals("/PboardList.pg")) { //포토갤러리 리스트
    		action = new PboardListService();
    		forward = action.execute(request, response);
    		System.out.println("PboardListService 실행");
    		
    	}else if(url_Command.equals("/PboardWrite.pg")) { //포토갤러리 글쓰기
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/pboard/PboardWrite.jsp");
    		System.out.println("PboardWrite.pg 실행");
    		
    	}else if(url_Command.equals("/PboardWriteOk.pg")) { //포토갤러리 글쓰기
    		action = new PboardWriteService();
    		forward = action.execute(request, response);
    		System.out.println("PboardWriteService 실행");
    		
    	}else if(url_Command.equals("/PboardContent.pg")) { //포토갤러리 글 상세보기
    		action = new PboardContentService();
    		forward = action.execute(request, response);
    		System.out.println("PboardContentService 실행");
    		
    	}else if(url_Command.equals("/PboardEdit.pg")) { //포토갤러리 글 수정 뷰
    		action = new PboardEditService();
    		forward = action.execute(request, response);
    		System.out.println("PboardEditService 실행");
    		
    	}else if(url_Command.equals("/PboardEditOk.pg")) { //포토갤러리 글 수정
    		action = new PboardEditOkService();
    		forward = action.execute(request, response);
    		System.out.println("BoardEditOkService 실행");
    		
    	}else if(url_Command.equals("/PboardDelete.pg")) { //포토갤러리 글 삭제
    		action = new PboardDeleteService();
    		forward = action.execute(request, response);
    		System.out.println("PboardDeleteService 실행");
    		
    	}else if(url_Command.equals("/PboardReply.pg")) { //리뷰 작성
    		action = new PboardReplyService();
    		forward = action.execute(request, response);
    		System.out.println("PboardReplyService 실행");
    		
    	}else if(url_Command.equals("/PboardReplyDelete.pg")) { //리뷰 삭제
    		action = new PboardReplyDeleteService();
    		forward = action.execute(request, response);
    		System.out.println("PboardReplyDeleteService 실행");
    		
    	}
    	       	
    	
    	
    	if(forward != null) {
    		if(forward.isRedirect()) { //true 
    			response.sendRedirect(forward.getPath());
    		}else { //false (모든 자원 ) 사용
    			//UI
    			//UI + 로직
    			//forward url 주소 변환 없어 View 내용을 받을 수 있다
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
