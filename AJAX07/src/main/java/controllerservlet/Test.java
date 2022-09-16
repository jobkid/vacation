package controllerservlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class Test
 */
@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response, "GET");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response, "POST");
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response, String str) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/xml");
		String first=request.getParameter("first");
		String second=request.getParameter("second");
		String last=request.getParameter("last");
		String responseText="첫번째데이터 : "+first+", 두번째 데이터 : "+second+", 마지막데이터"+last+", 방식 : "+str;
		System.out.println(responseText);
		PrintWriter out=response.getWriter();
		out.println(responseText);
		out.close();
	}

}
