<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<style>
.backgroundColorDiv {
	/* 	border:1px solid  black; */
	border-radius: 50%;
	width: 55px;
	height: 55px;
	float: left;
	margin: 8px;
	cursor: pointer;
	text-align: center;
	padding-top: 2.2%;
}

.backgroundColorDiv:hover {
	treansform: scale(1.2);
	-webkit-transform: scale(1.2);
}

.bgCheckedIcon {
	font-size: 30px;
	display: none;
}

#gooleAnalyticsAdminhome:hover{
	cursor: pointer;
}

</style>







<div class="content-page" id="changeMyhomeBgDiv">
	<!-- 배경색 변경은 이 div에 줘야함 -->
	<div class="content">
		<div class="container-fluid">


			<div class="mt-2">
				<div class="row justify-content-center">
					<div class="col-xl-10">
						<div class="card-body" style="text-align: center">
							<div>
								<img src="" class="rounded-circle avatar-xxl" alt="profile-image" id="memberPicPrintTag">
							</div>
							<h1 style="font-weight: bold">
								안녕하세요, <span id="memberNamePrint"></span>&nbsp;님
							</h1>
						</div>
					</div>
				</div>
			</div>


			<div class="row justify-content-center">
				<div class="col-xl-10">

					<nav id="navbar-example2" class="navbar navbar-light bg-white px-3" style="border-radius: 5px">
						<a class="navbar-brand ps-2"  style="width: 119px;font-size:1.4em"><strong>HOME</strong></a>

						<div class="justify-content-center">
							<ul class="nav nav-pills">
								<li class="nav-item" style="font-size: 1em">
										<input type="text" id="inputDateInMyHome" style="text-align: center; outline-style: none; width: 50%; margin-left: 20%; border: none;font-weight: bold;font-size: 1.4em" readonly>
								</li>
							</ul>
						</div>
						<ul class="nav nav-pills">
							<li class="nav-item pe-2"><a href="#myHomeCostomizingModal" data-bs-toggle="modal" style="color:black;font-size: 1.2em;"><i class="fe-grid" style="font-weight: bold"><strong>&nbsp;홈 배경색 설정</strong></i></a></li>
								
						</ul>
					</nav>
				</div>
			</div>
			<br>

			
				
			<div class="row justify-content-center">	
				
				<div class="col-xl-5">
					<div class="card" style="height: 490px;">
						<div class="card-body">
							
								<div class="row">
									<h4 class="header-title mb-2 mt-1" style="font-size: 1.4em;padding-bottom: 0.5%">1:1 문의 미답변건</h4>
									<h5 class="card-subtitle text-muted mb-2" style="font-size: 1.2em"><strong>제목 클릭 시 답변 등록창 실행</strong></h5>	
								</div>	
								
												<table class="table table-hover table-centered mb-0" id="QnATableInAdminHome" style="font-size: 1.1em">
														<thead>
															<tr>
																<th style="width: 10%">NO</th>
																<th style="width: 25%">질문종류</th>
																<th style="width: 45%">제목</th>
																<th style="width: 20%">작성일</th>
															</tr>
														</thead>
														<tbody style="font-size: 1.12em">
														</tbody>
													</table>	          
						
					</div>
				</div>
			</div>

				<div class="col-xl-5">
					<div class="card" style="height: 490px;">
						<div class="card-body">
								<div class="row">
									<h4 class="header-title mb-2" style="font-size: 1.48em">Google Analytics&nbsp;<span class="text-warning" style="font-size: 1.25em"><iconify-icon icon="heroicons:chart-bar-solid"></iconify-icon></span></h4>
									<h5 class="card-subtitle text-muted" style="font-size: 1.2em"><strong>The Analytics API로 BOAT-IN 분석</strong></h5>	
								</div>

							<div class="row justify-content-center mt-4 pt-1">
								<div class="col-xl-5">
									<!-- item1 -->
									<div class="align-items-center border-bottom border-light pb-2 mb-1">
										<div class="d-flex align-items-center">
											<div class="avatar-md rounded-circle bg-soft-danger">
												<div style="width: 100%;text-align: center;padding-top: 20%;">
													<img src="/resources/dist/assets/images/users/map.png" style="width: 60%;">
												</div>
											</div>

											<div class="ms-2">
												<h4 class="mb-1 mt-1 fw-bold">사용자 위치 파악</h4>
											</div>
										</div>
									</div>
									<!-- item1 end -->
								</div>
								
								<div class="col-xl-5">
									<!-- item2 end -->
									<div class="align-items-center border-bottom border-light pb-2 mb-1">
										<div class="d-flex align-items-center">
											<div class="avatar-md rounded-circle bg-soft-primary">
												<div style="width: 100%;text-align: center;padding-top: 20%;">
													<img src="/resources/dist/assets/images/users/usercount.png" style="width: 63%;">
												</div>
											</div>

											<div class="ms-2">
												<h4 class="mb-1 mt-1 fw-bold">시간별 사용자 수</h4>
											</div>
										</div>
									</div>
									<!-- item2 end -->
								</div>	
								
								<div class="col-xl-5">
									<!-- item3 -->
									<div class="align-items-center border-bottom border-light py-2 my-1">
										<div class="d-flex align-items-center">
											<div class="avatar-md rounded-circle bg-soft-secondary">
												<div style="width: 100%;text-align: center;padding-top: 20%;">
													<img src="/resources/dist/assets/images/users/webpage.png" style="width: 60%;">
												</div>
											</div>

											<div class="ms-2">
												<h4 class="mb-1 mt-1 fw-bold">사용자 방문 페이지 파악</h4>
											</div>
										</div>
									</div>
									<!-- item3 end -->
								</div>
								
								<div class="col-xl-5">
									<!-- item4 end -->
									<div class="align-items-center border-bottom border-light py-2 my-1">
										<div class="d-flex align-items-center">
											<div class="avatar-md rounded-circle bg-soft-success">
												<div style="width: 100%;text-align: center;padding-top: 20%;padding-left: 5%;">
													<img src="/resources/dist/assets/images/users/time.png" style="width: 60%;">
												</div>
											</div>

											<div class="ms-2">
												<h4 class="mb-1 mt-1 fw-bold">시간에 따른 활성 사용자<br> 추세</h4>
											</div>
										</div>
									</div>
									<!-- item4 end -->
								</div>	
								
								<div class="col-xl-5">
									<div class="align-items-center border-bottom border-light py-2 my-1">
                                            <div class="d-flex align-items-center">
                                               <div class="avatar-md rounded-circle bg-soft-purple">
												<div style="width: 100%;text-align: center;padding-top: 20%;">
													<img src="/resources/dist/assets/images/users/computer.png" style="width: 60%;">
												</div>
											</div>

											<div class="ms-2">
												<h4 class="mb-1 mt-1 fw-bold">주요 기기 파악</h4>
											</div>
                                            </div>
                                        </div>
								</div>
								
								<div class="col-xl-5">
									<div class="align-items-center border-bottom border-light py-2 my-1">
                                            <div class="d-flex align-items-center">
                                                <div class="avatar-md rounded-circle bg-soft-pink">
													<div style="width: 100%;text-align: center;padding-top: 20%;">
														<img src="/resources/dist/assets/images/users/percent.png" style="width: 60%;">
													</div>
												</div>

												<div class="ms-2">
													<h4 class="mb-1 mt-1 fw-bold">사용자 유지률</h4>
												</div>
                                            </div>
                                        </div>
								</div>
									
								
								</div><!-- 2번째 row끝 -->
								
								<div class="row justify-content-center mt-3">
									<div class="col-xl-10">
										<div style="text-align: center;">
											<button style="font-size: 1.4em;width:100%" type="button" class="btn btn-primary waves-effect waves-light" onclick="window.open('https://analytics.google.com/analytics/web/?hl=ko#/report-home/a250498191w351326102p283802461)');">
												<strong>
													 Google Analytics에서 확인하기
												</strong>
											</button>
										</div>
									</div>
								</div>
								
							</div>

						</div>
					</div>
				</div>
				
				
				
			</div>

			<!-- 	 		<div style="height:100px"></div>배경색 끝까지 채우기 위해서 필요 -->

				


			<!-- 사용자 지정 관련 모달 -->
			<div id="myHomeCostomizingModal" class="modal fade" tabindex="-1" style="display: none;" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div style="text-align: center">
							<h2 style="padding-bottom: 10px;">
								<strong>홈 배경색 설정</strong>
							</h2>
						</div>
						<div class="modal-body p-4">
							<div class="row">
								<div class="mb-3">
