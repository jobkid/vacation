package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MemberDAO;
import beans.MemberBean;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/register.do")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("register.do 실행");
		request.setCharacterEncoding("utf-8");
		String category = request.getParameter("category");
		String search = request.getParameter("search");
		//String []elements = {search, search, search, search, search, search, search, search};
		System.out.println(category);
		MemberDAO mDao = MemberDAO.getInstance();
		ArrayList<MemberBean> memberList = mDao.getMember();
		//ArrayList<MemberBean> memberList2 = mDao.getMember(element);
		
		RequestDispatcher dis = null;
		if(category==null) {
			System.out.println("element가 null일 때");
			request.setAttribute("members", memberList);
		}else if(/*Arrays.asList(elements).contains(search)*/search!=null){
			if(category=="all") {
				category=null;
				memberList=mDao.getMember(search, category);
				request.setAttribute("members", memberList);
			}
			else{
				memberList=mDao.getMember(search, category);
				request.setAttribute("members", memberList);
			}
		}
		dis = request.getRequestDispatcher("memberList.jsp");
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
		String tribe = request.getParameter("tribe");
		
		MemberBean m = new MemberBean();
		m.setName(name);
		m.setId(id);
		m.setPwd(pwd);
		m.setNickname(nickname);
		m.setEmail(email);
		m.setPhone(phone);
		m.setBirthday(birthday);
		m.setPlace(place);
		m.setTribe(tribe);

		MemberDAO mDao=MemberDAO.getInstance();
		int result = mDao.insertMember(m);
		
		HttpSession session =request.getSession();
		if(result==1) {
			session.setAttribute("id", m.getId());
			request.setAttribute("message","회원 가입에 성공했습니다.");
			
		}else {
			request.setAttribute("message", "회원가입에 실패했습니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher("checkMember.jsp");
		dis.forward(request, response);
	
	}

}
