package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.MemberDAO;
import beans.MemberBean;
import controller.LogoutServlet;

/**
 * Servlet implementation class DeleteMember
 */
@WebServlet("/DeleteMember.do")
public class DeleteMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("deletemember.do ����");
		int num = Integer.parseInt(request.getParameter("nice"));
		MemberBean member = new MemberBean();
		MemberDAO mDAO = MemberDAO.getInstance();
		mDAO.deleteMember(num);
		//request.setAttribute("delete", mDAO);
		//response.sendRedirect("deleteMember.jsp");
		System.out.println("���� �Ϸ�");
		response.sendRedirect("deleteProcessing.jsp");
		
		//HttpSession session = request.getSession();
		//session.invalidate();���� ������ ����
		//RequestDispatcher dis = request.getRequestDispatcher("deleteMember.jsp");
		//dis.forward(request, response);
		//response.sendRedirect("deleteMember.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
