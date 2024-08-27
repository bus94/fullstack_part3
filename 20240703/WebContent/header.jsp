<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>
	<%
		//세션을 이용한 로그인 처리 
		String id = (String) session.getAttribute("id");

		// 로그인이 되어있지 않다면
		if (id == null) {
			id = "GUEST";
		}
	%>


	<table>
		<tr height="70">
			<td colspan="4"><a href="carMain.jsp"
				style="text-decoration: none"> <img alt=""
					src="img/rent_logo.jpg" height="120">
			</a></td>
			<td align="center" width="200"><%=id%>님 <%
				if (id.equals("GUEST")) {
			%>
				<button onclick="location.href='carMain.jsp?center=memberLogin.jsp'">
					로그인</button> <%
 	} else {
 %>
				<button onclick="location.href='memberLogout.jsp'">로그아웃</button> <%
 	}
 %></td>
		</tr>
		<tr height="50">
			<td align="center" width="200" bgcolor="pink" style="border: 3px solid white"><font
				color="white" size="5"><a
					href="carMain.jsp?center=carReserveMain.jsp"
					style="text-decoration: none">예 약 하 기</a></font></td>
			<td align="center" width="200" bgcolor="pink" style="border: 3px solid white"><font
				color="white" size="5"><a
					href="carMain.jsp?center=carReserveView.jsp"
					style="text-decoration: none">예 약 확 인</a></font></td>
			<td align="center" width="200" bgcolor="pink" style="border: 3px solid white"><font
				color="white" size="5"><a 
					href="carMain.jsp?center=carBoardList.jsp"
					style="text-decoration: none">자유게시판</a></font></td>
			<td align="center" width="200" bgcolor="pink" style="border: 3px solid white"><font
				color="white" size="5"><a href="#"
					style="text-decoration: none">이 벤 트</a></font></td>
			<td align="center" width="200" bgcolor="pink" style="border: 3px solid white"><font
				color="white" size="5"><a href="#"
					style="text-decoration: none">고 객 센 터</a></font></td>
		</tr>
	</table>

</header>

<!-- 
<style>
header {
	width: 1000px;
}

.main_logo {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.menu {
	background: lightblue;
}

a {
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
}

.row_design {
	margin: 0;
}
</style>

<header>
	<div class="main_logo">
		<img alt="" src="img/rent_logo.jpg" width="100" height="70">
		<p class="mb-0">
			GUEST님
			<button value="로그인">로그인</button>
		</p>
	</div>

	<div class="text-center bordered mb-3 menu">
		<div class="row row_design">
			<div class="col border"><a href="#">예 약 하 기</a></div>
			<div class="col border"><a href="#">예 약 확 인</a></div>
			<div class="col border"><a href="#">자유게시판</a></div>
			<div class="col border"><a href="#">이 벤 트</a></div>
			<div class="col border"><a href="#">고 객 센 터</a></div>
		</div>
	</div>

</header> -->