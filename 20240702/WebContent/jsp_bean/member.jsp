<%@page import="javax.websocket.Decoder.Text"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member.jsp</title>
</head>
<body>
	<form action="memberOK.jsp" method="post">
		<table width="500" border="1" cellpadding="5" cellspacing="0">
			<tr>
				<th colspan="2">회원가입</th>
			</tr>
			<tr>
				<th width="150">아이디</th>
				<td width="350"><input class="input" type="text" name="id"
					placeholder="아이디를 입력하세요" /></td>

			</tr>
			<tr>
				<th>이름</th>
				<td><input class="input" type="text" name="name"	
					placeholder="이름을 입력하세요" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input class="input" type="text" name="password"
					placeholder="비밀번호를 입력하세요" /></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input class="input" type="text" name="repassword"
					placeholder="비밀번호를 한 번 더 입력하세요" onkeyup="pwCheck()" />
					<div id="checkMsg"></div></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input class="input" type="text" name="age"
					placeholder="나이를 입력하세요" /></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="true" />남자 <input
					type="radio" name="gender" value="false" checked="checked" />여자</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="회원가입" /> <input type="reset" value="다시쓰기" /></td>
			</tr>


		</table>

		<%-- <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>" /> --%>

	</form>

	<%-- <%@ include file="./memberOK2.jsp"%> --%>
</body>
</html>