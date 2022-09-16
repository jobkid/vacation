package SERVLET;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet동작 확인");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String data = request.getParameter("data");
		System.out.println("취득 데이터 : "+data);
		
		response.getWriter().write("TestServlet이 정상 동작합니다.");//자바 부분 수정하면 바꿔야 하는 이유는 앞축파입이기 때문에
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
