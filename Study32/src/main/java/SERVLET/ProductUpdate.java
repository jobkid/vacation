package SERVLET;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.productDAO;
import DTO.productDTO;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

@WebServlet("/ProductUpdate")
public class ProductUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String code = request.getParameter("code");
		System.out.println("productUpdate.doget() 실행 전송 패러미터 확인 : "+code);
		
		productDAO DAO = productDAO.getInstance();
		productDTO DTO = DAO.selectProduct(code);
		System.out.println("데이터 확보 테스트 : "+DTO.getName());
		request.setAttribute("product", DTO);
		
		RequestDispatcher dis = request.getRequestDispatcher("productUpdate.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("productUpdate.doPost()실행");
		request.setCharacterEncoding("utf-8");
		ServletContext context = getServletContext();
		String path = context.getRealPath("files");
		System.out.println("업로드 경로 확인 : "+path);
		
		
		String encType = "utf-8";
		int sizeLimit = 20*1024*1024;
		
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());
		String code = multi.getParameter("code");
		String name = multi.getParameter("name");
		int price = Integer.parseInt(multi.getParameter("price"));
		String description = multi.getParameter("description");
		String pictureurl = multi.getFilesystemName("pictureurl");//파일 이름을 부른다.
		

		boolean flag = true; //이미지를 바꾸면 true, 안 바꾸면 false
		if(pictureurl==null) {
			flag = false;
			pictureurl=multi.getParameter("nomakeImg");
		}
		
		productDTO DTO = new productDTO();
		DTO.setCode(Integer.parseInt(code));
		DTO.setName(name);
		DTO.setPrice(price);
		DTO.setDescription(description);
		if(flag) {
			DTO.setPictureurl("/files/"+pictureurl);
		}else {
			DTO.setPictureurl(pictureurl);
		}	
		productDAO DAO = productDAO.getInstance();
		DAO.updateProduct(DTO);
		
		response.sendRedirect("ProductList");
	}

}
