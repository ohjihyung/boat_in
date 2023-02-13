<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="content-page">
	<div class="content">

		<div class="row mt-3">
			<div class="col-xl-12">
				<div class="card" style="height: 785px;">
					<div class="card-body">
						<div>
							<h1 style="font-weight:bold; text-align:center;">QNA</h1>
						</div>	
						<ul class="nav nav-tabs nav-bordered nav-justified" style="font-size: 1.3em">
							<li class="nav-item"><a href="#showUncomment" data-bs-toggle="tab" aria-expanded="true" class="nav-link active"><strong>답변 대기중</strong></a></li>
							<li class="nav-item"><a href="#showcomment" data-bs-toggle="tab" aria-expanded="false" class="nav-link "><strong>답변 완료</strong></a></li>						
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="showUncomment">
								  <div class="col-12">
								   <div class="card">
								   	<div class="card-body">								   
								   		<div class="table-responsive2">
								   				<table id="qna_dataTable"  class="table table-hover mb-0 dt-responsive nowrap w-100" style="font-size: 1.2em">
								   					<thead>
								   						<tr>
								   							<th style="width:10%">NO.</th>
								   							<th style="width: 15%">질문종류</th>
								   							<th style="width: 30%">제목</th>
								   							<th style="width: 17%">작성자</th>
								   							<th style="width: 13%">작성일</th>
								   							<th style="width: 10%">상태</th>
								   						</tr>
								   					</thead>								   					
								   					<tbody id="tbody_O">								   										   															   				
    												</tbody>
    											</table>
    										</div>    	
    									</div>
    								</div>
    							</div>	
							</div>
							
							<div class="tab-pane " id="showcomment">
								     <div class="col-12">
								   <div class="card" >
								   	<div class="card-body">								   
								   		<div class="table-responsive2">
								   				<table id="qna_dataTable2"  class="table table-hover mb-0 dt-responsive nowrap w-100" style="font-size: 1.2em">
								   					<thead>
								   						<tr>
								   							<th style="width:10%">NO.</th>
								   							<th style="width: 15%">질문종류</th>
								   							<th style="width: 30%">제목</th>
								   							<th style="width: 17%">작성자</th>
								   							<th style="width: 8%">작성일</th>	
								   							<th style="width: 5%">작성완료일</th>								   														   					
								   							<th style="width: 10%">상태</th>
								   						</tr>
								   					</thead>								   					
								   					<tbody id="tbody_O2">								   										   															   				
    												</tbody>
    											</table>
    										</div>    	
    									</div>
    								</div>
    							</div>		
							</div>							
						</div>																	          					                   					                   					                         				                            				      			                              					                         				                     				            				                     				       							
					</div>
				</div>
				<!-- end card-->
			</div>
			<!-- end col -->
		</div>

	</div>
	
	<!-- 답변등록 모달 -->
	<div id="full-width-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="fullWidthModalLabel" aria-hidden="true"  >
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div style="text-align:center">
					<h3 style="padding-bottom:10px;font-size: 1.7em"><strong>1:1문의 답변 등록</strong></h3>
					<span class="badge badge-soft-primary" style="font-size: 1.5em;font-weight: bold" id="fullWidthModalLabel"></span>
				</div>
				<input type="hidden" value="" id="qnaNo">
				
				<div class="modal-body" style="padding-left: 10%;padding-right: 10%;">
					<div class="border border-light pe-2  ps-2  pt-2 mb-4">
						
						<div class="d-flex align-items-start"><!-- 질문 적어주는 곳 -->
							<img class="me-2" style="width: 35px" alt="Generic placeholder image" src="/resources/profileImg/questionmark.png"> 
							<div class="w-100">
								<h5 class="" style="font-weight: bold;margin-bottom: 0%" id="qnaWriter"><!--memberId-->
								</h5>
								<span class="text-muted" style="font-size: 1em;" id="qnaDate"></span><!-- 날짜 -->
								<div class="pt-1" style="font-size: 1.15em" id="QnaQuestion"><!-- 질문내용 -->
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
                                                    <button type="button" class="btn btn-primary waves-effect waves-light ms-1" onclick="writeQna()">답변 등록</button>
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
	
	
	<!-- 답변수정 모달 -->
	<div id="full-width-modal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="fullWidthModalLabel2" aria-hidden="true"  >
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div style="text-align:center">
					<h3 style="padding-bottom:10px;font-size: 1.7em"><strong>1:1문의 답변 수정</strong></h3>
					<span class="badge badge-soft-primary" style="font-size: 1.5em;font-weight: bold" id="fullWidthModalLabel2"></span>
				</div>
				<input type="hidden" value="" id="qnaNo2">
				
				<div class="modal-body" style="padding-left: 10%;padding-right: 10%;">
					<div class="border border-light pe-2  ps-2  pt-2 mb-4">
						
						<div class="d-flex align-items-start"><!-- 질문 적어주는 곳 -->
							<img class="me-2" style="width: 35px" alt="Generic placeholder image" src="/resources/profileImg/questionmark.png"> 
							<div class="w-100">
								<h5 class="" style="font-weight: bold;margin-bottom: 0%" id="qnaWriter2"><!--memberId-->
								</h5>
								<span class="text-muted" style="font-size: 1em;" id="qnaDate2"></span><!-- 날짜 -->
								<div class="pt-1" style="font-size: 1.15em" id="QnaQuestion2"><!-- 질문내용 -->
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
                                               <textarea class="form-control" rows="6" cols="160" style="width:95%; resize: none;font-size: 1.15em" id="adminWrite2" ></textarea>
                                            </span>
                                                <div class="float-end" style="padding-right: 5%;padding-top: 2.5%">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                                    <button type="button" class="btn btn-primary waves-effect waves-light ms-1" onclick="modifyQna()">답변 수정</button>
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
	
	
<script type="text/javascript">
var datainput = document.querySelector("#tbody_O");
var datainput2 = document.querySelector("#tbody_O2");

