/**
 * 
 */

$(function() {
	console.log("list.js 실행!");
	
	$('#pageSearch').click(function() {
		let pagesize = $('select#pagesize').val();
		
		$.ajax({
			type : "POST",
			url : "list.do",
			data : pagesize,
			success : function(data) {
				console.log(data);
			}, 
			error : function(e) {
				console.log(e);
			}
		});
		
	})

});