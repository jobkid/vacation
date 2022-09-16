package SERVLET;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import SERVICE.NameService;

/**
 * Servlet implementation class AutoServlet
 */
@WebServlet("/AutoServlet")
public class AutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private List names = new ArrayList();
	public void init() throws ServletException {
		System.out.println("서블릿 init 실행, List초기화 완료");
		names.add("Abe");
		names.add("Abel");
		names.add("Abigail");
		names.add("Abner");
		names.add("Abraham");
		names.add("Marcus");
		names.add("Marge");
		names.add("Marie");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet동작확인");
		String prefix = request.getParameter("names");
		NameService service = NameService.getInstance(names);
		List matching = service.findNames(prefix);
		System.out.println(matching);
		if(matching.size()>0) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/xml");
			out.print("<response>");
			Iterator itr = matching.iterator();
			while(itr.hasNext()) {
				String name = (String)itr.next();
				out.print("<name>"+name+"</name>");
			}
			out.print("</response>");
			out.close();
		}else {
			response.setStatus(HttpServletResponse.SC_NO_CONTENT);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
