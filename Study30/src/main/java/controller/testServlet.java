package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class testServlet
 */
@WebServlet("/testServlet")
public class testServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public testServlet() {
        super();//부모 클래스 생성자에서 매개변수 없는거
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET방식으로 서블릿이 실행되었습니다.");
		RequestDispatcher dis=request.getRequestDispatcher("/get.jsp");//해당 jsp 파일을 읽는 이 시점에 get.jsp가 담긴다.
		request.setAttribute("data", "get 방식의 데이터");
		dis.forward(request,  response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST방식으로 서블릿이 실행되었습니다.");
		RequestDispatcher dis=request.getRequestDispatcher("/post.jsp");
		request.setAttribute("data", "post방식의 데이터");
		dis.forward(request, response);
		
	}

}
