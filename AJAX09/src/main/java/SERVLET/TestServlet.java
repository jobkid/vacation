package SERVLET;

import javax.servlet.annotation.WebServlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet.do")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//���� ��ȿ�� ������ ������ �޼���
	private boolean validateDate(String date) {
		boolean result=true;
		if(date!=null) {
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			try {
				format.parse(date);
				System.out.println("���˺�ȯ ����");
			}catch(Exception e) {
				System.out.println("���˺�ȯ ���� : "+e);
				result = false;
			}
		}
		return result;
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet�� ����Ǿ����ϴ�.");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");//�ѱ۷�
		response.setContentType("text/xml; charset = utf-8");//���� �ȿ� �ѱ��̶�� �����ִ°�...�׷��� UTF-8 �ٽ� ���� ��.
															//printwriter���� ���� ��� ��.
		
		boolean passed=validateDate(request.getParameter("birthDate"));
		PrintWriter out = response.getWriter();//response�� �ؾ� ȭ���� �����ش�. ȭ�� ��ü�� �ƴ� �κи� ���ִ� ��.
		
		String message = "�߸��� ������ �Է��ϼ̽��ϴ�.";
		if(passed) {
			message = "�ùٸ� ������ �Է��ϼ̽��ϴ�.";
		}
		out.println("<response>");
		out.println("<passed>"+Boolean.toString(passed)+"</passed>");//���������� ���� String ��ȯ
		out.println("<message>"+message+"</message>");
		out.println("</response>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�����Ͱ� POST�� �Ѿ���� ���� ���̱� ������ ������.
	}

}
