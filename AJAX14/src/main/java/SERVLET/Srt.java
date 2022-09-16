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
		System.out.println("doGetȣ��Ȯ��");
		
		listDAO DAO=listDAO.getInstance();
		List<listDTO> data=DAO.getList();
		System.out.println(data);
		request.setAttribute("data", data);
		
		
		//System.out.println(data); ����ó Ȯ�� ���� �ѹ��� ������ Ȯ���ϴ� ������ ������ �͵� ����
		//DTO ���� toString
		
		RequestDispatcher dis=request.getRequestDispatcher("main.jsp");
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	//�������� ������ ������ �ѱ�ó��
		response.setCharacterEncoding("utf-8");	//�������� ������ ������ �ѱ� ó��
		System.out.println("doPost ȣ��");
		String idx = request.getParameter("idx");
		String text = request.getParameter("text");
		System.out.println("ajax���� ���۹��� idx�� : "+idx);
		System.out.println("ajax���� ���۹��� text�� : "+text);
		
		JSONParser jParser = new JSONParser();//JSON ����� String�� JSON���·� ����
		try {
			JSONArray json1 = (JSONArray)jParser.parse(idx);
			JSONArray json2 = (JSONArray)jParser.parse(text);
			System.out.println("����Ȯ�� : "+json2.get(1));
			String[] arr = new String[json2.size()];
			for(int i=0; i<json2.size(); i++) {
				arr[i] = (String)json2.get(i);
				System.out.println(arr[i]);
			}
			listDAO DAO=listDAO.getInstance();
			DAO.updateList(arr);
		}catch(Exception e) {
			System.out.println("doPost���� ���� �߻� : "+e);
		}
		
	}

}
