<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FormResult.jsp</title>
</head>
<body>
	<h2>폼 제출 결과</h2>
	<p>이름: ${member.name }</p>
	<p>성별: ${member.gender }</p>
	<p>학력: ${member.grade }</p>
	<p>관심 사항: ${member.printArray() }</p>
</body>
</html>