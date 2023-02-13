<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>BOAT-IN! LOG-IN!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">
<!-- App css -->
<link href="/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
<link href="/assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />

<link href="/assets/css/bootstrap-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
<link href="/assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />

<!-- icons -->
<link href="/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

<!-- google login  -->
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://apis.google.com/js/platform.js"></script>

<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<style type="text/css">
* {
	font-family: 'IBM Plex Sans KR', sans-serif !important;
}
</style>
</head>

<script type="text/javascript">


</script>
<body class="loading authentication-bg">
	<div id="bg" style="position: fixed; z-index: -5;">
		<video src="${pageContext.request.contextPath }/resources/commons/start/assets/css/images/main.mp4" width="100%" autoplay muted loop></video>
	</div>

	<div id="overlay"></div>
	<div id="main"></div>
	<script>
			window.onload = function() { document.body.classList.remove('is-preload'); }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		</script>
	<!-- 	<div class="account-pages mt-5 mb-5"> -->
	<!-- 		<div class="container"> -->
	<!-- 			<div class="row justify-content-center"> -->
	<!-- 				<div class="col-md-8 col-lg-6 col-xl-4"> -->
	<div class="card w-25" style="position: fixed; z-index: -2; bottom: 200px; right: 700px;">

		<div class="card-body p-3">

			<div class="text-center w-100 m-auto">
				<div class="auth-logo">
					<a href="/boatin" class="logo logo-dark text-center"> <span class="logo-lg"> <img src="/assets/images/logo-dark.png" alt="" height="50">
					</span>
					</a> <a href="/boatin" class="logo logo-light text-center"> <span class="logo-lg"> <img src="/assets/images/logo-light.png" alt="" height="50">
					</span>
					</a>
				</div>
				<h4>LOG-IN! BOAT-IN!</h4>
				<p class="text-muted mb-4 mt-1">아이디와 비밀번호를 입력해주세요.</p>
			</div>
			<button id="logintestbtn" type="button" class="btn btn-warning btn-xs waves-effect waves-light">ddit404@naver.com</button>
			<script type="text/javascript">
								$('#logintestbtn').on('click',function(){
									$('#loginId').val('ddit404@naver.com')
									$('#loginPw').val('1234')
									localStorage.setItem('id','ddit404@naver.com')
									$('#loginForm').submit();
								})
							</script>
			<button id="adminlogin" type="button" class="btn btn-warning btn-xs waves-effect waves-light">관리자</button>
			<script type="text/javascript">
								$('#adminlogin').on('click',function(){
									$('#loginId').val('admin')
									$('#loginPw').val('1234')
									localStorage.setItem('id','admin')
									$('#loginForm').submit();
								})
							</script>
			<form id="loginForm" action="main" method="post">

				<div class="my-2">
					<input class="form-control" type="email" id="loginId" name="memberId" required="" placeholder="아이디(이메일)" onkeydown="fnEnterKey()"> <input type="hidden" id="loginToken" name="memberToken"> <input type="hidden" id="loginName" name="memberName"> <input type="hidden" id="loginPic" name="memberPic">
				</div>

				<div class="my-2">
					<div class="input-group input-group-merge">
						<input type="password" id="loginPw" class="form-control" name="memberPw" placeholder="비밀번호" required onkeydown="fnEnterKey()">
						<div class="input-group-text" data-password="false">
							<span class="password-eye"></span>
						</div>
					</div>
				</div>
				<div class="row d-flex flex-row my-2">
					<div class="d-flex text-center justify-content-between">
						<div class="form-check my-auto">
							<input type="checkbox" class="form-check-input" id="checkbox-signin" checked> <label class="form-check-label" for="checkbox-signin">로그인 상태 유지</label>
						</div>
					</div>
				</div>
				<div class="text-center d-grid">
					<button id="loginBtn" class="btn btn-primary" type="button">로그인</button>
				</div>
				<!-- 소셜로그인-->
				<div class="d-flex flex-column  ">
					<div class="d-flex justify-content-center">
						<h5 class="text-muted">간편하게 로그인과 회원가입을 하세요!</h5>
					</div>
					<div class="d-flex justify-content-center">
						<div class="g_id_signin" data-type="icon" data-shape="circle"></div>
						<div class="ms-4">
							<a href="javascript:kakaoLogin()"> <img src="/assets/images/kakao-logo.png" style="width: 40px;" /></a>
						</div>
						<div id="g_id_onload" data-client_id="616281354554-lpmgnp2gmkaalfk8th0kbj77p0m720jg.apps.googleusercontent.com" data-callback="handleCredentialResponse" style="display: none;"></div>
					</div>
				</div>

			</form>



			<div class="row mt-3 ">
				<div class="text-center">
					<p class="mb-0">
						비밀번호를 잊으셨습니까? <a href="#" class="text-muted ms-1 me-1">비밀번호찾기</a>
						/ BOAT-IN이 처음이신가요? <a href="member/register" class="text-dark text-decoration-underline ms-1 m"><b>회원가입</b></a>
					</p>