<!-- 									<label for="#colorPreviewDiv" class="form-label" style="font-size: 1.2em; margin-left: 3%;">배경</label> -->
									<div id="colorPreviewDiv">
										<div class="backgroundColorDiv" style="background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);" id="bgcolor111">
											<i class="fe-check bgCheckedIcon" id="bgcolorIcon111"></i>
										</div>
										<div class="backgroundColorDiv" style="background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);" id="bgcolor222">
											<i class="fe-check bgCheckedIcon" id="bgcolorIcon222"></i>
										</div>
										<div class="backgroundColorDiv" style="background-image: linear-gradient(45deg, #ff9a9e 0%, #fad0c4 99%, #fad0c4 100%);" id="bgcolor333">
											<i class="fe-check bgCheckedIcon" id="bgcolorIcon333"></i>
										</div>
										<div class="backgroundColorDiv" style="background-image: linear-gradient(to top, #a18cd1 0%, #fbc2eb 100%);" id="bgcolor444">
											<i class="fe-check bgCheckedIcon" id="bgcolorIcon444"></i>
										</div>
										<div class="backgroundColorDiv" style="background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);" id="bgcolor555">
											<i class="fe-check bgCheckedIcon" id="bgcolorIcon555"></i>
										</div>
										<div class="backgroundColorDiv" style="background-color: #ecf2f5" id="bgcolor666">
											<i class="fe-check bgCheckedIcon" id="bgcolorIcon666"></i>
										</div>
									</div>
								</div>
								<!-- 배경색 변경 div끝! -->
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary waves-effect waves-light" onclick="updateMyhomeBgColor()">저장</button>
						</div>
					</div>
				</div>
			</div>
			


		</div>
	</div>


	<div id="qnaAnswerModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="qnaAnswerModal" aria-hidden="true"  >
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div style="text-align:center">
					<h3 style="padding-bottom:10px;font-size: 1.7em"><strong>1:1문의 답변 등록</strong></h3>
					<span class="badge badge-soft-primary" style="font-size: 1.5em;font-weight: bold" id="qnaTitleSpan"></span>
				</div>
				<input type="hidden" value="" id="qnaNo">
				
				<div class="modal-body" style="padding-left: 10%;padding-right: 10%;">
					<div class="border border-light pe-2  ps-2  pt-2 mb-3">
						
						<div class="d-flex align-items-start"><!-- 질문 적어주는 곳 -->
							<img class="me-2" style="width: 35px" alt="Generic placeholder image" src="/resources/profileImg/questionmark.png"> 
							<div class="w-100">
								<h5 class="" style="font-weight: bold;margin-bottom: 0%" id="qnaMemberId"><!--memberId-->
								</h5>
								<span class="text-muted" style="font-size: 1em;" id="qnaRegDate"></span><!-- 날짜 -->
								<div class="pt-1" style="font-size: 1.15em" id="qnaContent"><!-- 질문내용 -->
									<br>
								</div>
							</div>
						</div>


						<div class="post-user-comment-box ps-4">
							<div class="d-flex align-items-start">
								<img class="me-2 avatar-sm rounded-circle" src="/resources/profileImg/WayVe.png" alt="Generic placeholder image">
								<div class="w-100">
									<form class="comment-area-box mb-3">
                                            <span class="input-icon">
                                               <textarea class="form-control" rows="6" cols="160" style="width:95%; resize: none;font-size: 1.15em" id="adminWrite" placeholder="답변을 입력하세요"></textarea>
                                            </span>
                                                <div class="float-end" style="padding-right: 5%;padding-top: 2.5%">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                                    <button type="button" class="btn btn-primary waves-effect waves-light ms-1" onclick="registerQna()">답변 등록</button>
                                                </div>
                                        </form>
								</div>
							</div>
						</div>
						
					</div><!-- 전체 border div -->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>



	<script>
