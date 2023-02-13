<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

<div class="content-page">
	<div class="content">

		<div class="row mt-3">
			<div class="col-xl-12">
				<div class="card">
					<div class="card-body">
						<!-- Start Content-->
						<div class="container-fluid">
				
							<div class="row">
								<div class="col-12">
									<h1 style="text-align: center; font-weight: bold;"> 공지사항 관리 </h1>
									<div class="row justify-content-center">
										<div class="col-lg-10 mt-3 text-center" id="insertBtnDiv" style="margin-left: auto; margin-right: auto;">
											<button type="button" onclick="noticeInsertForm()" class="btn btn-primary waves-effect waves-light" style="font-size: 1.5em">공지글 등록</button>
										</div>
									</div>
								    <div class="text-center" id="listBtnDiv" style="display: block; margin-top: 10px; margin-bottom: 20px">
										<button type="button" class="btn btn-soft-primary waves-effect waves-light" style="font-size: 1.5em" onclick="noticeList()">전체</button>
										<button type="button" class="btn btn-outline-primary waves-effect waves-light" style="font-size: 1.5em" onclick="noticeList('작업')">작업</button>
										<button type="button" class="btn btn-outline-primary waves-effect waves-light" style="font-size: 1.5em" onclick="noticeList('서비스')">서비스</button>
										<button type="button" class="btn btn-outline-primary waves-effect waves-light" style="font-size: 1.5em" onclick="noticeList('업데이트')">업데이트</button>
									</div>
									<hr style="width: 80%; margin-top: 20px; margin-left: auto; margin-right: auto;">
									
									<div class="row justify-content-center">
										<div class="col-lg-10" style="margin-top: 10px">
											<div id="table-container" class="noticeFont">
												<table id="noticeTable" class="table mt-3">
											        <thead class="table-light">
											            <tr>
											                <th>글번호</th>
											                <th>카테고리</th>
											                <th>제목</th>
											                <th>작성자</th>
											                <th>조회수</th>
											                <th>작성일</th>
											            </tr>
											        </thead>
											        <tbody id="tbody-target">
											        </tbody>
											    </table>
										    </div>
										</div>
									</div>
								</div>
							</div>
						</div>	<!-- container -->
						
					</div>
				</div>
				<!-- end card-->
			</div>
			<!-- end col -->
		</div>

	</div>
</div>


<script>
	
$(document).ready(function() {
	console.log("ready");
	noticeList();
});


function makeTable() {
	let text = ``;
	text += `<table id="noticeTable" class="table mt-3">`;
    text += `<thead class="table-light">`;
    text += `    <tr>`;
    text += `        <th>글번호</th>`;
    text += `        <th>카테고리</th>`;
    text += `        <th>제목</th>`;
    text += `        <th>작성자</th>`;
    text += `        <th>조회수</th>`;
    text += `        <th>작성일</th>`;
    text += `    </tr>`;
    text += `</thead>`;
    text += `<tbody id="tbody-target">`;
    text += `</tbody>`;
    
    document.querySelector("#table-container").innerHTML = text;
}