$(document).ready(function(){
	showUncomment();
	showcomment();
});


//수정버튼 눌렀을때
function modifyQna(){
	console.log("modifyQna 잘들어옴");
	var qnaNo2 =document.querySelector("#qnaNo2").value;
	var qnaAnswer2 = document.querySelector("#adminWrite2").value;
	var xhr = new XMLHttpRequest();
	var data = {	
				qnaNo : qnaNo2,
				qnaAnswer : qnaAnswer2	
				};
	xhr.open("post",'/oneoone/adminAnswer',true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
		     var data =xhr.responseText;
		     if(data == "success"){
		    	 Swal.fire({
		    		  icon: 'success',
		    		  title: '답변 수정 완료',
		    		  showConfirmButton: false,
		    		  timer: 1500
		    		})
		    	showUncomment();
		    	showcomment();
		    	$('#full-width-modal2').modal('hide');
		     }
		
		}
	}
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(data));
}

//관리자가 글쓰고 답변 등록 눌렀을 때
function writeQna(){
	console.log("writeQna 잘들어옴");
	var qnaNo =document.querySelector("#qnaNo").value;
	var qnaAnswer = document.querySelector("#adminWrite").value;
	
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
		    		  timer: 1500
		    		})
		    	showUncomment();
		    	showcomment();
		    	$("#adminWrite").val("");
		    	$('#full-width-modal').modal('hide');
		     }
		
		}
	}
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(data));

}

//클릭한 글 상세보기 
function showqnaDetail(no){
	var title = document.querySelector("#fullWidthModalLabel");
	var writer = document.querySelector("#qnaWriter");
	var qnaDate = document.querySelector("#qnaDate");
	var QnaQuestion = document.querySelector("#QnaQuestion");
	var qnaNo = document.querySelector("#qnaNo");
	qnaNo.value = no;
	console.log("클릭한 글 상세보기 no :",no);
	var xhr = new XMLHttpRequest();
	var data = {qnaNo : no};
	xhr.open("post",'/oneoone/showDetail',true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
		     var data = JSON.parse(xhr.responseText);
		     console.log(data);
		     title.innerHTML = data.qnaTitle;
		     writer.innerHTML = data.memberId;
		     qnaDate.innerHTML = data.qnaDate;
		     QnaQuestion.innerHTML = data.qnaContent;
			$('#full-width-modal').modal('show');
		}
	}
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(data));
	
	
}

