<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>화상창구 상담 대기실 - 텔러</title>
<link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.request.contextPath }/resources/images/favicon/favicon.ico">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.dev.js"></script>
<!-- <script src="/spring-project/js/teller/waitRoom/waitRoom-teller.js"></script>  -->
<style>
	.title{
		font-size: xxx-large;
		text-align: center;
		margin-top : 150px;
	}
	
	div .col-md-7 {
		flex: none;
		max-width : none;
	}
	
	.menu {
		font-size: xx-large;
		text-align: center;
		margin-top : 130px;
	}
	
	#info {
		float:left; 
		font-size: xx-large;
		height:100%;
		width:50%;
		text-align:center;
		margin-top: 20%;
		display:inline-block;
	}
	
	#clientCount {
		
		font-size: xx-large;
		height:100%;
		text-align:center;
		margin-top: 5%;
	}
	
	#start {
		float:left; 
		font-size: x-large;
		height:100%;
		width:50%;
		text-align:center;
		margin-top: 10%;
		display:inline-block;
	}
	
	.job {
		
		width: 250px;
		height : 100px;
		border-color: white;
		font-size: xx-large;
		border-width: inherit;
		background-color: lightgray;
		border-radius: 20px 20px 20px 20px
	}
	
	#modal {
		display:none;
		position:fixed;
		width:100%;
		height:100%;
		z-index:1;
	}

	#modal h2 {
		margin:0;
	}

	#modal button {
		display:inline-block;
		width:100px;
		margin-left:calc(100% - 100px - 10px);
	}

	#modal .modal_content {
		position : relative;
		width:500px;
		padding:20px 10px;
		background:#fff;
		border:2px solid #ffffff;
		left:50%;
		top:40%;
		font-size:x-large;
		transform:translate(-50%, -50%);
		border-radius: 10px 10px 10px 10px;
	}

	#modal .modal_layer {
		position:fixed;
		top:0;
		left:0;
		width:100%;
		height:100%;
		background:rgba(0, 0, 0, 0.5);
		z-index:-1;
	}
	
	aside #link{
		padding-left: 25px;
	}
	
	aside .refMsg {
		margin-top : 100px;
		margin-right : 100px;
	}
	
	.btn-primary {
		width : 120px;
		height : 120px;
		
	}
	
	.stmInfo {
		
		font-size: x-large;
	}
	
	#STMlink {
		font-size: large;
		width : 350px;
		height : 50px;
		margin-top: 10px;
	}
	
	#modal_close_btn {
		border-color: white;
		border-width: inherit;
		background-color: lightgray;
		border-radius: 10px 10px 10px 10px;
		font-size: large;
	}
</style>
</head>
<body>
	<header>
		<%@include file="/WEB-INF/jsp/include/header_teller.jsp" %>
	</header>
	
	<div id="modal">
			<div class="modal_content">
			
				<div align="center" id="loading_image" style="width:100%; height:100%; text-align:center; font-size: large; color:black; font-weight:bold;">
								<img src="${ pageContext.request.contextPath }/resources/images/loading.gif"><br>
								손님, 잠시만 기다려주세요.<br>
								텔러와 연결중입니다.
				</div>
				<button type="button" id="modal_close_btn">취소하기</button>
    			<!-- 
    			<h2>모달 창</h2>
    			<p>모달 창 입니다.</p>
    			 -->
    		</div>
    	<div class="modal_layer"></div>    	
    </div>
    
      				
	<section>
		<div id="page-content">
    		<div class="container text-center">
    			<div class="row justify-content-center">
	    			<div class="col-md-7">
	    				<div class="title">웃는 얼굴로 손님을 맞아주세요. <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-emoji-smile" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  							<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  							<path fill-rule="evenodd" d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683z"/>
  							<path d="M7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
							</svg>
						</div>
						<div id="info">
							오늘 맞이한 손님 1명<br>
							<div id="clientCount">상담 대기 손님 0명</div>
						</div>
						
						<div id="start">
							<div>
    							<img src="${ pageContext.request.contextPath }/resources/images/startCall.png" style="width:7em; height:7em;">
    						</div>
    						<input type="button" class="job" id="startCounseling" value="업무 시작하기">
						</div>
						<!-- 
    					<div class="menu">
    						<div>
    							<img src="${ pageContext.request.contextPath }/resources/images/startCall.png" style="width:5em; height:5em;">
    						</div>
    						<input type="button" class="job" id="startCounseling" value="업무 시작하기">
    					</div>
						 -->
						
	    			</div>
    			</div>
    		</div>
    	</div>
	</section>
	<footer>
		<%@include file="/WEB-INF/jsp/include/footer.jsp" %>
	</footer>
