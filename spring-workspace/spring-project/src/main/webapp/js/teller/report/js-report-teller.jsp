<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$('#reportArea').empty();
	$("input:radio[name='chk_info']:radio[value='1']").prop('checked', true); // 선택하기
	
	function checkInput() {
		console.log($('#reportTitle').val());
		console.log($('#reportArea').val());
		if($('#reportTitle').val() == '')
			return false;
		if($('#reportArea').val() == '')
			return false;
		/*
		$.ajax({
			url : 'http:192.168.217.41:9999/Mission-Spring/videoConsulting',
			type : 'get',
			async : false,
			data : {
				
			},
			success : function(data) {
				
				alert("dd")
				return false;
			},error : function(data) {
				
				alert("ss")
				return false;
			}
		})
		*/
	}
	
</script>
