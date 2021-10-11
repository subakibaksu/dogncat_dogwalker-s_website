package kr.dogcat.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.dao.PboardDao;

@WebServlet("/giveHeart.do")
public class giveHeart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public giveHeart() {
        super();
    }
	
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("giveHeart왔니?");
		
		String rec_email= request.getParameter("rec_email");
		int board_num= Integer.parseInt(request.getParameter("board_num"));

		HashMap<String, String> map = new HashMap<String, String>();
		String heart = "";
		String gubun = "";
		try {
			
			PrintWriter out = response.getWriter();
			
			
			PboardDao dao = new PboardDao();
			map = dao.giveHeart(board_num,rec_email);
			
			heart = map.get("heart").toString();
			gubun = map.get("gubun").toString();
			

			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		JSONArray jsonArr = new JSONArray();
//		
//    	JSONObject obj = new JSONObject();
//		obj.put("empTotal", 1);
//		obj.put("empSalAvg", 2);
//		
//		jsonArr.add(obj);
		
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=utf-8");


	    PrintWriter out = response.getWriter();
	    out.print(heart+","+gubun);
		
	}
    
		
		
		
	
    	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
