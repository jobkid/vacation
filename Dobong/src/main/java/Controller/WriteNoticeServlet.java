package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import DAO.NoticeDAO;
import Beans.NoticeBean;

/**
 * Servlet implementation class WriteNoticeServlet
 */
@WebServlet("/WriteNotice.Do")
public class WriteNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result;
		request.setCharacterEncoding("utf-8");
		String nick = request.getParameter("nickname");//writeNotice���� �޾ƿ� ��
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		NoticeDAO notice = new NoticeDAO();//import ��Ų ��
		
		NoticeBean nb = new NoticeBean();// import ��Ų ��
		nb.setNickname(nick);
		nb.setTitle(title);
		nb.setContent(content);
		
		
		result = notice.insertNotice(nb);
		
		HttpSession session = request.getSession();
		if(result==1) {
			session.setAttribute("nickname", nb.getNickname());
			request.setAttribute("massage", "�۾��⸦ ��ġ�̽��ϴ�.");
		}else {
			request.setAttribute("message", "�۾��⿡ �����߽��ϴ�.");
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("checkNotice.jsp");
		dis.forward(request, response);
		response.sendRedirect("notice.jsp");
		
	}
}