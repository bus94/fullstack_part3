package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class MainServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트에게 main.jsp 로 새로운 요청을 한다.
		/* req.getRequestDispatcher("/main.jsp").forward(req, resp); */
		
		// 프로젝트명을 같이 작성해서 보내줘야한다.
		resp.sendRedirect(req.getContextPath() + "/main.jsp");
	}
}
