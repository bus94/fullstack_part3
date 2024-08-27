<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginTest.jsp</title>
</head>
<body>

	<h2>loginTest 페이지입니다.</h2>

	<%-- 아이디랑 패스워드만 받아서 현재 페이지에서 처리를 할 것 
		실제 로그인이 되어있지 않다면 로그인할 수 있는 화면을 보여주고 만약 로그인이 되었다면 로그인 성공, **님 안녕하세요!
	--%>

	<%
		// post 방식은 한글이 깨질 수 있으므로
		request.setCharacterEncoding("UTF-8");

		// 로그인 버튼이 클릭되면 넘어오는 데이터를 받는다.
		// 단, null 예외가 발생할 수 있다.
		String id = "";
		String pw = "";

		try {

			id = request.getParameter("id").trim();
			pw = request.getParameter("pw").trim();

		} catch (NullPointerException e) {
			// 알림창으로 알림
			// 비워두면 무시한다
		}

		if (id.length() != 0 && pw.length() != 0) {
			out.println("<script>");

			// 입력한 데이터가 qwer, 1111와 맞는지 확인 후 맞으면 session에 저장하고, 다르면 alert()
			if (id.equals("qwer") && pw.equals("1111")) {
				// 로그인이 성공
				session.setAttribute("id", id);
				session.setAttribute("pw", pw);
				session.setAttribute("login", "yes");
				out.println("alert('" + session.getAttribute("id") + "님, 환영합니다~')");
			} else {
				out.println("alert('아이디 또는 비밀번호가 올바르지 않습니다.')");
			}

			out.println("</script>");
		}
		
		// 로그아웃 버튼이 클릭되면 넘어오는 데이터를 logout 변수로 받는다.
		String logout = request.getParameter("logout");
		
		// 로그인이 되어있는 상태이기 때문에 로그아웃이 가능하다. 세션에서 로그인 정보를 제거한다.
		if(logout != null && logout.equals("yes")) {
			session.removeAttribute("id");
			session.removeAttribute("pw");
			session.removeAttribute("login");
			
			// 서블릿: 자바 코드를 이용해서 html 코드를 작성하는 것
			out.println("<script>");
			out.println("alert('로그아웃 되었습니다.')");
			out.println("</script>");
		}
		
		// 세션에서 로그인 정보를 읽어와서 로그인 상태 true, false
		String login = (String) session.getAttribute("login");
		if(login != null && login.equals("yes")) {
	%>
	<!-- 로그인 상태일 경우 브라우저에 표시 -->
	<h2>로그인 성공</h2>
	<p><%= id %>님, 환영합니다.</p>
	<input type="button" value="로그아웃" onclick="location.href='?logout=yes'"/>
	<%} else { %>

	<form action="?" method="post">
		<table width="300" border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" /></td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw" /></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					name="login" value="로그인" /></td>
			</tr>

		</table>
	</form>
	
	<%} %>

</body>
</html>