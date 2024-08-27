package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

	// 웹 요청을 JoinServlet클래스가 처리할 수 있도록 웹브라우저와 JoinServlet을 연결하기
	// 두 개 연결하는 매개체! (web.xml)

	// 초기화 메서드는 서버가 실행될 때 딱 한 번만 실행되는 메서드
	@Override
	public void init() throws ServletException {
		System.out.println("로그인 서블릿 초기화");
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("로그인 서블릿 서비스");

		// HttpServletRequest
		// - 클라이언트의 요청 정보를 가지고 있다.
		// HttpServletResponse
		// - 서버가 클라이언트 요청을 처리하고 응답하는 클래스

		PrintWriter pw = new PrintWriter(resp.getOutputStream());
		pw.println("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<meta charset=\"UTF-8\">\r\n" + "<title>서블릿</title>\r\n" + "</head>\r\n"
				+ "<body>\r\n" + "<h1>서블릿 view 페이지</h1>\r\n" + "</body>\r\n"
				+ "</html>"
		);
		
		pw.flush();
	}

	@Override
	public void destroy() {
		System.out.println("로그인 서블릿 소멸");
	}

	/*
	 * <servlet> 태그 - 서블릿을 등록하는 역할 - 반드시 하위 태그로 servlet-name servlet-class
	 * 
	 */

	// 요청을 jsp가 아니라 서블릿으로 할 것
	// 서블릿과 웹 브라우저가 데이터를 주고 받으려면 매개체 역할을 하는 것이 web.xml파일

	// 지금 하고 있는 방식
	// 브라우저가 웹 애플리케이션 서버간의 통신을 할 때 jsp 파일이 매개체 역할

	// 서블릿
	// - 웹 클라이언트의 요청을 처리하는 클래스

	// 서블릿 컨테이너
	// - 서블릿을 관리하는 컨테이너

	// jsp 파일이 서블릿
	// 기존 방식 - 클라이언트의 요청이 들어오면 jsp 파일로 받음

	// 이제는 서블릿을 직접 이용하는 방식을 쓸 것
	// - 클라이언트가 요청을 하면 servlet 자바 파일을 직접 호출할 수 있도록 설계할 것!
	// - 상세하게 기능을 쪼개게 될 것!

	// 클라이언트(웹 브라우저 입장)에서는 jsp 파일, 자바 파일 직접

	// 웹 브라우저는 자바 파일을 직접 가져올 수 없다보니 MVC 패턴을 이용하게 되는 것
	// 웹 애플리케이션에서 완전히 기능별 분리할 것이다
	// MVC 패턴
	// View : 사용자에게 보여지는 부분만 담당 (jsp 혹은 html)
	// Controller : 클라이언트가 요청하면 그 내용을 구분해서 분석하고 어떻게 처리할지의 역할 (모든 요청을 받아 구분해주는 역할)
	// ex.처리할 수 있게 DAO로 가, 인천 공항 (게이트 분류, 안내)
	// Model : 처리 (DB 등등)

	// servlet 특징
	// - 클라이언트의 요청에 대해 동적으로 작동하는 웹 애플리케이션 컴포넌트
	// - html을 사용하여 요청에 응답
	// - java Thread가 동작하게 된다. (각각 처리해줘야하기 때문에)
	// - MVC 패턴에서 Controller 요청 구분
	// - http 프로토콜 서비스를 지원하는 것
	// - javax.servlet.http.HttpServlet 을 상속 받는다.

	// HTTP 프로토콜
	// - 하이퍼텍스트 전송 프로토콜(규칙)
	// - 웹 브라우저와 웹 서버간의 데이터를 전송하는 규칙

}
