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
		System.out.println("연결 확인");
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
			request.setAttribute("message", "로그인에 성공했습니다.");
			System.out.println("로그인 성공");
		}else if(result==0) {
			request.setAttribute("message", "비밀번호가 맞지 않습니다.");
			System.out.println("비밀번호 오류");
		}else if(result==-1) {
			request.setAttribute("message", "존재하지 않는 회원입니다.");
			System.out.println("아이디 오류");
		}
		
		dis=request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
	}

}
