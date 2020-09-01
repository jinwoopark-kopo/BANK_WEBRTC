<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

	// work /////
	var passChangeAccount
	
	$("#menu-toggle").click(function(e) {
  		e.preventDefault();
  		$("#wrapper").toggleClass("toggled");
  	});
	
	$("#sendSMSAuth").bind('click', function(event) {
		
		socket.emit('work', 'smsAuth');
		
		
	})
	
	$("#work_selectAccount1000").bind('click', function(event) {
		
		$('#workBtns').empty();
		$('#workTitle').text('자유 입출금 계좌 조회')
		let content ='';
		content +=     '<button class="btn btn-info" id="userAccountList">자유 입출금 계좌 조회</button>&nbsp;&nbsp;&nbsp;&nbsp;';
		content +=     '<button class="btn btn-info" id="userDepositList">예금 조회</button>&nbsp;&nbsp;&nbsp;&nbsp;';
		content +=     '<button class="btn btn-info" id="userSavingList">적금 조회</button>&nbsp;&nbsp;&nbsp;&nbsp;';
		
		$('#workBtns').empty();
		$('#workBtns').append(content)
		
		$("#userAccountList").trigger("click");
	})
	
	$("#work_selectAccount1003").bind('click', function(event) {
		
		$('#workDiv').empty();
		let content = '';
		
		//content += '<div id="workName">예금 가입</div>';
		$('#workTitle').text('예금 업무')
		
		content +=     '<button class="btn btn-info" id="userDepositList">예금 가입 현황</button>&nbsp;&nbsp;&nbsp;&nbsp;';
		content +=     '<button class="btn btn-info" id="refDepositList">예금 상품 정보</button>&nbsp;&nbsp;&nbsp;&nbsp;';
		content +=     '<button class="btn btn-info" id="depositSignUp">예금 가입</button>';
		
		$('#workBtns').empty();
		$('#workBtns').append(content)
		$('#workDiv').empty();
		
		$("#userDepositList").trigger("click");
	})
	
	$("#work_selectAccount1004").bind('click', function(event) {
		
		$('#workDiv').empty();
		let content = '';
		
		//content += '<div id="workName">예금 가입</div>';
		$('#workTitle').text('적금 업무')
		
		content +=     '<button class="btn btn-info" id="userSavingList">적금 가입 현황</button>&nbsp;&nbsp;&nbsp;&nbsp;';
		content +=     '<button class="btn btn-info" id="refSavingList">적금 상품 정보</button>&nbsp;&nbsp;&nbsp;&nbsp;';
		content +=     '<button class="btn btn-info" id="savingSignUp">적금 가입</button>';
		
		$('#workBtns').empty();
		$('#workBtns').append(content)
		$('#workDiv').empty();
		
		$("#userSavingList").trigger("click");
	})
	
	$("#work_selectAccount1006").bind('click', function(event) {
		
		$('#workDiv').empty();
		let content = '';
		
		//content += '<div id="workName">예금 가입</div>';
		
		$('#workTitle').text('계좌 제신고')
		content +=     '<button class="btn btn-info" id="changePasswordBtn">계좌 비밀번호 변경</button>&nbsp;&nbsp;&nbsp;&nbsp;';
		content +=     '<button class="btn btn-info" id="LostReport">분실 신고/해제</button>';
		
		$('#workBtns').empty();
		$('#workBtns').append(content)
		$('#workDiv').empty();
		
		$("#changePasswordBtn").trigger("click");
	})
	
	document.getElementById("modal_close_btn").onclick = function() {
	
		$("#modal").fadeOut();
	}

	window.onbeforeunload = function() {
		sendMessage('bye');
	};

	
	function makeHyphen(accountNo, code){
	
		let str="";
		for( let i = 0; i < accountNo.length; i++) {
			str += accountNo[i];
			if(i == 2 || i == 8 )
				str += '-';
		}
		return str;
	}

	function comma(num){
	
		var len, point, str;
		num = num + "";
		point = num.length % 3;
		len = num.length;
		str = num.substring(0, point);
		while (point < len){
			if (str != "") str += ",";
			str += num.substring(point, point + 3);
			point += 3;
		}
		return str;
	}

	function encoding(text) {
		output = new String;
		temp = new Array();
		temp2 = new Array();
		textSize = text.length;
		for(i = 0; i< textSize; i++) {
			rnd = Math.round(Math.random() * 122) + 68;
			temp[i] = text.charCodeAt(i) + rnd;
			temp2[i] = rnd;
		}
		for(i = 0; i < textSize; i++) {
			output += String.fromCharCode(temp[i], temp2[i]);
		}
		return output;
	}
	
	function decoding(text) {
		output = new String;
		temp = new Array();
		temp2 = new Array();
		textSize = text.length;
		
		for(i = 0; i< textSize; i++) {
			temp[i] = text.charCodeAt(i);
			temp2[i] = text.charCodeAt(i+1);
		}
		for(i = 0; i < textSize; i = i+2) {
			output += String.fromCharCode(temp[i] - temp2[i]);
		}
		return output;
	}

</script>