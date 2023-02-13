<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.7/dayjs.min.js"></script>
<style>
#chatMainimg {
	position: absolute;
	left: 40%;
	top: 50%;
	margin-left: 10px;
}

#roomDel-btn {
	text-align: center;
	margin-top: 16px;
}

#chat_modal {
	display: none;
	width: 300px;
	padding: 20px 60px;
	border: 1px solid #888;
	border-radius: 3px;
}

#chat_modal .chat_modal_close_btn {
	position: absolute;
	top: 10px;
	right: 10px;
}

#chatWrap {
	/*     width: 600px; */
	/*     border: 2px solid #ddd; */
	
}

#chatHeader {
	height: 50px;
	/* text-align: center; */
	line-height: 60px;
	font-size: 25px;
	font-weight: 900;
	/* 	    border-bottom: 1px solid #ddd; */
}

#chatLog {
	height: 700px;
	overflow-y: auto;
	scrollbar-width: none;
	padding: 10px;
	background: linear-gradient(to right, #F9EA8F, #AFF1DA);
	border-radius: 5px;
	margin-right: 10px;
}

.myMsg {
	text-align: right;
}

.anotherMsg {
	text-align: left;
	margin-bottom: 5px;
}

.msg {
	display: inline-block;
	border-radius: 15px;
	padding: 7px 15px;
	margin-bottom: 10px;
	margin-top: 5px;
}

.anotherMsg>.msg {
	background-color: #f1f0f0;
}

.myMsg>.msg {
	background-color: #0084FF;
	color: #fff;
}

.anotherName {
	font-size: 12px;
	display: block;
}

#chatForm {
	display: block;
	width: 100%;
	height: 50px;
	border-top: 2px solid #f0f0f0;
}

#message {
	width: 84%;
	height: calc(100% - 1px);
	border: none;
	padding-bottom: 0;
}

#message:focus {
	outline: none;
}

#chatForm>input[type=text] {
	outline: none;
	border: none;
	background: none;
	color: #0084FF;
	font-size: 17px;
}

::-webkit-scrollbar {
	width: 10px;
}

::-webkit-scrollbar-track {
	background-color: silver;
}

::-webkit-scrollbar-thumb {
	box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}

/* 	채팅방 이름 걍 때려박는 스타일 */
.chatTitle {
	font-weight: bold;
}
</style>
<div class="content-page">
	<div class="content" style="height: 800px;">
		<!-- Start Content-->
		<div class="container-fluid" style="display: flex; margin: 30px; height: 100%;">
			<div class="ms-5"style="width: 350px;">
				<div class="card" style="height: 100%;">
					<div class="card-body">
						<div class="d-flex justify-content-between mb-2">
							<div class="d-flex">
								<h4 class="header-title my-auto fs-2">
									채팅방 <i class="mdi mdi-account-multiple ms-1"></i>
								</h4>
							</div>
							<div class="d-flex">
								<button type="button" class="btn btn-primary btn-lg waves-effect waves-light" onclick="ojhF()">채팅방 생성</button>
								<button type="button" class="btn btn-primary" id="ojhModal" data-bs-toggle="modal" data-bs-target="#signup-modal" style="display: none;"></button>
							</div>
						</div>
						<div class="list-group" id="rList" style="overflow: auto; height: 750px;"></div>
					</div>
				</div>
			</div>
			<!-- container -->
			<div class="col-7 ms-2" style="height: auto;">
				<div class="card" style="height: 100%;">
					<div class="row">
						<div>
							<div id="chatWrap" class="ms-2" style="display: none;">
								<div id="chatHeader" class="mb-3 p-1 d-flex justify-content-between">
									<div id="Rbtn">
										<button class="btn btn-warning waves-effect waves-light btn-lg" id="roomDel-btn"  onclick="delRoom()">채팅방 나가기</button>
									</div>
									<div id="Rtitle"></div>
									<div id="ROut">
										<button class="btn btn-info waves-effect waves-light btn-sm mb-3 me-2" id="roomOut-btn" onclick="OutRoom()">x</button>
									</div>

								</div>
								<div id="chatLog" style="height:600px;"></div>
								<div id="chatForm">
									<input type="text" autocomplete="off" size="30" id="message" placeholder="메시지를 입력하세요" onkeydown="fnEnterKey()">

								</div>
							</div>
							<div id="filebox">
								<input type="file" id="my-input" style="visibility: hidden;" onchange="uploadmyFile()">
							</div>
							<div class="d-flex flex-row-reverse" id="chatUpload">
								<input type="hidden" class="btn btn-purple waves-effect waves-light" id="send" value="SEND" style="margin-right: 15px;"> <input type="hidden" id="id_exit" value="나갈령">
								<button id="chatFileBtn" type="button" class="d-none btn btn-warning waves-effect waves-light" onclick="onClickUpload();">
									<i class="mdi mdi-file-plus"></i>
								</button>
							</div>


						</div>
						<div id="chatMainimg">
							<img class="rounded-circle" src="/resources/src/images/canoe.png" style="width: 100px; height: 100px;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- 새로운방 만드는 모달창 -->
<!-- makeRoom modal content -->
<div id="signup-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="auth-logo text-center mt-2 mb-4">
					<a href="index.html" class="logo logo-dark"> <span class="logo-lg"> <img src="../assets/images/logo-dark.png" alt="" height="20">
					</span>
					</a> <a href="index.html" class="logo logo-light"> <span class="logo-lg"> <img src="../assets/images/logo-light.png" alt="" height="20">
					</span>
					</a>
				</div>

				<form id="createForm" class="px-3" action="javascript:createRoom()">
					<div class="mb-3">
						<label for="chatRoomName" class="form-label">채팅방 이름</label> <input class="form-control" type="text" id="chatRoomName" required="" placeholder="채팅방 이름">
					</div>

					<label for="chatRoomMember" class="form-label">초대할 인원</label> <input class="form-control" type="text" id="emailaddress" required="" placeholder="boat123@boat.com" style="display: none;" /> <select class="form-control select2-multiple" id="emailaddress2" data-toggle="select2" data-width="100%" multiple="multiple" data-placeholder="초대할 회원을 선택하세요.">
					</select>

					<div class="mb-3" id="selectBox"></div>
					<div id="invitedMem"></div>
					<div class="mb-3"></div>
					<div class="mb-3 text-center">
						<button class="btn btn-primary" type="button" onclick="createRoom()">생성</button>
					</div>
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
