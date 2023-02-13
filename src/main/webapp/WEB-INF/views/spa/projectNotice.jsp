<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.ql-syntax {
  background: black   !important;
  color: white        !important;
}
.hljs-type {
  color: #EE75C6      !important;
}

.jinyoungFont {
	font-size: 1.5em;
}

.fontLavel {
	font-size: 1.2em;
}

.buttonFont {
	font-size: 20px;
}

.toastui-editor-contents p, pre code{
	font-size: 1.5em;
}


</style>
<body>

<!-- Start Content-->
<div class="content">
	<!-- Start container -->
	<div class="container-fluid">

		<!-- Start page title -->
		<div class="row">
			<div class="col-lg-10">
<!-- 				<div class="page-title-box"> -->
<!-- 					<h4 class="page-title">PROJECT NOTICE</h4> -->
<!-- 					<div> -->
<!-- 						<ol class="breadcrumb m-0"> -->
<!-- 							<li class="breadcrumb-item"><a href="javascript: void(0);">BOAT-IN</a></li> -->
<!-- 							<li class="breadcrumb-item active">PROJECT NOTICE</li> -->
<!-- 						</ol> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
		</div>
		<!-- End page title -->

		<!-- Start list-target -->
		<div class="row justify-content-center" >
			<div class="col-12">
				<div class="card" style="margin-top: 30px" >
					<div class="card-body" style="min-height: 670px;" >
						<div class="row justify-content-center jinyoungFont" id="list-target" >
							<!--여기 위의 타겟에 계속 바뀌어서 내용 그려주기 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--End list-target -->

	</div>
	<!-- End container -->
</div>
<!-- End Content-->

</body>

<script type="text/javascript">
//console.log("proNo : ", proNo);
var globalProNo = proNo;
//console.log("globalProNo : ", globalProNo) // 해당 프로젝트 번호 전역변수 선언
var globalProNoticeNo;
var globalMemberId;
var globalProNoticeDate;



function pronoticeDetail_C(proNoticeNo) {
    //console.log("조회할 글 번호", dviNo);
    const proNoticeNoVO = {
        proNoticeNo,
    };
    //console.log("보낼 객체 pronoticeDetail_C(선택 공지사항 글번호) : ", proNoticeNoVO);

    axios
        .post("/projectNotice/select", proNoticeNoVO)
        .then((res) => {
            console.log("/projectNotice/select 성공시 data=====>", res.data);
            const data = res.data;
            
            renderDetail_C(data); // 디테일 화면그리기
//          alert("불리남?");          
//          getMemberDetail_C();    // 댓글 이미지 넣어주기
            
            globalProNoticeNo = proNoticeNo;// 전역에 공지사항 글번호 담아준다  결국 디테일 볼때 무조건 이걸 거치니까!
        })
};

function getProMemberId_H(proVO){
	   var proMemberId;
	   $.ajax({
	      url : "/proquanti/detailproject",
	      type : "post",
	      async : false,
	      data : JSON.stringify(proVO),
	      contentType : 'application/json; charset=utf-8',
	      dataType : 'json',
	      success : function(res) {
	    	  proMemberId = res.memberId      
	      }
	   })
	   return proMemberId;
	}


// // 그 공지사항의 관리자 찾기
// function proNoticeMemberId(){
// 	globalProNo = proNo;
// 	console.log("globalProNo 공지사항 관리자 찾기 : ", globalProNo)

// 	console.log("globalMemberId  관리자 찾기 : ", globalMemberId);
	
// 	$.ajax({
// 		type:"post",
// 		url:"/projectNotice/selectProjectManagerId",
// 		data: {proNo: proNo},
// 		async:false,
// 	    dataType:"json",
// 	    success:function(res){
// 	     	console.log("채진영 /projectNotice/selectProjectManagerId 성공시!:",res);
// 	     	pro.proMemberId
// 		     	console.log("res.data :::::: ", res.data);
// 		     	receiverId.push(res.data) 		     	
// 		     	// 여기서 이걸 처리해줘야하나???? 지형이 오면 물어보기
		    
	     	
// 	    }//end of success
// 	})// end of $.ajax
		
		
		
		
// // 	axios
// // 	.post("/projectNotice/selectProjectManagerId?proNo=" + globalProNo)
// // 	.async(false)
// // 	.then((res) => {
// // 		console.log("selectProjectManagerId 성공시 data=====>", res.data);
// // 		globalMemberId = res.data;
// // 		console.log("globalMemberId 담긴 data=====>", globalMemberId);
// // 		return globalMemberId;
		
