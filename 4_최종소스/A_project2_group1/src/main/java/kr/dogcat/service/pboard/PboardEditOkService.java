package kr.dogcat.service.pboard;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.PboardDao;
import kr.dogcat.dto.Member;
import kr.dogcat.dto.Pboard;

public class PboardEditOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		//로그인한 멤버 객체 불러오기
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		String useremail = m.getEmail();
		
		//글번호 받기
		String pbnum= request.getParameter("pbnum"); 
		
		//첨부파일 <file>
		String uploadpath = request.getSession().getServletContext().getRealPath("upload");
		int size = 1024*1024*10; //10M 네이버 계산기
		
		ActionForward forward = null;
		
		try {
			//글 번호를 가지고 오지 않았을 경우 예외처리
			if(pbnum == null || pbnum.trim().equals("")){
				System.out.println("글번호 입력 오류");
				response.sendRedirect("PboardList.pg");
			}
			
			MultipartRequest multi = new MultipartRequest(
					request, //기존에 있는  request 객체의 주소값 
					uploadpath, //실 저장 경로 (배포경로)
					size, //10M
					"UTF-8",
					new DefaultFileRenamePolicy() //파일 중복(upload 폴더 안에:a.jpg -> a_1.jpg(업로드 파일 변경) )
					);
			PrintWriter out = response.getWriter();
			
			String email = multi.getParameter("email");
			String pbsubj = multi.getParameter("pbsubj");
			String pbcont = multi.getParameter("pbcont");
			
			//첨부파일 <file>
			Enumeration filenames = multi.getFileNames();
			String file = (String)filenames.nextElement();
			String pfilename = multi.getFilesystemName(file);
	
			if(pfilename == null) {
			   pfilename = "";
			}
			
			Pboard pboard = new Pboard();
			pboard.setPbnum(Integer.parseInt(pbnum));
			pboard.setEmail(email);
			pboard.setPbsubj(pbsubj);
			pboard.setPbcont(pbcont);
			pboard.setPfilename(pfilename);
			
			PboardDao dao = new PboardDao();
	    	int result = dao.pboardEdit(pboard);

	    	String msg = "";
			String url = "";
			
	        if(result > 0){
	        	msg ="수정하였습니다.";
	        	url ="PboardList.pg";
	        }else{
	        	msg="수정 실패";
	        	url="PboardEdit.pg?pbnum=" + pbnum;
	        }
	        
	        request.setAttribute("board_msg", msg);
	        request.setAttribute("board_url", url);
	        
	        forward = new ActionForward();
	        forward.setRedirect(false);
	        forward.setPath("/WEB-INF/views/redirect.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
