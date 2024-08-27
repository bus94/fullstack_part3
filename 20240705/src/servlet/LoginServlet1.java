package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 위의 서블릿(LoginServlet) 설정이 너무 힘들어서 jsp가 나오게 된 것이고, 
// service()메서드 지우고 실제 get/post

public class LoginServlet1 extends HttpServlet{
	
	// get 요청 시 실행하는 메서드
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/home.jsp").forward(req, resp);;
	}
	
}
