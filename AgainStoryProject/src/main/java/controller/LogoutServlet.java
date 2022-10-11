package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/Logout.do")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		session.invalidate();//세션 내용을 만료
		System.out.println("세션 내용 만료 : "+id);
		RequestDispatcher dis = null;
		if(id==null) {
			dis = request.getRequestDispatcher("logout.jsp");
			dis.forward(request, response);
		}else {
			dis = request.getRequestDispatcher("deleteMember.jsp");
			dis.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
