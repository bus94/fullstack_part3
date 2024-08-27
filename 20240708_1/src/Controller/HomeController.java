package Controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 브라우저 주소창의 contextPath("/20240708_1")
// 뒤에 @WebServlet 어노테이션에서 인수로 지정된 요청("/HomeController")이 들어오면 get요청인지 post요청인지 구별해서 doget(), dopost() 메서드가 자동으로 실행된
@WebServlet("/HomeController")
public class HomeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		actionDo(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		actionDo(req, resp);
	}

	protected void actionDo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// post 데이터 전송 시 한글이 깨질 수 있다.
		req.setCharacterEncoding("UTF-8");
		
		// view 페이지 이름을 만든다.
		String viewpage = "/WEB-INF/hello.jsp";
		
		// 요청에 따라서 실제 view 페이지를 호출해서 브라우저에 표시하기 위해 준비
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewpage);
		dispatcher.forward(req, resp);
		
		
		
		
	}

}