function noticeList(category) {
	makeTable();
	document.querySelector("#insertBtnDiv").style.display = "block";
	document.querySelector("#listBtnDiv").style.display = "block";
	
	console.log("noticeList");

	let listURL = "/notice/noticeList";
	
	if (category == '작업')     listURL = `/notice/noticeList?category=work`;
	if (category == '서비스')   listURL = `/notice/noticeList?category=service`;
	if (category == '업데이트') listURL = `/notice/noticeList?category=update`;
	
	axios
		.get(listURL)
		.then((res) => {
			console.log("공지사항 리스트 - success");
			console.log("공지사항 리스트 : ", res.data);
			let list = res.data;
			
			for (item of list) {
				item.sysNTitle = `<a href="javascript: noticeDetail(\${item.sysNNo})">\${item.sysNTitle}</a>`;
			}
			
			const noticeTable = $('#noticeTable').removeAttr("width").DataTable({
				lengthChange: false,
				//destroy: true,
                order: [[0, 'desc']],
//                 ordering: true,
//                 responsive:false,
                //retrieve: true,
                bAutoWidth: false,
                bAutoHeigth: false,
                //scrollX: true,
                //scrollY: 380,
                //scrollCollapse:true,
                searching: true,
                paging: true,
                destroy: true,
                pageLength: 7,
//                 lengthMenu: [5, 7, 10],
                columnDefs: [
                    {width: 20, targets: 0},
                    {width: 40, targets: 1},
                    {width: 300, targets: 2},
                    {width: 30, targets: 3},
                    {width: 25, targets: 4},
                    {width: 30, targets: 5},
                ],
                data: list,
                columns: [
                    { data: "sysNNo" },
                    { data: "sysNCategory" },
                    { data: "sysNTitle" },
                    { data: "adminName" },
                    { data: "sysNHit" },
                    { data: "sysNDate" },
                ],
                language: {
                    emptyTable: "공지사항이 없습니다.",
//                     lengthMenu: "_MENU_ 개씩 보기",
                    info: "총 _TOTAL_건",
                    infoEmpty: "공지사항 없음",
                    infoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
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
			});
			
			$('input[placeholder="검색어를 입력하세요"]').css("font-size", "20px");

	})
}
	
	
	
function noticeDetail(a) {
	
	document.querySelector("#insertBtnDiv").style.display = "none";
	document.querySelector("#listBtnDiv").style.display = "none";
	
	//조회수 증가
	hitUp(a);
	let noticeNo = a;
	const vo = {
	  sysNNo: noticeNo,	
	};
	
	axios
		.post("/notice/noticeDetail", vo)
		.then((res) => {
			console.log("공지사항 디테일 - success");
			console.log("공지사항 디테일 : ", res.data);
			
			const noticeVO = res.data;
			
		    let text = ``;
		    text += `<div class="col-lg-12">`;
		    text += `	<div class="card h-100">`;
		    text += `   	<div class="card-header">`; //card-header 시작
		    text += `       	<span class="card-title fw-bold" style="font-size: 25px; color: black">\${noticeVO.sysNTitle }</span>`;
		    text += `			<div class="d-flex align-items-center mt-1">`;
		    text += `			<div id="adminPic" class="ms-1"></div>`;
		    text += `				<div class="w-100">`;
			text += `				<span style="font-size: 20px; color: black">\${noticeVO.adminName}</span>`;
			text += `				<span style="font-size: 15px; margin: 10px;; color: black">\${noticeVO.sysNDate}</span>`;
		    text += `           	<span hidden id="noticeNo-\${noticeVO.sysNNo}">\${noticeVO.sysNNo }</span>`;
		    	text += `				</div>`; //w-100 끝
		    	text += `			</div>`; //d-flex align-items-start 끝
		    text += `		</div>`; // card-header 끝
		    
		    text += `    	<div class="card-body" style="min-height: 300px;  color: black">`; // 콘텐츠 내용 시작
		    text += `<div class="inbox-widget" id="viewer" data-simplebar style="max-height: 600px;">\${noticeVO.sysNContent }</div>`;
		    text += `		</div>`; // card-header 끝
			text += `    	<div class="card-body">`; // 버튼 시작
			text += `    		<div class="row" style="text-align: right;">`;
			text += `    	    	<div class="col-md-12">`;
			text += `    	        	<button type="button" class="btn btn-success waves-effect waves-light" id="" onclick="noticeList()" style="font-size: 20px;">목록</button>`;
			text += `    	        	<button type="button" class="btn btn-primary waves-effect waves-light" id="" onclick="noticeUpdateForm(\${noticeVO.sysNNo})" style="font-size: 20px;">수정</button>`;
			text += `    	        	<button type="button" class="btn btn-danger waves-effect waves-light" id="" onclick="noticeDelete(\${noticeVO.sysNNo})" style="font-size: 20px;">삭제</button>`;
			text += `    	    	</div>`;
		    text += `    		</div>`;
		    text += `    	</div>`;
		    
		    document.querySelector("#table-container").innerHTML = text;
			getAdminPic();
		});
}


function getAdminPic(){
	
	var memberId ={
	         memberId : 'admin'
	   }
	console.log("관리자용memberId: ", memberId);
	
	   $.ajax({
	      url : "/member/selectMember",
	      type : "post",
	      data : JSON.stringify(memberId),
	      contentType : 'application/json; charset=utf-8',
	      dataType : 'json',
	      success : function(res) {
	         console.log("res : ",res)
	         
	     	let text = ""
				if(res.memberPic == 0){
					text += `<img src="${pageContext.request.contextPath }/resources/dist/assets/images/users/blank_progile.png" alt="user-image" class="me-2 avatar-sm rounded-circle">`;
				}else{
					text += `<img src="\${res.memberPic}" alt="user-image" class="me-2 avatar-sm rounded-circle">`;
				}
	         	console.log("text: ", text);
	         	
	         	document.querySelector("#adminPic").innerHTML = text;
	      },
	   }); //ajax
	
}



function noticeDelete(sysNNo) {
	
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
			  const vo = {
			 	 sysNNo,	
			  };
			  
			  axios
			  .post("/notice/noticeDelete", vo)
			  .then((res) => {
				 //console.log(res);
				 noticeList();
			  });// axios
		 	 }//if (result.isConfirmed)
		 })
	
	
