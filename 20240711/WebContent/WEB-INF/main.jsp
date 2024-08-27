<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- <style>
.navbar_top {
	background: lightgray;
}

.search_top {
	width: 350px;
}

.navbar_img {
	width: 30px;
	height: 30px;
	padding-right: 5px;
}

.main_img {
	width: auto;
	height: auto;
}

</style> -->
</head>
<body>
	<!-- 자바 코드에서 sql 구문을 분리시키기 
		1. DB 연결 정보를 설정하는 xml
		2. 실제 sql 구문을 작성하는 xml
		3. DB 정보를 저장하는 파일
		4. xml 파일들을 읽어와서 자바 객체로 만드는 클래스 파일이 필요하다
	-->
	
	
		<img class="main_img" alt="이미지" src="${pageContext.request.contextPath}/img/boardimage.png" />
	<!-- 글쓰기
	1. 글쓰기 버튼을 클릭하면 MainController 가기
	2. insert.nhn 서블릿 호출
	3. insert.jsp 웹 페이지 보이기
	 -->
	<div>
		<input type="button" value="글쓰기" onclick="location.href='insert.nhn'" />
	</div>
	
<%-- 	<nav class="navbar bg-body-tertiary fixed-top pt-0 pb-0">
		<div class="container-fluid navbar_top">
			<a class="navbar-brand" href="#">오늘의 집</a>
			
			<div class="input-group mt-2 mb-2 search_top">
				<span class="input-group-text p-1" id="basic-addon1"><img class="navbar_img" alt="이미지" src="${pageContext.request.contextPath}/img/검색.png">
				<input type="text" class="form-control" placeholder="검색"
					aria-label="Username" aria-describedby="basic-addon1"></span>
			</div>
			
			<div>
				<a class="navbar-brand" href="#">로그인</a> <a class="navbar-brand"
					href="#">회원가입</a> <a class="navbar-brand" href="#">고객센터</a>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>

			<div class="offcanvas offcanvas-end" tabindex="-1"
				id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasNavbarLabel">Offcanvas</h5>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>
				
				<div class="offcanvas-body">
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Dropdown </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="#">Something else
										here</a></li>
							</ul></li>
					</ul>
					<form class="d-flex mt-3" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
				
			</div>
			
		</div>
		
	</nav> --%>

</body>
</html>