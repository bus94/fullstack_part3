<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileUploadForm.jsp</title>
</head>
<body>
	<!-- 여러 가지 파일을 업로드 하고 싶을 경우에는
		톰캣에서 제공하는 part API를 이용해서 파일 업로드를 구현한다.
	 
	 파일 업로드를 할 때 multipart/form-data
	 form이 가지고 있는 input 타입의 값들과 file은 이진 데이터를 포함할 수 있다.
	 파일 업로드 시에는 무조건 multipart/form-data를 꼭 사용해야 한다.
	 폼 데이터를 여러 부분으로 나눠서 전송한다.
	 각 부분별로 인코딩 과정이 일어나기 때문에 파일이나 이진 파일 데이터를 포함해서 보낼 수 있다.
	 
	Form 태그로 전송하면 기본값으로 정해져 있다. (아래의 텍스트 내용으로)
	 application/x-www-form-urlencoded
	 텍스트 데이터를 url 인코딩 방식으로 전송한다.
	 파일 업로드를 지원하지 않는다.
	ex) name=hong&age=20 이런식으로 이동 (파일이 아닌 문자 형식으로 이동)
	 -->
	 
	 <form action="fileUploadOK.nhn" enctype="multipart/form-data" method="post">
	 	<input type="file" name="filename" /> <br>
	 	<input type="submit" value="파일전송">
	 </form>
	 
</body>
</html>