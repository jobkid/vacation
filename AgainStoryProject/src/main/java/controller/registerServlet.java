package controller;

import java.io.IOException;
import java.util.*;
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
		//String num = request.getParameter("num");
		//int number = Integer.parseInt(num);
		//System.out.println(Integer.parseInt(num));
		//String []elements = {search, search, search, search, search, search, search, search};
		int recordsPerPage = Integer.parseInt(request.getParameter("recordsPerPage"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		MemberDAO mDao = MemberDAO.getInstance();
		ArrayList<MemberBean> memberList = null;
		//ArrayList<MemberBean> memberList2 = mDao.getMember(element);
		int row = mDao.getNumberOfRows();
		int nOfPage = row/recordsPerPage;
		
		if(row%recordsPerPage>0) {
			nOfPage++;
		}
		request.setAttribute("nOfPage", nOfPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("recordsPerPage", recordsPerPage);
		
		//회원 검색을 할 때
		String category = request.getParameter("category");
		String search = request.getParameter("search");
		System.out.println(search);
		RequestDispatcher dis = null;
		if(category==null) {
			System.out.println("category가 null일 때 즉, 처음 회원 목록을 볼 때 : "+category);
			System.out.println("search도 null일 때 : "+search);
			memberList = mDao.getMember(currentPage, recordsPerPage);
			request.setAttribute("members", memberList);
			request.setAttribute("search", search);
			request.setAttribute("category", category);
		}
		else if(search==""&&category=="") {
			memberList = mDao.getMember(currentPage, recordsPerPage);
			request.setAttribute("members", memberList);
			request.setAttribute("search", search);
			request.setAttribute("category", category);
		}
		else if(search!=null&&category!=null){
			System.out.println("카테고리 별 검색 : "+category);
			memberList=mDao.getMember(search, category, currentPage, recordsPerPage);
			request.setAttribute("search", search);
			request.setAttribute("category", category);
			System.out.println("검색값 : "+search);
			request.setAttribute("members", memberList);
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
