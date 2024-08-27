/**
 * 
 */

$(function() {
	console.log("찍어보자!");

	// 이메일을 입력하고 이메일이 비었는지 확인하는 명령문. 만약 비어있지 않다면 ajax() 메서드를 이용해서 url 전달
	// emailCheck.do url이 들어오면 DB로 가기위해서 전처리를 한다.
	// Service 클래스 emailCheck() 생성해서 SqlSession 객체 가져오고 DAO클래스의 emailCheck() 메서드
	// 실행
	// xml파일에서 sql 실행
	// 결과를 ajax()로 보낸다.
	// 만약 성공 시 이미지 참조 실패 시 팝업

	$('#checkEmail').click(function() {

		var email = $('#email').val();

		if (email === '') {
			alert('이메일을 입력하세요');
			return;
		}
		$.ajax({
			type : "POST",
			url : "emailCheck.do",
			data : {
				email : email
			},
			// 성공 시 데이터를 받아주는 변수
			// → 변수명은 아무거나 작성해도 된다.
			success : function(data) {
				console.log(data);

				if (data.result) {
					alert('사용 가능한 이메일입니다.');
				} else {
					alert('사용 불가능한 이메일입니다.');
				}
			},
			error : function(e) {
				console.log("예외 발생!");
			}
		});

		/* check(); */

		/*
		 * if(status) { let query = { email : $('#email').val() }; $.ajax({ type :
		 * "POST", url : "emailCheck.do", data : query, success : function(data) {
		 * console.log(data); }, error : function(e) { console.log(e); } }); }
		 */

	});
	
	// 회원가입 버튼을 클릭했을 때 실행
	// 이메일, 비밀번호와 비밀번호(두 비밀번호 맞는지) 확인 입력
	// 닉네임이 입력되었는지 길이가 2자 이상인지 확인하고 ajax()로 데이터 보내기
	
});

/*
 * function check() { let email = $.trim($('#email').val());
 * 
 * if(!email) { return false; } }
 */