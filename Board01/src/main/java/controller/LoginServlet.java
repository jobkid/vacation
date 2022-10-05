package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;//RequestDispatcher ���� �ʿ��� import
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MemberDao;
import beans.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis=request.getRequestDispatcher("login.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url="login.jsp";
		request.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		MemberDao mDAO=MemberDao.getInstance();//�̱����� �����ϱ� ���� new�� ����� ����
		int result=mDAO.userCheck(userid, pwd);//1. �α��� ���� 0. ��й�ȣ Ʋ�� -1. ���̵� ����.
		if(result==1) {
			Member m=mDAO.getMember(userid);
			HttpSession session=request.getSession();
			session.setAttribute("loginUser",m);
			request.setAttribute("message", "�α��ο� �����߽��ϴ�.");
			url="main.jsp";
			//�ش� ����� ������ �����ͼ� ���ǿ� ����
			//url�� ����, �α��� ���� �� ������������ �̵�
		}else if(result==0) {
			//��й�ȣ�� Ʋ�ȴٴ� �Ƴ� �޽����� ����
			request.setAttribute("massage","��й�ȣ�� ���� �ʽ��ϴ�.");
		}else if(result==-1) {
			//���̵� �������� �ʴ´ٴ� �ȳ� �޽����� ����
			request.setAttribute("massage", "�������� �ʴ� ȸ���Դϴ�.");
		}
		RequestDispatcher dis=request.getRequestDispatcher(url);
		dis.forward(request, response);
	}

}