// // 		let localMemberId = localStorage.getItem("id");
		
// // 		if(globalMemberId == localMemberId){
// // 			var newBtn = document.querySelector("#newBtn");
// // 			newBtn.style.display = 'inline';
// // 		}
// //	});
	
	
// } 

$(function(){ renderPronoticeList_C(); }) //리스트 그려주기 처음 시작 바로

function drawDataTable(){  }	// 데이터 데이블 그려주기



// 리스트 그리기 시작
function renderPronoticeList_C() {
	
	
  str = "/projectNotice/projectNoticeList?proNo="+proNo
		  
  axios
    .get(str)
    .then((res) => {//ajax일때는 success 안에 쓸 것.
    	//console.log("게시물(프젝공지사항List) ::", res.data);
    	const json = res.data;
    	
    	let text = ``;
//     	text += `<div class="col-12">`;
//     	text += `	<div class="card" >`;
//     	text += `		<div class="card-body" style="padding-right: 3rem; padding-left: 3rem;">`;
//     	text += `			<h5 class="mt-0">프로젝트 공지사항</h5> <br>`;
//     	text += `			<div class="table-responsive">`;
//     	text += `				<div class="inbox-widget" data-simplebar style="max-height: 700px;">`;
	
		text += `
							<div class="row mt-2" id="tableMsg">
								<div class="col-12">
									<div class="text-center">
									<img class="avatar-sm" src="/resources/src/images/확성기2.png">
									<h1 class="mt-2 fw-bold"> 프로젝트 공지사항 </h1>
									<h3 class="mt-2 mb-4"> 해당 프로젝트에서 알려드립니다. </h3>
									<hr style="width: 80%; margin-left: auto; margin-right: auto;">
									</div>
								</div>	
							</div>	
				`;


		text += `			<div class="row justify-content-center">`;
    	text += `				<div class="col-lg-10 table-responsive" style="margin-top: 10px">`;
    	text += `					<table id="pronoticeList_dataTable"  class="table dt-responsive nowrap w-100 ">`;
    	text += `						<thead class="table-light">`;
    	text += `							<tr>`;
    	text += `								<th style="width: 15%;">글번호</th>`;
    	text += `								<th style="width: 55%;">제목</th>`;
    	text += `								<th style="width: 15%;">작성자</th>`;
    	text += `								<th style="width: 15%;">작성일</th>`;
    	text += `							</tr>`;
    	text += `						</thead>`;
    	text += `						`;
    	text += `						<tbody id="tbody_C">`;
    				    	
    	text += `						</tbody>`;
    	text += `						`;
    	text += `					</table>`;
    	text += `			<div style="padding-top: 2em; text-align: right;">`;
    	text += `			<button type="button" class="btn btn-primary btn-lg waves-effect waves-light buttonFont" id="newBtn" style="display: none;" onclick="renderPronoticeInsert_C()">등록</button>`;
    	text += `			</div>`;
    	text += `			</div>`;
    	text += `				</div>	`;
//     	text += `			</div>`;
//     	text += `		</div>`;
//     	text += `	</div>`;
//     	text += `</div>`;
    	
    	document.querySelector("#list-target").innerHTML = text;
    	 
    	var table = $('#pronoticeList_dataTable').DataTable({
    		responsive:true,
    		retrieve: true,
    		scrollX: false,
    		scrollCollapse: false,
    		language: {
    	      emptyTable: "작성된 프로젝트 공지사항이 존재하지 않습니다.",
    	      lengthMenu: "_MENU_ 개씩 보기",
    	      info: "총 _START_ - _END_ / _TOTAL_건",
    	      infoEmpty: "데이터 없음",
    	      infoFiltered: "( _MAX_건의 데이터에서 필터링 )",
    	      search: "", 
    	      searchPlaceholder: "검색어를 입력하세요",
    	      zeroRecords: "일치하는 데이터가 없습니다.",
    	      loadingRecords: "로딩중...",
    	      processing: "잠시만 기다려 주세요.",
    	      paginate: {
    	        next: "다음",
    	        previous: "이전",
    	      },
    	    },
    	      order: [ [ 2, "desc" ] ],
    	})
    	
    	$('input[placeholder="검색어를 입력하세요"]').css("font-size", "20px");
    	$('select[name="pronoticeList_dataTable_length"]').css("font-size", "20px");
    	$('label').css("font-size", "20px");
    	
     	table.clear().draw();// 테이블 지우고 다시그려주기 아래!    
     	
    	for (item of json) { //아작스의 success
    		// 글번호 잘라서 숫자만 보이게하는 작업
    		var proNoticeListNo = item.proNoticeNo.substring(3, item.proNoticeNo.length)
    		console.log("item", item);
    		
    		// 오늘 날짜를 구해서 비교해서 new 띄워주려고 작업
    		var today = new Date();
    		var year = today.getFullYear();
    		var month = ('0' + (today.getMonth() + 1)).slice(-2);
    		var day = ('0' + today.getDate()).slice(-2);
    		var dateString = year + '-' + month  + '-' + day;
    		console.log ("dateString ::: ", dateString)
    		
    		if(item.proNoticeDate == dateString){
    			projectNoticeTitleDay= '<td><a href="javascript:pronoticeDetail_C('+'item.proNoticeNo'+');">'+item.proNoticeTitle+ '</a> <span class="badge bg-soft-danger text-danger">New</span> </td>';
    		}else{
    			projectNoticeTitleDay= '<td><a href="javascript:pronoticeDetail_C('+'item.proNoticeNo'+');">'+item.proNoticeTitle+'</a> </td>';
    		}
    	
			table.row.add([
			`<td> \${proNoticeListNo} </td> `,
			projectNoticeTitleDay,
			//`<td><a href="javascript:pronoticeDetail_C('\${item.proNoticeNo}');">\${item.proNoticeTitle}</a> <span class="newIcon"></span> </td>`,
			`<td> \${item.memberName} </td>`,
			`<td> \${item.proNoticeDate} <span class="pronoticeDate" value=${item.proNoticeDate}></span></td>`,
				]).draw(false);
    	
			
		}		
		//console.log("리스트 뿌리는 테이블 그리기 :::::: ",text);
			
	//해당게시글의 글쓰기 버튼...열고닫기(프로젝트 관리자만 열어줘야함)
	// style="display: none;" 이거 등록버튼 옆에 걸어주기
	// 우선 아작스로 proNoticeMemberId확인 프로젝트PL인지 확인해야함!
	
	var proVO ={
			proNo : proNo
	}
	var proMemberId = getProMemberId_H(proVO); // 관리자 누구인지 찾아오셈
	//console.log("프로젝트 찐 관리자임 globalMemberId : ", proMemberId);
	
	let localMemberId = localStorage.getItem("id");
	//console.log("localMemberId", localMemberId )
	//console.log("proMemberId", proMemberId )
	
	
	
	if(proMemberId == localMemberId){
		$("#newBtn").css('display','inline-block')
	}
	
    });
  
}

