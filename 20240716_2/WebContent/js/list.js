/**
 * 
 */

$(function() {
	console.log("list.js 실행!");
	
	$('#pageSearch').click(function() {
		let pagesize = $('select#pagesize').val();
		
		$.ajax({
			type : "POST",
			url : "listOK.do",
			data : {pagesize : pagesize},
			success : function(data) {
				console.log(pagesize);
				console.log(typeof data);
				console.log(data);
				str = '<tr>'; 
                /*$.each(data, function(i) {
                	 str += '<td>' + data.list[i].getSubject + '</td><td>' + data.list[i].getName + '</td><td>' + data.list[i].getWriteDate + '</td><td>' + data.checkCount + '</td>';
                     str += '</tr>';
                });*/
             $('#tbody').append(str);
			}, 
			error : function(e) {
				console.log(e);
			}
		});
		
	})

});
/*
 * String 타입으로 넘어온 list의 데이터를 어떻게 출력할 수 있는지 고민하기
 * 그리고 반복문을 통해 해당 내용들을 테이블에 출력하기 (이후엔 페이지 버튼 활성화 시키고 조회수 증가 기능 추가하기)
 * 
 * 출력 x
 * console.log(data.endNo);
 * console.log(data.getEndNo);
 * console.log(endNo);
*/
