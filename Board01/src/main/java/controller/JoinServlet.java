package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import beans.Member;
import DAO.MemberDao;

/**
 * Servlet implementation class joinServlet
 */
@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	//127.0.0.1:8080/Board01/join.do. a�±� �Ǵ� form method="get"���� ���� �� ����Ǵ� �κ�
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("/register.jsp");
		dis.forward(request, response);
	}

	//127.0.0.1:8080/Board01/join.do. a�±� �Ǵ� form method="post"���� ���� �� ����Ǵ� �κ�
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String admin=request.getParameter("admin");
		
		Member m=new Member();
		m.setName(name);
		m.setUserid(userid);
		m.setPwd(pwd);
		m.setEmail(email);
		m.setPhone(phone);
		m.setAdmin(admin);
		
		MemberDao mDao=MemberDao.getInstance();
		int result = mDao.insertMember(m);
		
		HttpSession session = request.getSession();
		if(result==1) {
			session.setAttribute("userid", m.getUserid());
			request.setAttribute("message", "ȸ�����Կ� �����߽��ϴ�.");
		}else {
			request.setAttribute("message", "ȸ�����Կ� �����߽��ϴ�.");
		}
		RequestDispatcher dis = request.getRequestDispatcher("login.do");
		dis.forward(request,response);
	}

}

