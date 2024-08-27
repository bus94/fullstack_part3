<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
</head>
<body>
	<%-- 
		내장 객체
		- 기본적인 요청, 응답, 화면 출력을 담당한다.
		- 톰캣 컨테이너(jsp 파일들이 들어가 있는 곳)가 미리 선언하여 별도의 생성 없이 사용할 수 있다.
	 --%>
	 
	<h2>main.jsp 페이지 입니다.</h2>
	
	<!-- myInfo.jsp에서 넘어온 데이터 출력하기
	
	톰캣 버전에 따라서 한글이 깨지는 경우가 있다.
	톰캣 6.0 버전까지는 한글이 깨져있다.
	톰캣 7.0 버전 이후부터는 get 방식으로 넘어오는 데이터는 한글이 깨지지 않는다. 근데 문제는 post로 넘어오면 깨진다.
	톰캣 10 버전 이후는 get, post 상관없이 한글이 깨지지 않는다.
	-->
	<% 
		// 톰캣을 이용할 때 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
	
		// request로 넘어온 데이터들을 출력하려면 request 객체 안에서 꺼내와야 한다.
		// getParameter(html의 name속성명)
		// 이전 페이지에서 넘어오는 데이터는 무조건 문자열 형태로 넘어온다.
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		// 나이 출력
		//  현재 나이는 **세 입니다. 내년 나이는 **+1세 입니다.
		//  문자로 넘어오기에 기본 자료형으로 바로 저장은 안된다. → Integer.parseInt()
		int age = Integer.parseInt(request.getParameter("age"));
	/* 	out.println(name + "님 안녕하세요<br>");
		out.println(id + "님 <br>");
		out.println("<p>" + id + "</p>"); 
		
		getParameter() : 하나의 데이터만 가져옴
		
		래퍼클래스를 이용해서 문자 객체를 boolean 타입으로
		*/
		
		boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
// 		out.println(name + "님은 " + (gender ? "남자" : "여자") + "입니다.");
		String[] hobbies = request.getParameterValues("hobbies");
		
		// Arrays 배열을 이용해서 하나의 문자로 리턴
		// 인덱스 이용해서 출력
		// 만약 데이터가 없으면 null
		/* if(hobbies != null) {
			out.println(Arrays.toString(hobbies));
		} else {
			out.println("취미가 선택되지 않았습니다.");
		} */
		
		String trip = request.getParameter("trip");
		out.println(trip + " 가고 싶습니다!");
		String memo = request.getParameter("memo");
		
		out.println("<br>======================================");
	%>
	
	<p>이름: <%= name %></p>
	<p>아이디: <%= id %></p>
	<%-- 에러 발생: 숫자를 입력해야되는데 문자를 입력한 경우
	문자에  +1도 안된다. 그래서 try ~ catch문으로 예외를 잡아주면 된다. --%>
	<p>나이: <%= age %></p>
	<p>1년 후 나이: <%= age + 1 %></p>
	<p>성별: <%=(gender ? "남자" : "여자") %></p>
	<%
		if(hobbies != null){
	%>
		<p>취미: <%= Arrays.toString(hobbies) %></p>
	
	<%} else { %>
		<p>선택된 취미가 없습니다.</p>
	<%} %>
	<p>여행 가고 싶은 곳은 <%=trip %>입니다.</p>
	<p>메모: <%=memo %></p>
	
	<h2>클라이언트와 서버의 환경 정보 읽기</h2>
	
	<ul>
		<li>데이터 전송 방식: <%= request.getMethod() %></li>
		<li>URL: <%= request.getRequestURL() %>
		<li>URI: <%= request.getRequestURI() %>
		<li>클라이언트 ip 주소: <%= request.getRemoteAddr() %></li>
		<!-- 
		서버명: getServerName()
		서버포트: getServerPort() 
		-->
	</ul>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>