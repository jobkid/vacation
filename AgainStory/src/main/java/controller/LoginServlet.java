package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MemberDAO;
import beans.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("login.do");
		dis.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="login.jsp";
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		MemberDAO mDAO=MemberDAO.getInstance();
		int result=mDAO.userCheck(id, pwd);
		if(result==1) {
			Member m=mDAO.getMember(id);
			HttpSession session=request.getSession();
			session.setAttribute("login", m);
			request.setAttribute("massage", "로그인에 성공했습니다.");
			url="logincheck.jsp";
		}else if(result==0) {
			request.setAttribute("massage", "비밀번호가 맞지 않습니다.");
		}else if(result==-1) {
			request.setAttribute("massage", "존재하지 않는 회원입니다.");
		}
		
		RequestDispatcher dis=request.getRequestDispatcher(url);
		dis.forward(request, response);
	}

}
