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
		//current : ����ڰ� ���纸�� �ִ� ������ ��ȣ
		//recode : ���������� ������ �ڷ��� ����
		int current=Integer.parseInt(request.getParameter("currentPage"));
		int record=Integer.parseInt(request.getParameter("recordsPerPage"));
		System.out.println("���������� : "+current+", ������ �� ������ : "+record);
		PageDAO pDAO=PageDAO.getInstance();
		List<pageDTO> data = pDAO.findList(current, record);//limit�� �� select ��������
		System.out.println(data);	//������ �ڷḦ ���� ����Ʈ�� request�� ����
		request.setAttribute("data", data);
		
		int row=pDAO.getNumberOfRows();//�� �ڷ��� ������ �����ͼ� ������ ���� 34
		int nOfPage=row/record;
		
		if(row%record>0) {
			nOfPage++;
		}
//		System.out.println("�� ������ �� : "+nOfPage);
//		System.out.println("��ü �ڷ� �� : "+row);
//		System.out.println("������ ������ �ڷ� �� : "+(row%record));
		request.setAttribute("nOfPage", nOfPage); //��ü ������ ����
		request.setAttribute("currentPage", current);//���� ���� �ִ� ������ ��ȣ
		request.setAttribute("recordsPerPage", record);
		
		RequestDispatcher dis =request.getRequestDispatcher("list.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
