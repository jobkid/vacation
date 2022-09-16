package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;//서블릿 역할을 해줌.
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JQAX
 */
@WebServlet("/JQAX")
public class JQAX extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 실행");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write("JQAX의 response값");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost실행");
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String race = request.getParameter("race");
		System.out.println("전송받은 데이터 확인 : "+name+", "+race);
		response.setCharacterEncoding("utf-8");//응답 받은 데이터에 utf-8처리
		response.getWriter().write("포스트방식으로 실행확인");
	}

}
