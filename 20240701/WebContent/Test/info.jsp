<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info.jsp</title>
</head>
<body>
	<%
// 		out.println(application.getRealPath("/"));
	%>

	<form action="main.jsp" method="post">
		<fieldset>
			<legend>성별</legend>
				<input type="radio" name="gender" value="남자">남자 
				<input type="radio" name="gender" value="여자">여자
		</fieldset><br>
		
		<fieldset>
			<legend>취미</legend>
				<input type="checkbox" name="hobbies" value="등산">등산
				<input type="checkbox" name="hobbies" value="바둑">바둑
				<input type="checkbox" name="hobbies" value="낚시">낚시
		</fieldset><br>
		
		<select>
			<option name="country" value="괌">괌
			<option name="country" value="다낭">다낭
			<option name="country" value="코타키나발루">코타키나발루
			<option name="country" value="나트랑">나트랑
			<option name="country" value="푸꾸옥">푸꾸옥
			<option name="country" value="대만">대만
			<option name="country" value="보라카이">보라카이
		</select><br>
		
		<label>메모</label><br>
		<input type="text" name="memo" style="width: 400px; height: 200px;" placeholder="메모를 작성해주세요">
		<br>
		<input type="submit" value="정보 전송">
	</form>
</body>
</html>