//수정할것 누르면 
function modifyqnaDetail(no){
	var title = document.querySelector("#fullWidthModalLabel2");
	var writer = document.querySelector("#qnaWriter2");
	var qnaDate = document.querySelector("#qnaDate2");
	var QnaQuestion = document.querySelector("#QnaQuestion2");
	var qnaNo = document.querySelector("#qnaNo2");
	var adminWrite2 = document.querySelector("#adminWrite2");
	qnaNo.value = no;
	console.log("클릭한 글 상세보기 no :",no);
	var xhr = new XMLHttpRequest();
	var data = {qnaNo : no};
	xhr.open("post",'/oneoone/showDetail',true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
		     var data = JSON.parse(xhr.responseText);
		     console.log(data);
		     title.innerHTML = data.qnaTitle;
		     writer.innerHTML = data.memberId;
		     qnaDate.innerHTML = data.qnaDate;
		     QnaQuestion.innerHTML = data.qnaContent;
		     adminWrite2.value = data.qnaAnswer;
		     showUncomment();
		     showcomment();
			$('#full-width-modal2').modal('show');
		}
	}
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(data));
}

//답변 완료한거 뿌려주는거
function showcomment(){
	var str  = "";
	var state ="답변완료";
	var qtype= "";
	var xhr = new XMLHttpRequest();
	xhr.open("post",'/oneoone/showcomment',true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
		     var data = JSON.parse(xhr.responseText);
		     for(i in data){
				str += `<tr>
					     <td>\${data[i].qnaNo}</td>
						 <td>\${data[i].qnaType}</td>
						 <td><a href="javascript:modifyqnaDetail(\${data[i].qnaNo})">\${data[i].qnaTitle}</a></td>
						 <td>\${data[i].memberId}</td>
						 <td>\${data[i].qnaDate}</td>				
						 <td>\${data[i].answerDate}</td>				
						 <td><span class="badge badge-soft-success">\${state}</span></td>	
						</tr>`;		   		    	 
		     }
		     datainput2.innerHTML= str;
		     tableShow2();
		}
	}
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send();
	
}

//관리자가 작성하지 않은 글 보여주기
function showUncomment(){
	var str  = "";
	var state ="답변대기";
	var qtype= "";
	var xhr = new XMLHttpRequest();
	xhr.open("post",'/oneoone/showUncomment',true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
		     var data = JSON.parse(xhr.responseText);
		     console.log(data);
		     for(i in data){
				str += `<tr>
					     <td>\${data[i].qnaNo}</td>
						 <td>\${data[i].qnaType}</td>
						 <td><a href="javascript:showqnaDetail(\${data[i].qnaNo})">\${data[i].qnaTitle}</a></td>
						 <td>\${data[i].memberId}</td>
						 <td>\${data[i].qnaDate}</td>			
						 <td><span class="badge badge-soft-danger">\${state}</span></td>			
						</tr>`;		   		    	 
		     }
		     datainput.innerHTML= str;
		     tableShow();
		}
	}
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send();

}


function tableShow(){
	var table = $('#qna_dataTable').DataTable({
	  	responsive:true,
		 retrieve: true,
		 scrollCollapse: true,
		 bAutoWidth: false, 
		 
		language: {
	      emptyTable: "올라온 질문이 없습니다",
	      lengthMenu: "_MENU_ 개씩 보기",
	      info: "현재 _START_ - _END_ / _TOTAL_건",
	      infoEmpty: "데이터 없음",
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
	      order: [ [ 0, "desc" ] ],
	});	
}

function tableShow2(){
	var table = $('#qna_dataTable2').DataTable({
		responsive:true,
		 retrieve: true,
		 scrollCollapse: true,
		 bAutoWidth: false, 
		language: {
	      emptyTable: "올라온 질문이 없습니다",
	      lengthMenu: "_MENU_ 개씩 보기",
	      info: "현재 _START_ - _END_ / _TOTAL_건",
	      infoEmpty: "데이터 없음",
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
	      order: [ [ 0, "desc" ] ],
	});	
}

</script>