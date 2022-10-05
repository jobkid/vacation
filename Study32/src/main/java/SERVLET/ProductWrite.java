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
		System.out.println("doget실행");
		RequestDispatcher dis = request.getRequestDispatcher("productWrite.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ProductWrite.doPost() 실행확인");
		request.setCharacterEncoding("utf-8");//들어오는 값이 한글이므로 utf-8을 잡는다.
		ServletContext context = getServletContext();//정보체계 // dao랑 똑같이 자기 자신을 같고 있는 메소드다.
		String path = context.getRealPath("/files");//오류 나면 경로 확인하자!!!!!
		System.out.println(path);//자바 프로그램을 만드는 건 설게도를 만드는 것!!!
		
		//파일 크기 제한
		int sizeLimit = 20*1024*1024;//업로드 파일의 20mb제한
		String encType = "utf-8";	//Multipart 데이터 내부의 한글 인식
		
		//복합 데이터 저장
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());//dopost로 들어오는 request
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
