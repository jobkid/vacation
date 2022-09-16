package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
//클래스 파일만 import 대상이 된다.
/**
 * Servlet implementation class Sample
 */
@WebServlet("/a.do")
public class Sample extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Sample() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis=request.getRequestDispatcher("/test.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
