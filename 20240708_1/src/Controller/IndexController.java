package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/index")
public class IndexController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		actionDo(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		actionDo(req, resp);
	}

	protected void actionDo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// post 데이터 전송시 한글이 깨질 수있다.
		req.setCharacterEncoding("UTF-8");

		// VIEW 페이지 이름을 만든다.
		String viewpage = "/WEB-INF/index.jsp";

		// 요청에 따라서 실제 view페이지를 호출해서 브라우저에 표시하기 위해 준비
		/*
		 * System.out.println(req.getContextPath());
		 * resp.sendRedirect(req.getContextPath() + viewpage);
		 */
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewpage);
		dispatcher.forward(req, resp);
		
	}

}