<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제이쿼리이용!</title>
<script defer src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>

<script defer src="${pageContext.request.contextPath}/js/login.js"></script>
</head>
<body>

	<!-- 프로젝트 세팅
		1. 외부라이브러리 포함하기
		2. mybatis 세팅
			db정보, xml 파일, 자바 객체 생성
			폴더명: project.mybatis
			
		만약 session에서 로그인이 되어있지 않다면 로그인을 입력하는 창을 보여주고 만약 session에서 로그인이 되었다면 **님 환영합니다.
	 -->
	<c:choose>
		<c:when test="${empty sessionScope.id}">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="email" id="id" name="id"
						placeholder="example@kings.com"></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" id="passwd" name="passwd"
						placeholder="6~16자 숫자/문자"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button id="login">로그인</button>
						<button id="register">회원가입</button>
					</td>
				</tr>
			</table>
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<td><b>${sessionScope.id}</b>님이 로그인 하셨습니다.</td>
				</tr>
				<tr>
					<td>
						<button id="logout">로그아웃</button>
						<button id="update">회원 정보 변경</button>
					</td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>

</body>
</html>