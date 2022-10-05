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
 * Servlet implementation class JoinServlet
 */
@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//a태그 또는 form method="get"으로 실행 시 실행되는 부분
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("/join.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		String place = request.getParameter("place");
		String admin = request.getParameter("admin");
		
		Member m = new Member();
		m.setName(name);
		m.setId(id);
		m.setPwd(pwd);
		m.setNickname(nickname);
		m.setEmail(email);
		m.setPhone(phone);
		m.setBirthday(birthday);
		m.setPlace(place);
		m.setAdmin(admin);
		
		MemberDAO mDao=MemberDAO.getInstance();
		int result = mDao.insertMember(m);
		
		HttpSession session =request.getSession();
		if(result==1) {
			session.setAttribute("id", m.getId());
			request.setAttribute("message","회원 가입에 성공했습니다.");
			
		}else {
			request.setAttribute("message", "회원가입에 실패했습니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher("check.jsp");
		dis.forward(request, response);
	}

}
