package kr.dogcat.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.dao.PboardDao;

//@WebServlet("/Replydelete")
public class ReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ReplyDelete() {
        super();
    }
	
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("delete왔니?");

    	String pbnum_fk = request.getParameter("pbnum_fk");
		String memonum = request.getParameter("memonum");
		System.out.println(pbnum_fk);
		System.out.println(memonum);
    	
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
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
