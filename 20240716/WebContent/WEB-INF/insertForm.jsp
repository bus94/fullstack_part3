<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 정적파일을 등록한 서블릿 경로를 추가 - 절대경로로 사용! 프로젝트명 경로들을 설정	-->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<!-- 제이쿼리 라이브러리 파일 포함하기 -->
<script defer
	src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>

<script defer src="${pageContext.request.contextPath}/js/login.js"></script>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">Brand</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
			</ul>
		</div>
	</nav>

	<main class="container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<h2 class="my-4">회원가입</h2>
				<div class="text-center mb-3">
					<button class="btn btn-primary">
						<i class="fab fa-facebook-f"></i> Facebook
					</button>
					<button class="btn btn-warning">
						<i class="fab fa-kakao"></i> Kakao
					</button>
					<button class="btn btn-success">
						<i class="fab fa-line"></i> Line
					</button>
				</div>
				<form>
					<div class="form-group">
						<label for="email">이메일</label>
						<div class="input-group">
							<input type="text" class="form-control" id="email"
								placeholder="이메일"> <select class="form-control">
								<option>@gmail.com</option>
								<option>@naver.com</option>
								<option>@daum.net</option>
							</select>
						</div>

						<button type="button" class="btn btn-primary mt-2"
							id="checkEmail">이메일 중복확인</button>
					</div>
					<div class="form-group">
						<label for="password">비밀번호</label> <input type="password"
							class="form-control" id="password" placeholder="비밀번호">
					</div>
					<div class="form-group">
						<label for="confirmPassword">비밀번호 확인</label> <input
							type="password" class="form-control" id="confirmPassword"
							placeholder="비밀번호 확인">
					</div>
					<div class="form-group">
						<label for="nickname">닉네임</label> <input type="text"
							class="form-control" id="nickname" placeholder="별명 (2~20자)">
					</div>
					<div class="form-group">
						<label>약관동의</label>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="agreeAll">
							<label class="form-check-label" for="agreeAll">전체동의</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="agree14">
							<label class="form-check-label" for="agree14">만 14세 이상입니다
								(필수)</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="agreeTerms">
							<label class="form-check-label" for="agreeTerms">이용약관
								(필수)</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="agreePrivacy">
							<label class="form-check-label" for="agreePrivacy">개인정보
								수집 및 이용동의 (필수)</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								id="agreeMarketing"> <label class="form-check-label"
								for="agreeMarketing">개인정보 마케팅 활용 동의 (선택)</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="agreeEvent">
							<label class="form-check-label" for="agreeEvent">이벤트, 쿠폰,
								특가 알림 이메일 및 SMS 수신 (선택)</label>
						</div>
					</div>
					<div class="form-group">
						<div class="g-recaptcha" data-sitekey="your-site-key"></div>
					</div>
					<button type="submit" class="btn btn-primary btn-block">회원가입하기</button>
				</form>
			</div>
		</div>
	</main>

	<footer class="footer mt-auto py-3 bg-light">
		<div class="container text-center">
			<span class="text-muted">© 2024 Your Company</span>
		</div>
	</footer>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>

</body>
</html>