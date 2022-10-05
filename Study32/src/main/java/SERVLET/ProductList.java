package SERVLET;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.productDAO;
import DTO.productDTO;
import java.util.*;

/**
 * Servlet implementation class ProductList
 */
@WebServlet("/ProductList")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ProductList서블릿의 doget실행");
		productDAO DAO=productDAO.getInstance();
		List<productDTO> productlist=DAO.selectAllProducts();
		System.out.println(productlist);
		request.setAttribute("productlist", productlist);
		RequestDispatcher dis = request.getRequestDispatcher("productList.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
