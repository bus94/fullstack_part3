<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myInfo.jsp</title>
</head>
<body>
	<%
		// 현재 프로젝트의 경로를 알고 싶을 경우
		// 이미지, 파일을 업로드, 다운로드 할 때 서버 경로를 이용해서 저장하고 읽기
		/* out.println(application.getRealPath("/")); - 현재 경로 확인 */

		// 현재 페이지에 입력한 데이터를 특정 페이지로 전송하려면 전송할 데이터를 입력하는 코드
		// action=속성은 submit이 클릭 되었을 때 action=jsp파일명 이 된다.
		// 현재 페이지를 다시 요청하려면 ? 를 쓰면 된다.

		// method 속성은 전송 방식을 나타낸다.
		// get 기본 값이고 url에 모든 내용 보인다.
		// post 모든 내용 안보인다.
	%>

	<form action="main.jsp" method="post">
		<label>이름: <input type="text" name="name">
		</label><br> <label>아이디: <input type="text" name="id">
		</label><br> <label>비밀번호: <input type="password" name="password">
		</label><br> <label>나이: <input type="text" name="age">
		</label><br>

		<fieldset style="width: 120px;">
			<legend>성별</legend>
			<input type="radio" name="gender" value="true">남자
			<input type="radio" name="gender" value="false">여자
		</fieldset>
		<br>

		<%-- 체크 박스 --%>
		<fieldset style="width: 200px;">
			<legend>취미</legend>
			<input type="checkbox" name="hobbies" value="등산">등산 <input
				type="checkbox" name="hobbies" value="바둑">바둑 <input
				type="checkbox" name="hobbies" value="낚시">낚시
		</fieldset>

		<select name="trip" style="width: 200px; height: 30px;">
			<option>여행지를 선택하세요.</option>
			<option>괌</option>
			<option>다낭</option>
			<option>코타키나발루</option>
			<option>나트랑</option>
			<option>푸꾸옥</option>
			<option>대만</option>
			<option>보라카이</option>
		</select><br> 
		
		<label>메모</label><br> 
		<input type="text" name="memo" style="width: 400px; height: 200px;" placeholder="메모를 작성해주세요">
		<br> 
		
		<input type="submit" value="정보보기">
	</form>

</body>
</html>