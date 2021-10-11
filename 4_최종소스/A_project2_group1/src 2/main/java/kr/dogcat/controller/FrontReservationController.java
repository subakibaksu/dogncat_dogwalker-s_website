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
import kr.dogcat.board.reservation.AddressCheckService;
import kr.dogcat.board.reservation.CatSittingReservationService;
import kr.dogcat.board.reservation.DogSittingReservationService;
import kr.dogcat.board.reservation.DogWalkingReservationService;



@WebServlet("*.rc")
public class FrontReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public FrontReservationController() {
        super();

    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
	
    	Action action=null;
    	ActionForward forward=null;
    	
    	if(url_Command.equals("/AddressCheck.rc")) { // 주소 찾기
    		action = new AddressCheckService();
    		forward = action.execute(request, response);
    		
       //////////////////////////////////////////////////////////////////////////
    		
    	}else if(url_Command.equals("/CatSittingReservation.rc")) { // 고양이 돌보기 예약
    		action = new CatSittingReservationService();
    		forward = action.execute(request, response);

    	}else if(url_Command.equals("/DogSittingReservation.rc")) { // 강아지 돌보기 예약
    		action = new DogSittingReservationService();
    		forward = action.execute(request, response);
    	
    	}else if(url_Command.equals("/DogWalkingReservation.rc")) { // 강아지 산책 예약
    		action = new DogWalkingReservationService();
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
