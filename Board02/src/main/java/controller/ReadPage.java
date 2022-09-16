package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.PageDAO;
import DTO.pageDTO;
import java.util.*;
import javax.servlet.*;
import javax.annotation.*;

@WebServlet("/ReadPage")
public class ReadPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//current : 사용자가 현재보고 있는 페이지 번호
		//recode : 한페이지에 보여줄 자료의 갯수
		int current=Integer.parseInt(request.getParameter("currentPage"));
		int record=Integer.parseInt(request.getParameter("recordsPerPage"));
		System.out.println("현재페이지 : "+current+", 페이지 당 데이터 : "+record);
		PageDAO pDAO=PageDAO.getInstance();
		List<pageDTO> data = pDAO.findList(current, record);//limit을 건 select 가져오기
		System.out.println(data);	//가져온 자료를 담은 리스트를 request로 전송
		request.setAttribute("data", data);
		
		int row=pDAO.getNumberOfRows();//총 자료의 갯수를 가져와서 변수에 저장 34
		int nOfPage=row/record;
		
		if(row%record>0) {
			nOfPage++;
		}
//		System.out.println("총 페이지 수 : "+nOfPage);
//		System.out.println("전체 자료 수 : "+row);
//		System.out.println("마지막 페이지 자료 수 : "+(row%record));
		request.setAttribute("nOfPage", nOfPage); //전체 페이지 갯수
		request.setAttribute("currentPage", current);//현재 보고 있는 페이지 번호
		request.setAttribute("recordsPerPage", record);
		
		RequestDispatcher dis =request.getRequestDispatcher("list.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
