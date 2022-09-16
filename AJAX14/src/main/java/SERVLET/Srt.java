package SERVLET;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import DAO.listDAO;
import DTO.listDTO;

import java.util.*;
import org.json.simple.*;
import org.json.simple.parser.*;

@WebServlet("/Srt")
public class Srt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet호출확인");
		
		listDAO DAO=listDAO.getInstance();
		List<listDTO> data=DAO.getList();
		System.out.println(data);
		request.setAttribute("data", data);
		
		
		//System.out.println(data); 디스패처 확인 전에 한번씩 데이터 확인하는 습관을 가지는 것도 좋음
		//DTO 에서 toString
		
		RequestDispatcher dis=request.getRequestDispatcher("main.jsp");
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	//서블릿으로 들어오는 정보의 한글처리
		response.setCharacterEncoding("utf-8");	//서블릿에서 나가는 정보의 한글 처리
		System.out.println("doPost 호출");
		String idx = request.getParameter("idx");
		String text = request.getParameter("text");
		System.out.println("ajax에서 전송받은 idx값 : "+idx);
		System.out.println("ajax에서 전송받은 text값 : "+text);
		
		JSONParser jParser = new JSONParser();//JSON 모양의 String을 JSON형태로 가공
		try {
			JSONArray json1 = (JSONArray)jParser.parse(idx);
			JSONArray json2 = (JSONArray)jParser.parse(text);
			System.out.println("가공확인 : "+json2.get(1));
			String[] arr = new String[json2.size()];
			for(int i=0; i<json2.size(); i++) {
				arr[i] = (String)json2.get(i);
				System.out.println(arr[i]);
			}
			listDAO DAO=listDAO.getInstance();
			DAO.updateList(arr);
		}catch(Exception e) {
			System.out.println("doPost에서 오류 발생 : "+e);
		}
		
	}

}
