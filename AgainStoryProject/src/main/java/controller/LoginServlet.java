package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.MemberDAO;
import beans.MemberBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("���� Ȯ��");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberDAO mDAO = MemberDAO.getInstance();
		int result = mDAO.userCheck(id, pwd);
		RequestDispatcher dis = null;
		if(result==1) {
			MemberBean mBean = mDAO.getMember(id);
			HttpSession session = request.getSession();
			session.setAttribute("login", mBean);
			session.setAttribute("id", id);
			request.setAttribute("message", "�α��ο� �����߽��ϴ�.");
			System.out.println("�α��� ����");
		}else if(result==0) {
			request.setAttribute("message", "��й�ȣ�� ���� �ʽ��ϴ�.");
			System.out.println("��й�ȣ ����");
		}else if(result==-1) {
			request.setAttribute("message", "�������� �ʴ� ȸ���Դϴ�.");
			System.out.println("���̵� ����");
		}
		
		dis=request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
	}

}