<!-- 					<p class="mb-0"> -->
<!-- 					</p> -->
				</div>
				<!-- end col -->
			</div>
			<div class="text-center">
			 <a class="me-2">개인정보 처리 약관</a>
				<script>document.write(new Date().getFullYear())</script>
				&copy; BOAT-IN product by <a href="#!" class="link-dark text-decoration-underline"> WayVe</a>
			</div>
			<!-- end row -->

		</div>
		<!-- end card-body -->
	</div>
	<!-- end card -->

	<!-- 				end col -->
	<!-- 			end row -->
	<!-- 		end container -->
	<!-- 	end page -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->




	<!--  로그인 -->
	<script type="text/javascript">
	
function fnEnterKey(){
		if(window.event.keyCode == 13){
			$('#loginBtn').click();
	    }
		
	}	
		
var autoLogin_LI_H = $('#checkbox-signin').val()
var memberId_LI_H = localStorage.getItem('id')
var memberToken_LI_H = localStorage.getItem('token')

if (memberId_LI_H == '' || memberToken_LI_H =='') {
	localStorage.removeItem('id');
	localStorage.removeItem('token');
	localStorage.removeItem('pic');
}

/* 자동로그인 */
if ( memberId_LI_H != null && memberToken_LI_H != null) {
	console.log("자동로그인 ")
	 $('#loginId').val(memberId_LI_H)
	 $('#loginToken').val(memberToken_LI_H)
	 $('#loginForm').submit();
	
} 
	
$('#loginBtn').on('click', async function() {
	var saveIdCheck_LI_H = $('#checkbox-signin');
	var loginId_LI_H = $('#loginId').val();
	var loginPw_LI_H = $('#loginPw').val();

	var loginData_LI_H = {
		"memberId" : loginId_LI_H,
		"memberPw" : loginPw_LI_H
	}
	
	if(window.event.keyCode == 13){
		loginCheck(loginData_LI_H);
	}
	
	await loginCheck(loginData_LI_H);


})//click close


/* 일반로그인체크  */
function loginCheck(loginInfo){
			$.ajax({
				type : 'post',
				url : "/login", 
				dataType : 'json', 
				contentType : "application/json; charset=urf-8",
				data : JSON.stringify(loginInfo),
// 				data : loginInfo,
				success : function(res) { 
					console.log("콜백결과: "+ res)
					console.log(res)
					if (res.msg== "fail") {
						Swal.fire({
							icon : "error",
							title : "로그인실패",
							text : "아이디 혹은 비밀번호가 일치하지 않습니다.",
							footer : "<a href='#'>아이디 혹은 비밀 번호를 잃어버리셨습니까?</a>"
						})
						return;
					}else if (res.msg == "success"){ 
						console.log("결과: "+ res.msg)
						localStorage.setItem("id",res.memberVO.memberId)	 	
						localStorage.setItem("token",res.memberVO.memberToken)		
					
						$('#loginForm').submit();
					}
					
				} //success
			})
		}		
		
		