// 	const vo = {
// 			  sysNNo,	
// 			};
					
// 			axios
// 			  .post("/notice/noticeDelete", vo)
// 			  .then((res) => {
// 				 console.log(res.data);
				 
// 				 Swal.fire({
// 					  position: 'center',
// 					  icon: 'success',
// 					  title: '삭제 완료',
// 					  showConfirmButton: false,
// 					  timer: 900
// 					})
				 
// 				 noticeList();
// 			  });
}


function hitUp(sysNNo) {
	const vo = {
	  sysNNo,	
	};
			
	axios
	  .post("/notice/hitUp", vo)
	  .then((res) => {
		 console.log(res.data); 
	  });
}


function noticeUpdate(sysNNo) {
	const sysNContent = document.querySelector(".ql-editor").innerHTML;
	const sysNTitle = document.querySelector("#sysNTitle").value;
	const sysNCategory = document.querySelector("#noticeCategory").value;
	
	const vo = {
	  sysNContent,
	  sysNTitle,
	  sysNCategory,
	  adminId: '관리자',
	  sysNNo,
	};
			
	axios
	  .post("/notice/updateNotice", vo)
	  .then((res) => {
		 Swal.fire({
			  position: 'center',
			  icon: 'success',
			  title: '수정 완료',
			  showConfirmButton: false,
			  timer: 900
			})
				
		  noticeDetail(sysNNo);
	  });
		
}


function noticeUpdateForm(sysNNo) {
	
	const vo = {
	  sysNNo,	
	};
	
	axios
		.post("/notice/noticeDetail", vo)
		.then((res) => {
			const noticeVO = res.data;
			noticeInsertForm(noticeVO);
			
			//채우기
			document.querySelector("#sysNTitle").value = noticeVO.sysNTitle;
			document.querySelector(".ql-editor").innerHTML = noticeVO.sysNContent;
		});
	
}


