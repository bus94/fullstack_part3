package bs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bs.service.MvcService;

public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// MvcService 객체 생성
	private MvcService service = MvcService.getInstance();

	public MainController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("main get요청");
		servlet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("main post요청");
		servlet(request, response);
	}

	protected void servlet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("main servlet실행");

		// 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 요청받은 url 나누기
		String url = request.getRequestURI();
		String contextPath = request.getContextPath();
		String context = url.substring(contextPath.length());

		// 요청받은 view페이지로 이동하기 위해
		String viewpage = "/WEB-INF/";
		switch (context) {
		case "/insert.nhn":
			viewpage += "insert";
			break;

		case "/insertOK.nhn":
			// insert.jsp 테이블에 저장할 데이터를 submit으로 가져올 것이다. 그 데이터는 request에 저장되므로 Service가 처리할
			// 수 있도록 넘겨줘야한다.
			service.insert(request, response);
			System.out.println("MainController의 servlet 실행 중");
			viewpage += "index";
			break;

		// 1. list.nhn 요청을 처리하는 case 작성
		// 2. service 전체 글을 가져가는 select 메서드 생성
		// 3. dao 호출
		// 4. xml 코드 작성
		// 5. 리턴할 때 내장객체에 저장해서 list.jsp에서 출력할 수 있도록 프로그램 작성하기
		case "/list.nhn":
			service.selectAll(request, response);
			viewpage += "list";
			break;

		default:
			break;
		}
		viewpage += ".jsp";

		// 요청받은 페이지로 연결한다.
		RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		dis.forward(request, response);
	}

}
