package model.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("get() 실행!");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("post() 실행!");
		
		// 요청이 들어왔을 때 한글 깨짐 방지 위해 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 1. post로 넘어온 데이터 꺼내기
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String grade = request.getParameter("grade");
		String[] inter = request.getParameterValues("inter");
		
		// 2. 저장 객체 생성
		Member member = new Member(name, gender, grade, inter);
		
		// 위에 인코딩 설정을 했는데도 데이터가 깨진다면 응답하는 페이지의 인코딩 설정을 해줄 수 있다.
		response.setContentType("text/html;charset=UTF-8");
		
		// 3. 내장 객체에 저장하기 (서버 메모리)
		request.setAttribute("member", member);
		
		// 4. 페이지 이동하기
		request.getRequestDispatcher("/EL/FormResult.jsp").forward(request, response); // forward - 다음페이지까지 request, response 정보를 가져가겠다
	}

}