</body>

<script>
$(document).ready(function() {
		
		
		var host = 'https://192.168.217.52';
		var port = '1337';
		//var url = 'https://192.168.217.52:1337'
		var url = 'https://localhost:1337'
		var socket;
		
		connectToServer();
		
		function connectToServer() {

			var options = {
				'forceNew' : true
			};
			//var url = "http://" + host + ":" + port;
			//var url = "https://" + host + ":" + port;
			println(url);
			socket = io.connect(url, options);

			socket.on('connect', function() {
				
				println("웹 소켓 서버에 연결되었습니다. : " + url);

				socket.on('check', function(event) {
					
					console.log('check Event');
					socket.emit('type', 'waitTeller')
				})
				
				//socket.emit('type', 'teller') 정의
				
				socket.on('ready', function(room) {
					
					var clientID = room.split(':')[0];
					var jobType = room.split(':')[1];
					
					console.log(room)
					
					var keys = new Array();
					keys.push('userID');
					keys.push('jobType');
					var values = new Array();
					values.push(clientID);
					values.push(jobType);
					
					//post_to_url("https://localhost:8811/spring-project/teller/bankCounter", "userID", clientID);
					post_to_url("https://localhost:8811/spring-project/teller/bankCounter", keys, values);
					//location.href="https://localhost:8811/spring-project/teller/bankCounter";
					console.log('joined: ' + room);
				})
				
				// 'message' event 날아왔을 때 행동 정의
				socket.on('message', function(message) {
					
					if(message ==='got user media') {
						
					}
				});
				
				socket.on('waitClient', function(event) {
					console.log('wait Client : ' + event);
					$("#clientCount").empty();
					$("#clientCount").append('상담 대기중인 손님 ' + event + '명');
				})
			});
			
			socket.on('disconnect', function() {
				println('웹 소켓 연결이 종료되었습니다.');
			});
		}
		
		$("#startCounseling").bind('click', function(event) {
			//println('bankJob 버튼이 클릭되었습니다.');
			//connectToServer('bankJob');
			
			sendStart();
			$("#modal").fadeIn();
		})
		
		document.getElementById("modal_close_btn").onclick = function() {
			
			$("#modal").fadeOut();
			//document.getElementById("modal").style.display="none";
			socket.emit('clientDisconnect');
    	}   
		
		function sendStart() {
			
			if(socket == undefined) {
				alert('You are not connected status. Connect Server.');
				return;
			}
			
			socket.emit('type', 'teller');
		}
		
		function println(data) {
			console.log(data);
			$('#result').append('<p>' + data + '</p>')
		}
	})
	
	function post_to_url(path, key, param) {
		let method = "post"; // 전송 방식 기본값을 POST로
  	 	
  	    var form = document.createElement("form");
  	    form.setAttribute("method", method);
  	    form.setAttribute("action", path);
  	    
  	    for(let i = 0; i < key.length; i++) {
  	    	var hiddenField = document.createElement("input");
  	    	hiddenField.setAttribute("type", "hidden");
  	    	hiddenField.setAttribute("name", key[i]);
  	    	hiddenField.setAttribute("value", param[i]);
  	    	console.log(key[i]);
  	    	console.log(param[i]);
  	    	
  	    	form.appendChild(hiddenField);
  	    }
  	    
  	    document.body.appendChild(form);
  	    form.submit();
  	}
</script>
</html>