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
import kr.dogcat.service.member.MemberDeleteService;
import kr.dogcat.service.member.MemberIdCheckService;
import kr.dogcat.service.member.MemberJoinService;
import kr.dogcat.service.member.MemberLoginService;
import kr.dogcat.service.member.MemberNickCheckService;

@WebServlet("*.me")
public class FrontMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FrontMemberController() {
        super();
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
	
    	Action action=null;
    	ActionForward forward=null;
    	
    	if(url_Command.equals("/JoinOK.me")) { //회원가입
    		action = new MemberJoinService();
    		forward = action.execute(request, response);
    		System.out.println("MemberJoinService 실행");
    		
    	}else if(url_Command.equals("/LoginIdCheck.me")) { //비동기(ID 사용 유무)
    		action = new MemberIdCheckService();
    		forward = action.execute(request, response);
    		System.out.println("MemberIdCheckService 실행");
    		
    	}else if(url_Command.equals("/LoginNickCheck.me")) { //비동기(NickName 사용 유무)
    		action = new MemberNickCheckService();
    		forward = action.execute(request, response);
    		System.out.println("MemberNickCheckService 실행");
    	
    	}else if(url_Command.equals("/LoginOK.me")) { //로그인
    		action = new MemberLoginService();
    		forward = action.execute(request, response);
    		System.out.println("MemberLoginService 실행");
    		
    	}else if(url_Command.equals("/LogoutOK.me")) { //로그아웃
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/logout.jsp");
    		
    	}else if(url_Command.equals("/MemberDelete.me")) { //회원 삭제
    		//UI+로직
    		action = new MemberDeleteService();
    		forward = action.execute(request, response);
    		System.out.println("MemberDeleteService 실행");
    	
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
