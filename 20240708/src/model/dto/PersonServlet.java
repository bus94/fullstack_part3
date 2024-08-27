package model.dto;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PersonServlet
 */
@WebServlet("/person")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// get요청이 들어왔을 때 실행하는 메서드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	// post요청이 들어왔을 때 실행하는 메서드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	// 위에 get, post 든 어떤 방식으로 전송이 되도록 하나의 메서드에서 처리하겠다
	protected void reqPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Person person = new Person();
		person.setName("김준완");
		person.setAge(30);
		
		System.out.println("person : " + person);
		// 클래스를 이용해서 인스턴스를 생성하면 클래스 멤버 안의 변수들은 자동 초기화 된다.
		
		// static int num;
		// 클래스 안에 선언이 되어있기 때문에 자동으로 0으로 초기화가 된다.
		
		// 클래스들 끼리 공유하는 static 멤버들은 자동으로 초기화가 된다.
		// 객체 null
		// float, double 0.0
		// boolean false
		
		req.setAttribute("person", person);
		
		// 페이지 연결을 위해서 forward()
		req.getRequestDispatcher("/EL/01_EL.jsp").forward(req, resp);
		
	}
	
}