function noticeInsertForm(data) {
	
	document.querySelector("#insertBtnDiv").style.display = "none";
	document.querySelector("#listBtnDiv").style.display = "none";
	
	console.log("noticeInsertForm");

	let text = ``;
	
	text += `<div class="col-lg-12">`;
	text += `	<div class="card h-100">`;
	text += `			<div class="card-body">`;
	text += `				<div class="form-group">`;
	text += `					<div class="row mb-2">`;
	text += `						<div class="col-lg-2" style="margin: 0px; width: 20%">`;
	text += `							<select id="noticeCategory" style="width: 230px; height: 45px; font-size: 1.5em">`;
	text += `								<option hidden>카테고리를 선택하세요</option>`;
	
	if (data != null && data.sysNCategory == "작업") {
	  text += `								<option selected>작업</option>`;
	  text += `								<option>서비스</option>`;
	  text += `								<option>업데이트</option>`;
	} 
	if (data && data.sysNCategory == "서비스") {
	  text += `								<option>작업</option>`;
	  text += `								<option selected>서비스</option>`;
	  text += `								<option>업데이트</option>`;
	} 
	if (data && data.sysNCategory == "업데이트") {
	  text += `								<option>작업</option>`;
	  text += `								<option>서비스</option>`;
	  text += `								<option selected>업데이트</option>`;
	} 
	
	if (!data) {
	  text += `								<option>작업</option>`;
	  text += `								<option>서비스</option>`;
	  text += `								<option>업데이트</option>`;
	}
	
	text += `							</select>`;
	text += `						</div>`;
// 	text += `					<label for="inputName"><font class="jinoFont">제목</font></label> 
// 								<input type="text" id="sysNTitle" name="sysNTitle" value="" class="form-control" placeholder="제목을 입력하세요"><br>`;
	text += `					<div class="col-lg-10" style="margin: 0px; width: 80%">`;
	text += `						<input type="text" id="sysNTitle" name="sysNTitle" value="" class="form-control" placeholder="제목을 입력하세요" style="font-size: 1.5em">`;
	text += `					</div>`;
	text += `				</div>`;
	text += `				<div class="form-group">`;
// 	text += `					<label for="inputName"><font class="jinoFont">내용</font></label>`;
	text += `					<div id="noticeQuill-container">`;
	text += `					  <div id="noticeQuill" class="form-control" style="height:550px;"></div>`;
	text += `					</div>`;
	text += `					<br>`;
	text += `					<div id="contents"></div>`;
	text += `					<input type="hidden" name="dviContent" id="concon" value="" style="font-size: 1.5em">`;
	text += `				</div>`;
	text += `				<div class="row">`;
	text += `					<div class="col-12" style="text-align: right;">`;
	text += `						<input type="button" value="목록" id="listBtn" class="btn btn-success waves-effect waves-light" style="font-size: 1.5em" onclick="noticeList()">`; 
							if (data) {
	  text += `						<input type="submit" value="수정" id="updateBtn" class="btn btn-primary waves-effect waves-light" style="font-size: 1.5em" onclick="noticeUpdate(\${data.sysNNo})">`;
							} else {
	  text += `						<input type="submit" value="등록" id="formBtn" class="btn btn-primary waves-effect waves-light" style="font-size: 1.5em" onclick="noticeInsert()">`;
							}
	
	text += `					</div>`;
	text += `				</div>`;
	text += `			</div>`;
	text += `	</div>`;
	text += `</div>`;
	
	document.querySelector("#table-container").innerHTML = text;
	
	document.querySelector("#noticeQuill-container").innerHTML = `<div id="noticeQuill" class="form-control" style="height:550px; font-size: 1.5em;"></div>`;
	
	var toolbarOptions = [
        ['bold', 'underline'],        // toggled buttons
        ['blockquote', 'code-block'],

        [{ 'header': 1 }, { 'header': 2 }],               // custom button values
        [{ 'list': 'ordered'}, { 'list': 'bullet' }],
        //[{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
        //[{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
        [{ 'direction': 'rtl' }],                         // text direction

//         [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
        [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

        [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
//         [{ 'font': [] }],
        //[{ 'align': [] }],

        //['clean']                                         // remove formatting button
      ];
	
	var quill = new Quill("#noticeQuill", {
        theme: 'snow',
        modules: {
          toolbar: toolbarOptions,
          syntax: true,
        },
        placeholder: '내용을 입력하세요',
    });
    
    $("#toolbar").append($(".ql-toolbar"));
    $(".ql-toolbar").css("font-size", "1.5em");
}


function noticeInsert() {
	const sysNContent = document.querySelector(".ql-editor").innerHTML;
	const sysNTitle = document.querySelector("#sysNTitle").value;
	const sysNCategory = document.querySelector("#noticeCategory").value;
	const memberId = localStorage.getItem('id');
	
	const vo = {
	  sysNContent,
	  sysNTitle,
	  sysNCategory,
	  adminId: memberId,
	  adminName: '관리자',
	};
	
	console.log("공지사항 vo : ", vo);
	
	axios
	  .post("/notice/noticeInsert", vo)
	  .then((res) => {
		  const noticeVO = res.data;
	      console.log("noticeVO",noticeVO);
	      
		 Swal.fire({
			  position: 'center',
			  icon: 'success',
			  title: '등록 완료',
			  showConfirmButton: false,
			  timer: 900
			})
	      
	      noticeDetail(noticeVO.sysNNo);
	  });
	
}



	
	
</script>