var myHomeBgColor = "";

$(function() {
	getMemberNameAndImg()
	getTodayDate()
	changeMyhomeBg()
	QnATableInAdminHome()
})

function getTodayDate(){
	var curDate = new Date();

	var todayYear = curDate.getFullYear();
	var todayMonth = curDate.getMonth() + 1;
	var todayDate = curDate.getDate();
	
	var todayValue = todayYear + "-";
	if(todayMonth < 10){
		todayValue += "0";
	}
	todayValue += todayMonth + "-";
	if(todayDate < 10){
		todayValue += "0";
	}
	todayValue += todayDate;
	
	$("#inputDateInMyHome").attr("value", todayValue);
}


function getMemberNameAndImg(){
	   
	var memberNamePrint = document.querySelector("#memberNamePrint");
	var memberPicPrintTag = document.querySelector("#memberPicPrintTag");
	var changeMyhomeBgDiv = $("#changeMyhomeBgDiv");
	
	var memberId ={
	         memberId : localStorage.getItem('id')
	   }

	$.ajax({
	      url : "/myhome/selectMemberbyHome",
	      type : "post",
	      data : JSON.stringify(memberId),
	      contentType : 'application/json; charset=utf-8',
	      dataType : 'json',
	      success : function(res) {
// 	         console.log("myhome정보확인: ", res)
	    	  
	         memberNamePrint.innerText = res.memberName;
	         if(res.memberPic == 0){
	        	 memberPicPrintTag.src = "${pageContext.request.contextPath }/resources/dist/assets/images/users/blank_progile.png"
	         }else{
	         	memberPicPrintTag.src = res.memberPic;
	         }
	         
	         if(res.myhomeColor == 0) {
	        	 changeMyhomeBgDiv.css("background-image", "none");
	        	 changeMyhomeBgDiv.css("background-color", "#ecf2f5");
	        	 $("#bgcolorIcon666").show();
	         }
	         if(res.myhomeColor == 1) {
	        	 changeMyhomeBgDiv.css("background-image", "linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%)");
	        	 $("#bgcolorIcon111").show();
	         }
	         if(res.myhomeColor == 2) {
	        	 changeMyhomeBgDiv.css("background-image", "linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%)");
	        	 $("#bgcolorIcon222").show();
	         }
	         if(res.myhomeColor == 3) {
	        	 changeMyhomeBgDiv.css("background-image", "linear-gradient(45deg, #ff9a9e 0%, #fad0c4 99%, #fad0c4 100%)");
	        	 $("#bgcolorIcon333").show();
	         }
	         if(res.myhomeColor == 4) {
	        	 changeMyhomeBgDiv.css("background-image", "linear-gradient(to top, #a18cd1 0%, #fbc2eb 100%)");
	        	 $("#bgcolorIcon444").show();
	         }
	         
	       	 if(res.myhomeColor == 5) {
	        	 changeMyhomeBgDiv.css("background-image", "linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%)");
	        	 $("#bgcolorIcon555").show();
	         }
	         
	      }
	   });//ajax
}