/* 소셜로그인 체크 */
function socailLoginCheck(loginInfo){
			$.ajax({
				type : 'post',
				url : "/socaillogincheck", 
				dataType : 'text', 
				contentType : "application/json; charset=urf-8",
				data : JSON.stringify(loginInfo),
				success : async function(res) { 
					console.log("콜백결과: "+ res)
					if (res == "already") {
						Swal.fire('이미 가입된 이메일 주소입니다. \n 비밀번호를 입력하여 주십시오.')
					}
					if (res== "fail") {
						Swal.fire({
							icon : "error",
							title : "로그인실패",
							text : "아이디 혹은 비밀번호가 일치하지 않습니다.",
							footer : "<a href>아이디 혹은 비밀 번호를 잃어버리셨습니까?</a>"
						})
					}else if (res == "success"){
						console.log("결과: "+ res)
							$('#loginForm').submit();
					}else if (res == "setPw"){
						console.log("결과: "+ res)
						var { value: newPw } = await Swal.fire({
							  title: '비밀번호를 입력해주세요.',
							  input: 'password',
							  inputLabel: '소셜 최초 로그인 입니다. \n 비밀번호를 설정해주세요.',
							})
							console.log(newPw)
						$('#loginPw').val(newPw)
						$('#loginForm').attr('action','/member/register');
						$('#loginForm').submit();
					}
					
				} //success
			})
		}		


</script>
	<!-- google login -->
	<script type="text/javascript">
	function handleCredentialResponse(response) {
	    const responsePayload = parseJwt(response.credential);
	    console.log("구글정보 : " +responsePayload)
	    console.log("구글정보 : " +responsePayload.picture)
		
		$('#loginId').val(responsePayload.email);
		$('#loginToken').val(responsePayload.sub);
		$('#loginName').val(responsePayload.name);
		$('#loginPic').val(responsePayload.picture);
		localStorage.setItem('id',responsePayload.email);
		localStorage.setItem('token',responsePayload.sub);
		
		var socailInfo={
				memberId : $('#loginId').val(), 
				memberToken: $('#loginToken').val(),
				memberName: $('#loginName').val(),
				memberPic: $('#loginPic').val()
		}
		
		
		socailLoginCheck(socailInfo);
		
	};

	function parseJwt (token) {
	    var base64Url = token.split('.')[1];
	    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
	    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
	        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
	    }).join(''));

	    return JSON.parse(jsonPayload);
	};
	
	</script>


	<!-- 카카오 스크립트 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
Kakao.init('cbfd91d2833351668be647432e1a4c13'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log("카카오정보 :::: ");
        	  console.log(response.id)
        	  var memberId =response.kakao_account.email
        	  var memberName = response.kakao_account.profile.nickname
        	  var memberPic = response.kakao_account.profile.profile_image_url
        	  var memberToken = response.id
        	//2619366167
        	//2619366167
	        	$('#loginId').val(memberId);
	      		$('#loginName').val(memberName);
	      		$('#loginPic').val(memberPic);
	      		$('#loginToken').val(response.id);
	      		localStorage.setItem('id',memberId);
	      		localStorage.setItem('token',memberToken);
        	  
        	  
        	  var memberVO ={
        		  memberId:memberId,
        		  memberName:memberName,
        		  memberPic:memberPic,
        		  memberToken:memberToken,
        	  }
        	  console.log(memberVO)
        	  socailLoginCheck(memberVO);
        	  
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>

	<script type="text/javascript">

</script>


	<!-- Right bar overlay-->
	<div class="rightbar-overlay"></div>


	<!-- Vendor js -->
	<script src="/assets/js/vendor.min.js"></script>
	<!-- Sweet Alerts js -->
	<script src="/assets/libs/sweetalert2/sweetalert2.all.min.js"></script>

	<!-- App js -->
	<script src="/assets/js/app.min.js"></script>


</body>
</html>