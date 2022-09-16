package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class testServlet
 */
@WebServlet("/testServlet")
public class testServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public testServlet() {
        super();//�θ� Ŭ���� �����ڿ��� �Ű����� ���°�
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET������� ������ ����Ǿ����ϴ�.");
		RequestDispatcher dis=request.getRequestDispatcher("/get.jsp");//�ش� jsp ������ �д� �� ������ get.jsp�� ����.
		request.setAttribute("data", "get ����� ������");
		dis.forward(request,  response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST������� ������ ����Ǿ����ϴ�.");
		RequestDispatcher dis=request.getRequestDispatcher("/post.jsp");
		request.setAttribute("data", "post����� ������");
		dis.forward(request, response);
		
	}

}