function changeMyhomeBg(){
	
	$("#bgcolor111").on("click", function(){
		$(".bgCheckedIcon").hide();
		myHomeBgColor = "1"
		$("#bgcolorIcon111").show();
	})
	$("#bgcolor222").on("click", function(){
		$(".bgCheckedIcon").hide();
		myHomeBgColor = "2"
		$("#bgcolorIcon222").show();
	})
	$("#bgcolor333").on("click", function(){
		$(".bgCheckedIcon").hide();
		myHomeBgColor = "3"
		$("#bgcolorIcon333").show();
	})
	$("#bgcolor444").on("click", function(){
		$(".bgCheckedIcon").hide();
		myHomeBgColor = "4"
		$("#bgcolorIcon444").show();
	})
	$("#bgcolor555").on("click", function(){
		$(".bgCheckedIcon").hide();
		myHomeBgColor = "5"
		$("#bgcolorIcon555").show();
	})
	$("#bgcolor666").on("click", function(){
		$(".bgCheckedIcon").hide();
		myHomeBgColor = "0"
		$("#bgcolorIcon666").show();
	})
	
}


function updateMyhomeBgColor(){
// 	alert(myHomeBgColor);

	   let myhomeVO = {
	         memberId : localStorage.getItem('id'),
	         myhomeColor : myHomeBgColor
	   }

	$.ajax({
		type: "post",
		url: "/myhome/updateBgColor",
		data: JSON.stringify(myhomeVO),
		contentType: "application/json; charset=utf-8",
		dataType: "text",	
		success: function(res){
			console.log(res)
			$("#myHomeCostomizingModal").modal("hide");
			if(res == "성공") {
				Swal.fire({
					  position: 'center',
					  icon: 'success',
					  title: '설정이 완료됐습니다',
					  showConfirmButton: false,
					  timer: 1500
					})
			}
			if(res == "실패") $('#myhomeColorUpdateFailedAlert').modal("show");
			
			getMemberNameAndImg();
		}
	})
	
}


