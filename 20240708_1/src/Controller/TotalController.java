package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 어떤 url이든 모든 요청을 한 번에 처리하기 위해서 확장자를 이용한다.
// * 전부 요청을 받는다.
// .com 처럼 뒤에 끝나는 url 요청을 TotalController가 받아서 controller가 WEB-INF 폴더 안에 index.jsp 파일로 연결해서 웹 브라우저에 표시한다.
@WebServlet("*.com")
public class TotalController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String viewpage = "/WEB-INF/index.jsp";

		RequestDispatcher dispatcher = req.getRequestDispatcher(viewpage);
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
