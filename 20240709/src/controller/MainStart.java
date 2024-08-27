package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class MainStart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// index.jsp 페이지로 컨트롤러가 WEB-INF 폴더 안에 index.jsp로 사이트 연결하기
    	// 서블릿에서 특정 jsp 페이지로 요청을 전달할 때 사용되는 메서드
    	RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/index.jsp");
    	
    	// 실제 페이지 연결
    	// forward() 메서드는 서버 내부에서 요청을 전달하는 방식이기 때문에 클라이언트의 URL이 변경 되지 않는다.
    	dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
