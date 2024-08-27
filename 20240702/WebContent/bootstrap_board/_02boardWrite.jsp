<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_02boardWrite.jsp</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<style>
body {
	padding: 50px;
}

.table_size {
	width: auto;
}

.memo {
	width: 180px;
	height: 150px;
}
</style>

</head>
<body>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header text-center">
						<h2>새글 작성하기</h2>
					</div>
					<div class="card-body">
						<form method="post" action="_03boardWritePro.jsp">
							<div class="form-group">
								<label for="writer">작성자</label> <input type="text"
									class="form-control" id="writer" name="writer" required>
							</div>
							<div class="form-group">
								<label for="subject">제목</label> <input type="text"
									class="form-control" id="subject" name="subject" required>
							</div>
							<div class="form-group">
								<label for="email">이메일</label> <input type="email"
									class="form-control" id="email" name="email" required>
							</div>
							<div class="form-group">
								<label for="password">비밀번호</label> <input type="password"
									class="form-control" id="password" name="password" required>
							</div>
							<div class="form-group">
								<label for="content">내용</label>
								<textarea class="form-control" id="content" name="content"	rows="10" required></textarea>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">등록하기</button>
								<button type="reset" class="btn btn-secondary">다시 작성하기</button>
								<button type="button" class="btn btn-secondary"
									onclick="window.location.href='_04boardList.jsp'">목록으로</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- <h1>새글 작성하기</h1>
	<table class="table table-striped table-hover table-bordered table_size" border="1">

		<tr>
			<th>작성자</th>
			<td><input type="text" name="name"></td>
		</tr>

		<tr>
			<th>제목</th>
			<td><input type="text" name="title"></td>
		</tr>

		<tr>
			<th>이메일</th>
			<td><input type="text" name="email"></td>
		</tr>

		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pw"></td>
		</tr>

		<tr>
			<th>내용</th>
			<td><input type="text" name="memo" class="memo"></td>
		</tr>

		<tr>
			<td colspan="2" align="center"><input type="submit" value="등록하기">
				<input type="reset" value="다시 작성하기"> <input type="button"
				value="목록으로" onclick="location.href='_04boardList.jsp'"></td>
		</tr>

	</table>  --%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>