function QnATableInAdminHome(){
	var table = $('#QnATableInAdminHome').DataTable({
// 		responsive:true,
		 retrieve: true,
	//		 scrollX: true,
		scrollCollapse:true,
		searching: false,
		lengthChange: false,
		 bAutoWidth: false, //자동너비
	//		columns:[
	//			{data : "컬럼명"},
	//			{data : "컬럼명"},
	//		]
		language: {
	        emptyTable: "미답변건이 없습니다",
	        lengthMenu: "_MENU_ 개씩 보기",
	        info: "현재 _START_ - _END_ / _TOTAL_건",
	        infoEmpty: "0건",
	        infoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
	        search: "",
	        zeroRecords: "일치하는 데이터가 없습니다.",
	        loadingRecords: "로딩중...",
	        processing: "잠시만 기다려 주세요.",
	        paginate: {
	          next: "다음",
	          previous: "이전",
	        },
	      },
	        order: [ [ 3, "desc" ] ],
	        pageLength: 5,
	})//dataTable 설정
	table.clear().draw();
	
	$.ajax({
		url:"/myhome/qnaNoAnswerList",
		type: "get",
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(res) {
			
			for (var i = 0; i < res.length; i++) {
				table.row.add([
					`<td>\${i+1}</td>`,
					`<td>\${res[i].qnaType}</td>`,
					`<td><a href = "javascript:showQnaDetail(\${res[i].qnaNo})" >\${res[i].qnaTitle}</a></td>`,
					`<td>\${res[i].qnaDate}</td>`,
				]).draw(false)
			}//for문끝
		}
	})
	
}

function showQnaDetail(no){
	var data = {qnaNo : no};
	let qnaNo = $("#qnaNo");
	let  qnaTitleSpan = $("#qnaTitleSpan");
	let qnaMemberId = $("#qnaMemberId");
	let qnaRegDate = $("#qnaRegDate");
	let qnaContent = $("#qnaContent");
	
	$.ajax({
		url:"/myhome/showQnaDetail",
		type: "post",
		data: JSON.stringify(data),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(res) {
			let title = res.qnaTitle;
			let memberId = res.memberId;
			let qnaDate = res.qnaDate;
			let content = res.qnaContent;
			
			qnaTitleSpan.html(title);
			qnaMemberId.html(memberId)
			qnaRegDate.html(qnaDate);
			qnaContent.html(content);
			
			qnaNo.val(res.qnaNo);
			
			$("#qnaAnswerModal").modal("show");
			
			
		}
	})
}

function registerQna(){
	var qnaNo =document.querySelector("#qnaNo").value;
// 	console.log("될까요?", qnaNo);
	var qnaAnswer = document.querySelector("#adminWrite").value;
// 	console.log("될까요?", qnaAnswer);

	if(qnaAnswer.length == 0){
		Swal.fire('답변 입력 후 등록 버튼을 눌러주세요')
		$("#adminWrite").focus();
		return;
	}
	
	var xhr = new XMLHttpRequest();
	var data = {	
				qnaNo : qnaNo,
				qnaAnswer : qnaAnswer	
				};
	xhr.open("post",'/oneoone/adminAnswer',true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			
		     var data =xhr.responseText;
		     if(data == "success"){
		    	 Swal.fire({
		    		  icon: 'success',
		    		  title: '답변 등록 완료',
		    		  showConfirmButton: false,
		    		  timer: 1200
		    		})
		    	$("#adminWrite").val("");
		    	$('#qnaAnswerModal').modal('hide');
		    	QnATableInAdminHome()
		     }
		}
	}
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(data));
}

//////////김진호
//드래그 이벤트주기용
var dragItems = document.querySelectorAll(".homeDraggable");
drag(dragItems);
  function drag(target) {
    target.forEach((container) => {
      //인자로 자식 div들을 받음
      //console.log("드래그왜안돼 : ", container);
      new Sortable(container, {
        group: {
          name: "shared", //이게 같은 Sortable 객체들끼리 이동 가능
        },
        swapThreshold: 1,
        animation: 150,
        ghostClass: "blue-background-class",
        //sort: false, 이거 false하면 원래 영역 내에서는 안움직임
        onChoose: function (event) {
          //클릭한 아이템
          //선택한 영역 안에 테이블 목록
        },
        filter: ".filtered",
        onEnd: function (event) {
          //내려놓았을때!
          console.log("이동중", event.from);
          console.log("엔드아이템 : ", event.item);
        },
      });
    });
  }
  
  
  
</script>

