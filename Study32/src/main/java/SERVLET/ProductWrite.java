package SERVLET;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import DTO.productDTO;
import DAO.productDAO;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

@WebServlet("/ProductWrite")
public class ProductWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doget����");
		RequestDispatcher dis = request.getRequestDispatcher("productWrite.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ProductWrite.doPost() ����Ȯ��");
		request.setCharacterEncoding("utf-8");//������ ���� �ѱ��̹Ƿ� utf-8�� ��´�.
		ServletContext context = getServletContext();//����ü�� // dao�� �Ȱ��� �ڱ� �ڽ��� ���� �ִ� �޼ҵ��.
		String path = context.getRealPath("/files");//���� ���� ��� Ȯ������!!!!!
		System.out.println(path);//�ڹ� ���α׷��� ����� �� ���Ե��� ����� ��!!!
		
		//���� ũ�� ����
		int sizeLimit = 20*1024*1024;//���ε� ������ 20mb����
		String encType = "utf-8";	//Multipart ������ ������ �ѱ� �ν�
		
		//���� ������ ����
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());//dopost�� ������ request
		String name = multi.getParameter("name");
		int price = Integer.parseInt(multi.getParameter("price"));
		String description = multi.getParameter("description");
		String pictureurl = multi.getFilesystemName("pictureurl");
		
		productDTO DTO = new productDTO();
		DTO.setName(name);
		DTO.setPrice(price);
		DTO.setDescription(description);
		DTO.setPictureurl("/files/"+pictureurl);
		
		productDAO DAO = productDAO.getInstance();
		DAO.insertProduct(DTO);
		
		response.sendRedirect("ProductList");
		
		System.out.println(name+", "+price+", "+description+", "+pictureurl);
	}

}
