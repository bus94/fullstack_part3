<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header>
	<td><img src="img/logo.png"></td>

	<td>
		<%
			// 아이디가 로그인 되어있다면 session
			// 데이터가 있다면 로그인 된 정보를 띄워주고 만약 로그인이 되어있지 않다면 조건문으로 로그인할 수 있도록 아이디와 비밀번호를 입력받는다.
			String id = (String) session.getAttribute("id");

			if (id == null) {
		%> <!-- 로그인 페이지 만들기 --> <a href="list.jsp?book_kind=all">전체목록보기</a>
		<br>

		<form method="post" action="loginPro.jsp">
			아이디 : <input type="text" name="id" size="15" maxlength="50" autofocus>
			비밀번호 : <input type="password" name="passwd" size="15" maxlength="16">
			<input type="submit" value="로그인">
		</form> <font color="red">* 반드시 로그인을 하셔야 쇼핑을 하실 수 있습니다. *</font> <!-- <a href="#">전체목록보기</a> <br>
		아이디: <input type="text" name="id"> 비밀번호: <input type="text"
		name="pw"> 
		<button>로그인</button> <br> <span class="text-danger">*반드시
			로그인을 하셔야 쇼핑을 하실 수 있습니다.*</span> --> <%
 	} else {
 %> <!-- 전체목록 보기, 장바구니, 구매목록보기 버튼 추가 --> <a
		href="list.jsp?book_kind=all">전체목록보기</a> <a
		href="cartList.jsp?book_kind=all">장바구니 보기</a> <a href="buyList.jsp">구매목록보기</a>
		<br> <br> <b><%=id%>님, 즐거운 쇼핑시간이 되세요.</b> <input
		type="button" value="로그아웃" onclick="window.location.href='logout.jsp'">
		<%
			}
		%>
	</td>

</header>