// 리스트 그리기 끝


// 인서트그리기 시작
function renderPronoticeInsert_C() {
	globalProNo; // 해당 프로젝트번호의 전역변수 불러오기
	
	let text = ``;
			
		text += `
			<div class="row mt-2" id="tableMsg">
				<div class="col-12">
					<div class="text-center">
					<img class="avatar-sm" src="/resources/src/images/확성기2.png">
					<h1 class="mt-2 mb-2 fw-bold"> 프로젝트 공지사항 </h1>
					</div>
				</div>	
			</div>	
			`;	
		
		text += `<div class="col-lg-10">`;
		text += `	<div class="card h-80" style="margin-bottom: 0px">`;
		text += `		<form>`;
		text += `		
						<input type="hidden" name="proNoticeNo" />
						<input type="hidden" name="proNo" id="proNo" value=""/> 
						<input type="hidden" name="memberId" id="memberId" value="" />
				`;
		text += `		<div class="card-body" style="min-height: 670px;">`;
		text += `			<div class="form-group">`;
		text += `				
								<label for="inputName" class="fontLavel">제목</label> 
								<input type="text" id="proNoticeTitle" name="proNoticeTitle" value="" class="form-control fontLavel" placeholder="제목을 입력하세요."><br>
				`;
		text += `			</div>`;
		text += `			<div class="form-group">`;
		text += `				<label for="inputName" class="fontLavel">내용</label>`;
		text += `				<div id="editor" class="form-control" style="height:300px;"></div>`;
		text += `				<br>`;
		text += `				<div id="contents"></div>`;
		text += `				<input type="hidden" name="proNoticeContent" id="concon" value="">`;
		text += `			</div>`;
		text += `
							
							<div class="mb-3">
				            <label class="form-label fontLavel">파일(File)</label>
				            <input class="form-control fontLavel" id="event-file" name="uploadFileAjax" type="file" accept=".jpg,.png,.pdf,.txt" class="fontLavel"/>
				            </div>
				
				`;
		text += `			<div class="row" style="text-align: right;">`;
		text += `				<div class="col-12">`;
		text += `					<input type="button" value="목록" id="listBtn" class="btn btn-success btn-lg waves-effect waves-light buttonFont buttonFont" onclick="renderPronoticeList_C()">`; 
		text += `					<input type="button" value="등록" id="formBtn" class="btn btn-primary btn-lg waves-effect waves-light buttonFont buttonFont" >`;
		text += `				</div>`;
		text += `			</div>`;
		text += `		</div>`;
		text += `		</form>`;
		text += `	</div>`;
		text += `</div>`;
		
		document.querySelector("#list-target").innerHTML = text;
	
		var toolbarOptions = [
			['bold', 'underline'],        // toggled buttons
			['blockquote', 'code-block'],
			
			[{ 'header': 1 }, { 'header': 2 }],               // custom button values
			[{ 'list': 'ordered'}, { 'list': 'bullet' }],
			//[{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
			//[{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
			[{ 'direction': 'rtl' }],                         // text direction
			
			//[{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
			[{ 'header': [1, 2, 3, 4, 5, 6, false] }],
			
			[{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
			//[{ 'font': [] }],
			//[{ 'align': [] }],
			
			//['clean']                                         // remove formatting button
		];
		
		var quill = new Quill("#editor", {
		     theme: 'snow',
		     modules: {
			     toolbar: toolbarOptions,
			     syntax: true,
		     },
		     placeholder: '내용을 입력하세요.',
		});
		
// 	const Editor = toastui.Editor;
	
// 	const editor = new Editor({
// 		  el: document.querySelector('#editor'),
// 		  height: '400px',
// 		  initialEditType: 'markdown',
// 		  previewStyle: 'vertical'
//	});
	//console.log(document.querySelector("#insert-target"));
	//console.log("인서트 할 객체(#insert-target)",text);
	
	
	
	var memberId = localStorage.getItem("id")
	//console.log("memberId : ", memberId)
	$("#memberId").val(memberId)
	
// 	// 파일 경로 먼저 만들어줘야함
// 	function insertFile(globalProNo){
// 	    var formData_C = new FormData();
// 	    var inputFile = $("input[name='uploadFileAjax']");
// 	    var files = inputFile[0].files;
// 	    for(var i = 0; i < files.length; i++){
// 	    	formData_C.append("proNoticeFile",files[i]);   
// 	    	console.log("채진영proNoticeFile",files[i]); // 여기까지는 나옴!
// 	    }
	    	    
// 	    let userEmail_C = localStorage.getItem("id");
// 	    let proNoticeTitle =  document.querySelector("#proNoticeTitle").value;
// 	    let proNoticeContent =  document.querySelector("#concon").value;

// // 	    let jsonData = JSON.stringify({ projectId: proNo, 
// // 	    								proNoticeTitle: proNoticeTitle,
// // 	    								proNoticeContent: proNoticeContent,
// // 	                                    userEmail_C : userEmail_C
// // 	                                });
// //	    console.log("jsonData :", jsonData);

// 		console.log("projectId/globalProNo :", globalProNo);
// 		console.log("userEmail_C :", userEmail_C);
// 		console.log("proNoticeTitle :", proNoticeTitle);
// 		console.log("proNoticeContent :", quill.root.innerHTML);
		
// 		// 여기서 보내는 이름이 즉 키값이 db랑 같아야함
// 	    formData_C.append("proNo", globalProNo);    
// 	    formData_C.append("memberId", userEmail_C);    
// 	    formData_C.append("proNoticeTitle", proNoticeTitle);    
// 	    formData_C.append("proNoticeContent", quill.root.innerHTML);    
	    
// 	    console.log("채진영formData_C 모든걸 담았다",formData_C);
	
// 	    $.ajax({
// 	        url : '/projectNotice/uploadAjaxAction',
// 	        processData : false,
// 	        contentType : false,
// 	        data : formData_C,
// 	        type : 'POST',
// 	        dataType : 'json',
// 	        success : function(result){
// 	            console.log("공지사항 파일 올린거 가져오기 origin result",result);
// 	        }
// 	    }); // end of ajax 
// 	    //console.log("원하는데이터 :", topWorkNo);
// 	} // end of insertFile function
	
	
	

	var formBtn = $("#formBtn");
	
	//등록버튼 눌렀을 때
	formBtn.on("click", function(){
		
		if($('#proNoticeTitle').val() == null || $("#proNoticeTitle").val() == ""){
			alert("제목을 입력해주세요.");
			$("#proNoticeTitle").focus();
			return false;
		}
		
	    var formData_C = new FormData();
	    var inputFile = $("input[name='uploadFileAjax']");
	    var files = inputFile[0].files;
	    for(var i = 0; i < files.length; i++){
	    	formData_C.append("noticeFile",files[i]);  // 여기서  formData_C 에 파일 담았음
	    	//console.log("채진영proNoticeFile",files[i]); // 여기까지는 나옴!
	    }

		
 		const proNoticeTitle = document.getElementById('proNoticeTitle').value;
        //console.log("proNoticeTitle",proNoticeTitle) //콘솔에 제목 안에 text 찍힘	
        const proNoticeContent = quill.root.innerHTML.replaceAll('"',"'");
		//console.log(" proNoticeContent : ", proNoticeContent);
        
        
        let sendData = JSON.stringify({
        	// 키 : 값 이런 느낌이야! 키의 내용이 붙어서 나오지요~
        	memberId: memberId,
        	proNo: globalProNo,
        	proNoticeTitle: proNoticeTitle,
        	proNoticeContent : quill.root.innerHTML
        });
        //console.log("sendData : ", sendData);
        
        formData_C.append("sendData", sendData); // 여기서 formData_C 에 아이디, 프로젝트번호, 제목, 내용 담았음
        
        $.ajax({
        	type:"post",
        	url:"/projectNotice/insert",
        	data: formData_C,
        	processData : false,
 	        contentType : false,
        	dataType:"json",
        	success:function(result){
        		//alert("in!");
        		//console.log("################## > " + result.proNoticeNo);
         		pronoticeDetail_C(result.proNoticeNo);         	        		
        		
         		
        		// 인서트 아작스 성공시 참여인원 조회해서 가져오고
         		var receiverIds =  selectJoinMemberList(proNo);
        		//console.log("selectJoinMemberList(proNo) 프젝사람들: ", receiverIds ) ;       		
         		         		
         		//공지사항 알람  멘트: 프로젝트~~ 에 안읽은 공지사항이 있습니다.
         		
         		for(var i = 0; i< receiverIds.length; i++){
	         		updateAlarm(memberId, 'projectNotice', receiverIds[i], result);       		        			
         		}
        		
        		
        	}
        });
        
 		//console.log("editor.getHTML()", editor.getHTML());
//  		cont = quill.root.innerHTML
//  		conte = cont.replaceAll('"',"'")
 		//console.log("아작스용",sendData);
 		
// 		conte = cont.replace("<p>","")
// 		conten = conte.replace("</p>","")
// 		content = conten.replace("<br>","")
		
// 		$("#concon").val(conte);
	}) //end of formBtn.on("click"
	
} // end of renderPronoticeInsert_C()

function selectJoinMemberList(proNo){
//console.log("selectJoinMemberList:::: proNo::::", proNo);
	     	var receiverId = []
	$.ajax({
		type:"post",
		url:"/projectNotice/selectJoinMemberList",
		data: {proNo: proNo},
		async:false,
	    dataType:"json",
	    success:function(res){
	     	//console.log("채진영 /projectNotice/selectJoinMemberList 성공시!:",res);
	     	$.each(res, function(i, item) {
	     		//console.log("i:::::::::::::::::::::::::::::::::", i);
		     	//console.log("item.memberId :::::: ", item.memberId);
		     	receiverId.push(item.memberId) 		     	
		     	// 여기서 이걸 처리해줘야하나???? 지형이 오면 물어보기
		     	
		     	
	     	})//end of each
	     	//객체로 다보낼수있는지 
		     	 
	     	
	    }//end of success
	})// end of $.ajax
	    return receiverId;
}// end of function
// 인서트그리기 끝
	//renderPronoticeList_C(); // 인서트 하고 우선 냅다 리스트 뿌리기.... 나중에 디테일 하면 디테일 보이도록 바꾸기 20230120

// 리스트에서 그 해당 글번호 해서 그 내용 한줄 가져오기 시작

// 리스트에서 그 해당 글번호 선택해서 그 내용 한줄 가져오기 끝	

// 디테일 화면 그리기
var detailMemberId; // 그 해당 게시글 쓴 사람 찾는거	
function renderDetail_C(data) {
	// 글 관련 버튼
	detailMemberId = data.memberId;
	let localMemberId = localStorage.getItem("id");
// 	console.log(" renderDetail_C(data) 로그인한 그 해당 게시글 아이디",detailMemberId)
// 	console.log(" renderDetail_C(data) 로컬스토리지 아이디", localMemberId)
		
//  	console.log("디테일 화면 그릴 때 받은 데이터1 data : ", data);
	//console.log("디테일 화면 그릴 때 받은 데이터2 data.proNoticeNo : ", data.proNoticeNo);
	//console.log("디테일 화면 그릴 때 받은 데이터3 data.proNo : ", data.proNo);
	
	let text = ``;
	
	text += `
			<div class="row mt-2" id="tableMsg">
				<div class="col-12">
					<div class="text-center">
					<img class="avatar-sm" src="/resources/src/images/확성기2.png">
					<h1 class="mt-2 fw-bold"> 프로젝트 공지사항 </h1>
					<h3 class="mt-2 mb-4"> 해당 프로젝트에서 알려드립니다. </h3>
					<hr style="width: 80%; margin-left: auto; margin-right: auto;">
					</div>
				</div>	
			</div>	
			`;
	
	text += `<div class="col-lg-10">`;
	text += `	<div class="card h-100">`;
	text += `   	<div class="card-header">`; //card-header 시작
	text += `       	<h2 class="card-title"> \${data.proNoticeTitle }</h2>`;
	text += `			<div class="d-flex align-items-start">`;
		if(data.memberPic == '0'){
			text += `		<img class="me-2 avatar-sm rounded-circle" src="/resources/dist/assets/images/users/blank_progile.png" alt="해당 회원 이미지 가져오기">`
		}else{
			text += `		<img class="me-2 avatar-sm rounded-circle" src="\${data.memberPic}" alt="해당 회원 이미지 가져오기">`;
		}
    text += `				<div class="w-100">`;
    text += `				<h4 class="">`;
    text += `           	&nbsp; \${data.memberName } &nbsp;&nbsp;`;
	text += `           	&nbsp; \${data.proNoticeDate } `;
	text += `           	<span hidden id=proNoticeNo>\${data.proNoticeNo }</span>`;
	text += `				</h4>`;
    text += `				</div>`; //w-100 끝
    text += `			</div>`; //d-flex align-items-start 끝
	text += `		</div>`; // card-header 끝
	
	text += `    	<div class="card-body" >`; // 콘텐츠 내용 시작
	text += `       	<div class="inbox-widget" id="viewer" data-simplebar style="max-height: 600px;">\${data.proNoticeContent }</div>`;
	text += `<hr>`;
	// 파일 시작
	if(data.proNoticeFile != null){
	text += `				<div style="flex: 1 1 20%">`;
	
		//.jpg,.png,.pdf,.txt
		let fileType = data.proNoticeFile.substring(data.proNoticeFile.lastIndexOf("."));
		//console.log("fileType ::::::", fileType);
		
		// 파일중에 이미지일때　나머지　아닐　때
		if( fileType == ".jpg" ){
			text += `<a style="text-align: left; font-size: 13px; padding: 0px; " href="` + data.proNoticePath + `" download = "` + data.proNoticeFile + `">`;
			text += `<img style="width: 220px; height: 200px" class="card-img-top embed-responsive-item" src="` + data.proNoticePath + `" alt="해당하는 이미지가 없습니다."/>`;
			text += `<p style="text-align: left; margin-top: 15px">` + data.proNoticeFile + `</p>`;
			text += `</a>`;
		} else if ( fileType == ".png" ){
			text += `<a style="text-align: left; font-size: 13px; padding: 0px; " href="` + data.proNoticePath + `" download = "` + data.proNoticeFile + `">`;
			text += `<img style="width: 220px; height: 200px" class="card-img-top embed-responsive-item" src="` + data.proNoticePath + `" alt="해당하는 이미지가 없습니다."/>`;
			text += `<p style="text-align: left; margin-top: 15px">` + data.proNoticeFile + `</p>`;
			text += `</a>`;
		} else {
			text += `<a style="text-align: left; font-size: 13px; padding: 0px; " href="` + data.proNoticePath + `" download = "` + data.proNoticeFile + `">`;
			text += `<img style="width: 100px; height: 100px" class="card-img-top embed-responsive-item" src="/resources/src/images/defaultFileImage/document.png" alt="해당하는 이미지가 없습니다."/>`;
			text += `<p style="text-align: left; margin-top: 15px">` + data.proNoticeFile + `</p>`;
			text += `</a>`;
		}
	
	text += `				</div>`;

	}// 파일 끝
	
	text += `    	</div>`; // 콘텐츠 내용 끝
	
	text += `    	<div class="card-body">`; // 버튼 시작
	text += `    		<div class="row" style="text-align: right;">`;
	text += `    	    	<div class="col-md-12">`;
	text += `    	        	<button type="button" class="btn btn-success btn-lg waves-effect waves-light buttonFont" id="listBtn" onclick="renderPronoticeList_C()">목록</button>`;
	text += `    	        	<button type="button" class="btn btn-primary btn-lg waves-effect waves-light buttonFont" id="modBtn" style="display: none;" onclick="renderProNoticeUpdate_C('\${data.proNoticeNo}')">수정</button>`;
	text += `    	        	<button type="button" class="btn btn-danger btn-lg waves-effect waves-light buttonFont" id="delBtn" style="display: none;" onclick="proNoticeDelete_C('\${data.proNoticeNo}')">삭제</button>`;
	text += `    	    	</div>`;
    text += `    		</div>`;
	text += `    	</div>`; // 버튼 끝
	
	text += `    	</div>`; // card h-100 헤더쪽?
	text += `	</div>`;
	text += `</div></hr>`;
	
	document.querySelector("#list-target").innerHTML = text;
	    
	// 디테일에도 에디터가 필요하고
	const Editor = toastui.Editor;
	// 뷰어도 필요햏!!!
	const viewer = Editor.factory({
	  el: document.querySelector('#viewer'),
	  viewer: true,
	  height: '500px',
	  initialValue: '${data.proNoticeContent }'
	});
	
	// 해당게시글의 수정 삭제 버튼...열고닫기
	if(detailMemberId == localMemberId){
		var modBtn = document.querySelector("#modBtn");
		var delBtn = document.querySelector("#delBtn");
		modBtn.style.display = 'inline';
		delBtn.style.display = 'inline';
	}

}

// 디테일 화면 그리기 끝	

//업데이트 그리기 시작
function renderProNoticeUpdate_C(proNoticeNo) {
	// 여기서 기존의 화면을 보여주고 그부분을 다시 지워줘야하는데 타켓부분

	//console.log("수정할 게시글 번호 proNoticeNo : ", proNoticeNo);
	const proNoticeNoVO = {
		proNoticeNo 
	};
	
	axios
	  .post("/projectNotice/select", proNoticeNoVO)
	  .then((res) => {
// 		 console.log("수정할 대상 res.data=====>", res.data);
// 		 console.log("수정할 대상 res.data : ", res.data);
		 const item = res.data;
		 let text = ``;
		 
		 text += `
				<div class="row mt-2" id="tableMsg">
					<div class="col-12">
						<div class="text-center">
						<img class="avatar-sm" src="/resources/src/images/확성기2.png">
						<h1 class="mt-2 mb-2 fw-bold"> 프로젝트 공지사항 </h1>
						</div>
					</div>	
				</div>	
				`;	
		 
		 text += `<div class="col-lg-10">`;
		 text += `	<div class="card h-80" style="margin-bottom: 0px">`;
		 text += `		<form>`;
		 text += `			
		 					<input type="hidden" name="proNoticeNo" /> 
			 				<input type="hidden" name="proNo" id="proNo" value=""/> 
		 					<input type="hidden" name="memberId" id="memberId" value="" />
		 		 `;
		 text += `			<div class="card-body" style="min-height: 670px;">`;
		 
		 text += `				<div class="form-group">`;
		 text += `					<label for="inputName" class="fontLavel">제목</label>
		 							<input type="text" id="proNoticeTitle" name="proNoticeTitle" value="\${item.proNoticeTitle}" class="form-control fontLavel" placeholder="제목을 입력하세요." ><br>`;
		 text += `				</div>`;
		 
		 text += `				<div class="form-group">`;
		 text += `					<label for="inputName" class="fontLavel">내용</label>`;
		 text += `					<div id="editor" class="form-control" style="height:300px;" ></div>`;
		 text += `					<br>`;
		 text += `					<div id="contents"></div>`;
		 text += `					<input type="hidden" name="proNoticeContent" id="concon" value="\${item.proNoticeContent}">`;
		 text += `				</div>`;
		 
		 text += `
				
								<div class="mb-3">
					            <label class="form-label fontLavel">파일(File)</label>
					            <input class="form-control fontLavel" id="event-file" value="\${item.proNoticeFile}" name="uploadFileAjax" type="file" accept=".jpg,.png,.pdf,.txt" class="fontLavel"/>
					            </div>
	
				`;
				 
		 text += `				<div class="row" style="text-align: right;">`;
		 text += `					<div class="col-12">`;
		 text += `						<input type="button" value="목록" id="listBtn" class="btn btn-success btn-lg waves-effect waves-light buttonFont" onclick="renderPronoticeList_C()">`; 
		 text += `						<button type="button" id="updateBtn" class="btn btn-primary btn-lg waves-effect waves-light buttonFont" >수정</button>`;
		 text += `					</div>`;
		 text += `				</div>`;
		 text += `			</div>`;
		 text += `		</form>`;
		 text += `	</div>`;
		 text += `</div>`;
		 
		 document.querySelector("#list-target").innerHTML = text;
		 
		 var toolbarOptions = [
				['bold', 'underline'],        // toggled buttons
				['blockquote', 'code-block'],
				
				[{ 'header': 1 }, { 'header': 2 }],               // custom button values
				[{ 'list': 'ordered'}, { 'list': 'bullet' }],
				//[{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
				//[{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
				[{ 'direction': 'rtl' }],                         // text direction
				
				//[{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
				[{ 'header': [1, 2, 3, 4, 5, 6, false] }],
				
				[{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
				//[{ 'font': [] }],
				//[{ 'align': [] }],
				
				//['clean']                                         // remove formatting button
			];
			
			var quill = new Quill("#editor", {
			     theme: 'snow',
			     modules: {
				     toolbar: toolbarOptions,
				     syntax: true,
			     },
			     placeholder: '내용을 입력하세요.',
			});
			
			// 퀄에디터 안에 내용 집어 넣어주기
			quill.pasteHTML(`\${item.proNoticeContent}`);

		 
		 let updateBtn = $("#updateBtn");
		 
		 //업데이트 전송
		 updateBtn.on("click", () => {
			
			var formData_C = new FormData();
			   var inputFile = $("input[name='uploadFileAjax']");
			   var files = inputFile[0].files;
			   for(var i = 0; i < files.length; i++){
			   	formData_C.append("noticeFile",files[i]);  // 여기서  formData_C 에 파일 담았음
// 			   	console.log("채진영proNoticeFile",files[i]); // 여기까지는 나옴!
			   }
	
			const proNoticeTitle = document.querySelector("#proNoticeTitle").value;
			const proNoticeContent = quill.root.innerHTML.replaceAll("'","\\'").replaceAll('"','\\"');
			//console.log(" proNoticeTitle : ", proNoticeTitle);
// 			console.log(" proNoticeContent : ", proNoticeContent);
			       
			let sendData = JSON.stringify({
				// 키 : 값 이런 느낌이야! 키의 내용이 붙어서 나오지요~
				memberId: memberId,
				proNo: globalProNo,
				proNoticeNo: proNoticeNo,
				proNoticeTitle: proNoticeTitle,
				proNoticeContent : proNoticeContent
			});
// 			console.log("sendData : ", sendData);
			
			formData_C.append("sendData", sendData); // 여기서 formData_C 에 아이디, 프로젝트번호, 제목, 내용 담았음
			
			axios
			  .post("/projectNotice/update", formData_C)
			  .then((res) => {
				  
				  Swal.fire({
					  position: 'center',
					  icon: 'success',
					  title: '수정 완료',
					  showConfirmButton: false,
					  timer: 900
				  })
// 				  console.log("update :", res);
// 				  console.log("update//res.data :", res.data);
// 				  console.log("update//res.data.proNoticeNo :", res.data.proNoticeNo);
 				  pronoticeDetail_C(res.data.proNoticeNo); // 이거는 안그려짐 pronoticeDetail_C
//  			  pronoticeDetail_C(result.proNoticeNo); 
//				  renderDetail_C(result.data.proNoticeNo);
			  });
		 }); //  updateBtn.on("click" 끝
	  });
}
//업데이트 그리기 끝

//게시글 삭제
function proNoticeDelete_C(proNoticeNo) {
	
	Swal.fire({
		  title: '삭제',
		  text: "해당 공지사항을 삭제하시겠습니까?",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.isConfirmed) {
			  Swal.fire(
					  
					 '삭제완료!',
				     '해당 공지사항이 삭제되었습니다.'
				   
				      
				    )
			  const proNoticeNoVO = {
						proNoticeNo,	
					}
			  
			  axios
			  .post("/projectNotice/delete", proNoticeNoVO)
			  .then((res) => {
				 //console.log(res);
				 renderPronoticeList_C();
			  });// axios
		 	 }//if (result.isConfirmed)
 		 })
	
	
	
// 	const proNoticeNoVO = {
// 		proNoticeNo,	
// 	};
	
// 	if (!confirm("정말 삭제하시겠습니까?")) {
// 		return;
// 	}
	
// 	axios
// 	  .post("/projectNotice/delete", proNoticeNoVO)
// 	  .then((res) => {
// 		 //console.log(res);
// 		 renderPronoticeList_C();
// 	  });
	
	
	
	
	
}
// 게시글 삭제 끝


</script>
