package SERVLET;

import javax.servlet.annotation.WebServlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet.do")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//서식 유효성 검증을 구현할 메서드
	private boolean validateDate(String date) {
		boolean result=true;
		if(date!=null) {
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			try {
				format.parse(date);
				System.out.println("포맷변환 성공");
			}catch(Exception e) {
				System.out.println("포맷변환 오류 : "+e);
				result = false;
			}
		}
		return result;
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet이 실행되었습니다.");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");//한글로
		response.setContentType("text/xml; charset = utf-8");//파일 안에 한글이라고 적혀있는거...그래서 UTF-8 다시 적은 것.
															//printwriter보다 먼저 써야 함.
		
		boolean passed=validateDate(request.getParameter("birthDate"));
		PrintWriter out = response.getWriter();//response로 해야 화면이 보여준다. 화면 전체가 아닌 부분만 때주는 것.
		
		String message = "잘못된 정보를 입력하셨습니다.";
		if(passed) {
			message = "올바른 정보를 입력하셨습니다.";
		}
		out.println("<response>");
		out.println("<passed>"+Boolean.toString(passed)+"</passed>");//오류방지를 위해 String 변환
		out.println("<message>"+message+"</message>");
		out.println("</response>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터가 POST로 넘어오지 않을 것이기 때문에 사용안함.
	}

}
