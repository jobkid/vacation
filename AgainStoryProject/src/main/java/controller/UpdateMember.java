package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.MemberDAO;
import beans.MemberBean;

/**
 * Servlet implementation class UpdateMember
 */
@WebServlet("/UpdateMember.do")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doget : updateMember.do  실행");
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("nice");
		System.out.println(id);
		
		RequestDispatcher dis = request.getRequestDispatcher("updateMember.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost : updateMember.do 실행");
		
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String place = request.getParameter("place");
		String tribe = request.getParameter("tribe");
		int num = Integer.parseInt(request.getParameter("num"));
		
		MemberBean member = new MemberBean();
		member.setName(name);
		member.setId(id);
		member.setPwd(pwd);
		member.setNickname(nickname);
		member.setEmail(email);
		member.setPhone(phone);
		member.setPlace(place);
		member.setTribe(tribe);
		member.setNum(num);

		MemberDAO mDAO = MemberDAO.getInstance();
		mDAO.updateMember(member);
		
		System.out.println(member.getName());
		System.out.println(member.getTribe());
		System.out.println(member.getNum());
		//request.setAttribute(nickname, mDAO);
		RequestDispatcher dis = request.getRequestDispatcher("updateComplete.jsp");
		dis.forward(request, response);
	}
}
