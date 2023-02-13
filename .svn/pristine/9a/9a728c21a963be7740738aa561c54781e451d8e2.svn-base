<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<style>
.ql-syntax {
	background: black !important;
	color: white !important;
}

.hljs-type {
	color: #EE75C6 !important;
}

</style>


<!-- ============================================================== -->
<!-- Start Page Content here -->
<!-- ============================================================== -->
<div class="content-page">
	<div class="content">

		<!-- Start Content-->
		<div class="container-fluid">

			<!-- start page title -->
			<div class="row m-2">
				<div class="col-10">
					<div class="">
						<h4 class="page-title fw-bold">쪽지함</h4>
					</div>
				</div>
			</div>
			<!-- end page title -->


			<div class="row">

				<!-- Right Sidebar -->
				<div class="col-2 col-xl-3 col-xxl-2">
					<div class="card " style="min-height: 750px;">
						<div class="card-body">
							<!-- Left sidebar -->
							<div class="">

								<a id="composeBtn" href="javascript: void(0);" onclick="showcompose()" class="fs-3 btn btn-outline-primary w-100 waves-effect waves-light">작성하기</a>

								<div class="mail-list mt-4">
									<a href="javascript: void(0);" onclick="showList()" id="showList" class="showbtn text-primary font-17 fw-bold"> <i class="dripicons-inbox me-2"></i>받은 쪽지함 <span id="letterCheckCnt" class=" chkletterinit badge badge-soft-purple float-end ms-2"></span>
									</a> <a href="javascript: void(0);" onclick="sendInbox()" id="sendInbox" class="showbtn font-17"> <i class="mdi mdi-email-send-outline me-2"></i>보낸 쪽지함
									</a> <a href="javascript: void(0);" onclick="markLetterList()" id="showMark" class="showbtn font-17"> <i class="dripicons-star me-2"></i>중요 보관함
									</a> <a href="javascript: void(0);" onclick="trashBox()" id="trashBox" class="showbtn font-17"> <i class="dripicons-trash me-2"></i>휴지통
									</a>
								</div>
								<script type="text/javascript">
									function showcompose(replymemberId){
										$('#composeLetter').css('display','block')
										$('#letterInbox').css('display','none')
										$('#letterDetail').css('display','none')
										$('.showbtn').attr('class','showbtn font-17')
										$('#composeBtn').attr('class', 'fs-3 btn btn-primary w-100 waves-effect waves-light')
											$('#letterTitle').val("")
													$('#letterFile').val("")
										$('.select2-multiple').val([]).trigger('change');
										
									}
									function showList() {
										letterList();
										$('#letterInbox').css('display','block')
										$('#composeLetter').css('display','none')
										$('#letterDetail').css('display','none')
										$('.showbtn').attr('class','showbtn font-17')
										$('#showList').attr('class','showbtn text-primary font-17 fw-bold')
										$('#composeBtn').attr('class', 'fs-3 btn btn-outline-primary w-100 waves-effect waves-light')
									}
									
								</script>




							</div>
						</div>
					</div>
				</div>
				<!-- End Left sidebar -->
				<div class=" col-9 card">

					<!-- start page title -->

					<div id="letterInbox" style="display: none;">
						<div class="row">
							<div class="col-12">
								<div class="m-2">
									<h4 id="inboxTitle" class="page-title fw-bold">받은쪽지함</h4>
								</div>
							</div>
						</div>
						<!-- end page title -->
						<div id="mygrid" class="ag-theme-material"></div>

						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-body" style="min-height: 500px;">
										<h4 class="header-title"></h4>
										<table id="letterList" class="table dt-responsive nowrap w-100 ">
											<thead>
												<tr>
													<th>선택
														<button id="selectDeleteBtn" onclick="deleteLetter()" type="button" class="btn btn-danger btn-xs waves-effect waves-light d-none">
															<i class="mdi mdi-delete">선택삭제</i>
														</button>
													</th>
													<th class="me-2" id="letterMark">중요</th>
													<th class="w-50">제목</th>
													<th id="letterPerson">보낸사람</th>
													<th>날짜</th>
												</tr>
											</thead>
											<tbody id="tbody">

											</tbody>
										</table>
										<div class="row">
											<div id="detailLetter"></div>
											<div id="trashbtn" class="text-end">
												<button onclick="deleteLetter()" type="button" class="btn btn-danger waves-effect ">
													<i class="mdi mdi-delete">삭제</i>
												</button>

											</div>

										</div>
									</div>
									<!-- end card body-->
								</div>
								<!-- end card -->
							</div>
							<!-- end col-->
						</div>
						<!-- end row-->


					</div>
					<!-- container -->
					<!-- 작성하기 -->
					<div id="composeLetter" style="display: none;">
						<div class="row d-flex flex-row ">
							<div class="page-title-box d-flex jutify-content-between">
								<h4 class="page-title">쪽지 보내기</h4>
								<button type="button" onclick="letterSend_K()" class="btn btn-primary waves-effect waves-light">
									<span>보내기</span> <i class="mdi mdi-send ms-2"></i>
								</button>
							</div>
						</div>
						<!-- 작성하기 부분  -->
						<div class="mt-2">
							<div class="row">
								<div class="mb-3">
<!-- 									<select id="selectize-optgroup" placeholder="받는사람" multiple="multiple"> -->
<!-- 										<optgroup label="알 수 있는 회원" id="memberListLetter"> -->
<!-- 										</optgroup> -->
<!-- 									</select> -->

									<select class="form-control select2-multiple" data-toggle="select2" data-width="100%" multiple="multiple" data-placeholder="받는사람">
										<optgroup label="알 수 있는 회원" id="memberListLetter">
										</optgroup>
									</select>
								</div>
							</div>
							<!-- 							<div class="mb-3"> -->
							<!-- 								<input name="memberId" id="composeMemberId" type="email" class="form-control" placeholder="받는사람" required> -->
							<!-- 							</div> -->
							<div class="mb-3">
								<input name="letterTitle" id="letterTitle" type="text" class="form-control" placeholder="제목">
							</div>
							<div class="mb-3">
								<input name="letterFile" id="letterFile" type="file" class="form-control" multiple />
							</div>

							<div class="row mb-3">
								<div class="col-12">
									<div id="editor" style="height: 300px;"></div>
									<!-- end Snow-editor-->
								</div>
								<!-- end col -->
							</div>
							<!-- end row -->



							<!-- 퀼 -->

						</div>
						<!-- end card-->

					</div>

					<!-- detail -->
					<div id="letterDetail" class="mt-2" style="display: none;">
						<div class="page-title-box">
							<h4 class="page-title">상세보기</h4>
							<div class="my-auto d-flex justify-content-end text-end ">
								<a href="javascript:void(0);" class="btn btn-primary me-2 d-inline" onclick="replyLetter()"><i class="mdi mdi-reply me-1"></i> Reply</a>
								<!-- 답장보내기 스크립트 -->
								<script type="text/javascript">
												function replyLetter(){
													var senderId = $('#detailSenderId').text()
													//$('.select2-multiple').val(senderId)
													//$('.select2-multiple').text(senderId)
													showcompose();
													$('.select2-multiple').val([]).trigger('change');
													$('.select2-multiple').val([senderId]).trigger('change');
												
												}
											</script>
								<button id="detailTrashBtn" onclick="deleteLetterDetail()" type="button" class="btn btn-danger waves-effect waves-light d-inline">
									<i class="mdi mdi-delete"></i> 삭제
								</button>
							</div>
						</div>
						<div class="card p-2">
							<div>
								<h3 id="detailTitle" class="header-title fs-2 m-2"></h3>
							</div>
							<hr />


							<div class="my my-auto ms-3">
								<small class="detailDate text-muted fs-5"></small>
							</div>

							<!-- 									<img id="detailSenderPic" class="w-25 d-flex me-2 rounded-circle" src="" alt="placeholder image" height="32"> -->
							<!-- 										<h6 id="detailSenderName" class="m-0 font-14"></h6> -->
							<!-- 										<small id="detailSenderId" class="text-muted"></small><br> -->
							<!-- 										 <small class="detailDate" class="text-muted"></small>  -->
							<div class="d-flex flex-row">
								<a id="openSenderInfo" class="my-auto m-1" href="#" onclick="openSenderInfo()"> <i id="openSenderInfoIcon" class="mdi mdi-chevron-down accordion-arrow "></i>
								</a> <span class="header-title fs-3 my-auto"> 보낸사람 </span> &nbsp;
								<div class="badge bg-primary rounded-pill fs-3 my-auto ">
									<span id="detailSenderName"> </span> &lt; <span id="detailSenderId"></span> &gt;
								</div>
								&nbsp; <input id="detailNo" type="text" hidden="" value="">
							</div>



							<div id="detailMemberBox" style="display: none;" class="ms-3 mt-1">
								<span class="header-title fs-3 my-auto "> 받는사람 </span> &nbsp;
								<div class="badge bg-primary rounded-pill fs-3 my-auto ">
									<span id="detailMemberName"> </span> &lt;<span id="detailMemberId"></span>&gt;
								</div>
								&nbsp;
								<div class="text-end my my-auto" hidden>
									<small class="detailDate " class="text-muted"></small>
								</div>
								<input id="detailNo" type="text" hidden="" value="">
							</div>

							<script type="text/javascript">
									function openSenderInfo(){
											$('#openSenderInfo').attr('onclick','closeSenderInfo()')
											$('#openSenderInfoIcon').attr('class','mdi mdi-chevron-up accordion-arrow')
											$('#detailMemberBox').show();
									}
									function closeSenderInfo(){
											$('#openSenderInfo').attr('onclick','openSenderInfo()')
											$('#openSenderInfoIcon').attr('class','mdi mdi-chevron-down accordion-arrow')
											$('#detailMemberBox').hide();
									}
								</script>

							<!-- 								<div id="detailMemberBox" class="ms-5" style="display: flex; flex-direction: row; flex-wrap: nowrap;" hidden> -->
							<!-- 									<img id="detailMemberPic" class="w-25 d-flex me-2 rounded-circle" src="" alt="placeholder image" height="32"> -->
							<!-- 									<div class="w-100"> -->
							<!-- 										받은사람 -->
							<!-- 										<h6 id="detailMemberName" class="m-0 font-14"></h6> -->
							<!-- 										<small id="detailMemberId" class="text-muted"></small> <br> <small class="detailDate" class="text-muted"></small> <input id="detailNo" type="text" hidden="" value=""> -->
							<!-- 									</div> -->
							<!-- 														</div> -->

							<div id="dtailContent" class="m-2 font-10"></div>
							<hr />

							<h5 class="mb-3 fw-bold">첨부파일</h5>
							<div class="row" id="letterDetailFile"></div>

						</div>


						<!-- end row-->

					</div>


				</div>
				<!-- end .mt-4 -->


				<!-- end composeLetter-->

			</div>
			<!-- end inbox-rightbar-->


			<div class="clearfix"></div>
		</div>
	</div>
	<!-- end card -->

</div>
<!-- end Col -->
</div>
<!-- End row -->


<!-- ============================================================== -->
<!-- End Page content -->
<!-- ============================================================== -->
<!-- 셀렉트박스 -->

<script type="text/javascript">


$(function() {
	showList();
	checkCnt();		
	   //초기화
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
        placeholder: '내용을 입력하세요..',
    });
    
})//$(function)


//회원목록 불러오기 
function getLetterMemberList(){
	var memberVO={
			memberId : localStorage.getItem('id')
	}
	$.ajax({
		url : "/member/getMyAllProJsMembers",
		type : "post",
		contentType : 'application/json; charset=utf-8',
		data : JSON.stringify(memberVO),
		dataType : 'json',
		success : function(res) {
			console.log("회원목록 쪽지 : ", res)
			var str ="";
			for (var i = 0; i < res.length; i++) {
				str += `<option value='\${res[i].memberId}'>\${getMemberDetail(res[i].memberId)}(\${res[i].memberId})</option>`
// 				str += `<div class="option" data-selectable="" data-value="\${res[i].memberId}">\${res[i].memberId}</div>`
				
			}			
			
				console.log("회원목록 쪽지str : ", str)
				$('#memberListLetter').append(str)
		},
	
	});//ajax
	
}
getLetterMemberList()
/* 받은 쪽지함 */
function letterList(){
	$('#letterPerson').text('보낸사람')
	$('#inboxTitle').text('받은쪽지함')
	$('#letterMark').text('중요')
	$('#trashbtn').attr('class','d-block text-end')
// 	$('#trashbtn').show();
	var table = $('#letterList').DataTable({
		responsive:true,
		 retrieve: true,
//			 scrollX: true,
		scrollCollapse:true,
		language: {
            emptyTable: "데이터가 없습니다.",
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
            order: [ [ 4, "desc" ] ],
         
	})
	table.clear().draw();
	var memberId = localStorage.getItem('id');
	var letterVO = {
		memberId : memberId
	}

	$.ajax({
		url : "/letter/mylist",
		type : "post",
		data : JSON.stringify(letterVO),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(res) {
			//onclick = "markLetterupdate('\${res[i].letterNo}')"
// 			console.log(res)
			for (var i = 0; i < res.length; i++) {
			table.row.add([
				`<td>  <input type="checkbox" class="form-check-input" id="chkletter" name="chkletter" value="\${res[i].letterNo}"><label for="chk1" class="toggle"></label>  </td> `,
				`<td> <button id= "markLetterBtn\${res[i].letterNo}" type="button" class="btn btn-white btn-xs waves-effect waves-light" onclick = "markLetterupdate('\${res[i].letterNo}')" > 
						<i class="mdi mdi-star"></i> 
						</button>
				 </td>`,
				`<td ><a id='titlelink\${[i]}' href='javascript: void(0);' onclick= "letterDetail('\${res[i].letterNo}')">\${res[i].letterTitle} </a></td>`,
				`<td> \${getMemberDetail(res[i].letterSender)} </td>`,
				`<td>\${res[i].letterDate}</td>`,
					]).draw(false);
				
				// 상태코드 -> 미확인:0 확인 :1 즐겨찾기:2
				if (res[i].letterCheck == '0' || res[i].letterCheck == 0 ) {
					var linkid='#titlelink'+[i];
					$(linkid).css("font-weight","bold")
				}
				if (res[i].letterMark == '1' || res[i].letterMark == 1 ) {
					var markLetterBtn='#markLetterBtn'+res[i].letterNo;
					$(markLetterBtn).attr('class','btn btn-warning btn-xs waves-effect waves-light')
				}
// 				var name = senderMemberDetail('ddit404@naver.com')
// 				console.log("보낸사람정보보기 :: "+name)
// 				console.log(senderMemberDetail('ddit404@naver.com'))
			}
// 			$('#chkletter').on('change',function(){
// 				$('#selectDeleteBtn').attr('class','btn btn-danger btn-xs waves-effect waves-light d-inline')
// 			})
		},
	});//ajax
}

/* 즐겨찾기 보관함  */
 function markLetterList(){
	 $('#letterPerson').text('보낸사람')
		$('#inboxTitle').text('즐겨찾기')
		$('#letterMark').text('중요')
		$('.showbtn').attr('class','showbtn font-17')
		$('#showMark').attr('class','showbtn text-primary font-17 fw-bold')
		$('#trashbtn').attr('class','d-none text-end')	
		$('#composeBtn').attr('class', 'fs-3 btn btn-outline-primary w-100 waves-effect waves-light')
		var table = $('#letterList').DataTable({
			responsive:true,
			 retrieve: true,
//				 scrollX: true,
			scrollCollapse:true,
			language: {
	            emptyTable: "데이터가 없습니다.",
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
	            order: [ [ 4, "desc" ] ],
	         
		})
		table.clear().draw();
		var memberId = localStorage.getItem('id');
		var letterVO = {
			memberId : memberId
		}

		$.ajax({
			url : "/letter/mylist",
			type : "post",
			data : JSON.stringify(letterVO),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(res) {
				//onclick = "markLetterupdate('\${res[i].letterNo}')"
				for (var i = 0; i < res.length; i++) {
					if (res[i].letterMark == '1') {
						table.row.add([
							`<td>  <input type="checkbox" class="form-check-input" id="chkletter" name="chkletter" value="\${res[i].letterNo}"><label for="chk1" class="toggle"></label>  </td> `,
							`<td> <button id= "markLetterBtn\${res[i].letterNo}" type="button" class="btn btn-white btn-xs waves-effect waves-light" onclick = "markLetterupdate('\${res[i].letterNo}')" > 
									<i class="mdi mdi-star"></i> 
									</button>
							 </td>`,
							`<td ><a id='titlelink\${[i]}' href='javascript: void(0);' onclick= "letterDetail('\${res[i].letterNo}')">\${res[i].letterTitle} </a></td>`,
							`<td> \${getMemberDetail(res[i].letterSender)} </td>`,
							`<td>\${res[i].letterDate}</td>`,
								]).draw(false);
							
							// 상태코드 -> 미확인:0 확인 :1 즐겨찾기:2
							if (res[i].letterCheck == '0' || res[i].letterCheck == 0 ) {
								var linkid='#titlelink'+[i];
								$(linkid).css("font-weight","bold")
							}
							if (res[i].letterMark == '1' || res[i].letterMark == 1 ) {
								var markLetterBtn='#markLetterBtn'+res[i].letterNo;
								$(markLetterBtn).attr('class','btn btn-warning btn-xs waves-effect waves-light')
							}
					}
				}//for문
				
				
			},
		});//ajax
	
}
 

/* 중요메시지 업데이트 즐겨찾기 상태코드2  */
function markLetterupdate(letterNo){
// 	console.log("받은번호 : ",letterNo);
	
	var letterVO = {
			letterNo : letterNo,
		}
		$.ajax({
			url : "/letter/markletter",
			type : "post",
			data : JSON.stringify(letterVO),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(res) {
// 				console.log("마크 반환값 : ",res)
				if (res == 0 || res == '0') {
					var markLetterBtn='#markLetterBtn'+letterNo;
					$(markLetterBtn).attr('class','btn btn-white btn-xs waves-effect waves-light')
				}else if (res == 1 || res == '1') {
					var markLetterBtn='#markLetterBtn'+letterNo;
// 					console.log("누른마크번호2 : ",markLetterBtn)
					$(markLetterBtn).attr('class','btn btn-warning btn-xs waves-effect waves-light')
				}
			},

		});//ajax
	
}
 

/* 안읽은편지 횟수 카운트 */
function checkCnt(){
	var memberId = localStorage.getItem('id');
	var letterVO = {
		memberId : memberId
	}
	$.ajax({
		url : "/letter/mylist",
		type : "post",
		data : JSON.stringify(letterVO),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(res) {
			var checkCnt = 0;
// 			console.log(res)
			for (var i = 0; i < res.length; i++) {
				if (res[i].letterCheck =='0' && res[i].letterDelstate == '0') {
					checkCnt += 1;
				}
			}
// 			console.log("안읽은편지:"+checkCnt);
			$('.chkletterinit').text(checkCnt)
			
		},
	});//ajax
}

/* 받은 쪽지 상세보기 */
function letterDetail(letterNo){
	$('#letterDetail').css('display','block')
	$('#letterInbox').css('display','none')
	$('#composeLetter').css('display','none')
	$('#detailMemberBox').css('display','none')
	$('#detailDir').css('display','none')
	$('#detailTrashBtn').css('display','block ')
// 	$('#detailTrashBtn').show();
	var letterVO={
			letterNo:letterNo,
	}
	
	$.ajax({
		url : "/letter/letterdetail",
		type : "post",
		data : JSON.stringify(letterVO),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(res) {
			var senderId= res.letterSender;
			senderMemberDetail(senderId);
			$('.detailDate').text(res.letterDate);
			$('#dtailContent').html(res.letterContent);
			$("#detailNo").val(res.letterNo);
			$('#detailTitle').text(res.letterTitle);
			receiveMemberDetail(res.memberId)
			checkCnt()
			//파일목록가져오기
			var fileList = getLetterFile(letterNo)
			console.log("fileList: " ,fileList)
			//상세보기에서 초기화 
			$('#letterDetailFile').empty()
			var str="";
			var fileType ="primary";
			for (var i = 0; i < fileList.length; i++) {
				fileType = fileList[i].fileRealName.substring(fileList[i].fileRealName.lastIndexOf('.'))
				// 파일확장자 자르기 : fileList[i].fileRealName.substring(fileList[i].fileRealName.lastIndexOf('.'))
				if ( fileType =='.png' ) {
					fileType = 'primary'
				}else if ( fileType =='.jpg' ) {
					fileType = 'warning'
				}else if ( fileType =='.gif' ) {
					fileType = 'success'
				}else{
					fileType = 'info'
				}
				
			str +=`
					<div class="col-xl-4">
						<div class="card mb-1 shadow-none border">
							<div class="p-2">
								<div class="row align-items-center">
									<div class="col-auto">
										<div class="avatar-sm">
											<span class="avatar-title bg-soft-\${fileType} text-primary rounded"> \${fileList[i].fileRealName.substring(fileList[i].fileRealName.lastIndexOf('.'))} </span>
										</div>
									</div>
									<div class="col ps-0">
										<a href="/resources/upload/\${fileList[i].filePath}" download="\${fileList[i].fileRealName}"  class="text-dark fw-bold fs-4">\${fileList[i].fileRealName}</a>
										<p class="mb-0">\${fileSizeCheck_H(parseInt(fileList[i].fileSize))} </p>
									</div>
									<div class="col-auto">
										<a href="/resources/upload/\${fileList[i].filePath}" download="\${fileList[i].fileRealName}" type="file" class="btn btn-link btn-lg text-muted"> <i class="dripicons-download"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
			
			`
			console.log("파일사이즈 : ",fileList[i].fileSize)
			}
			console.log("fileType: ", fileType)
			$('#letterDetailFile').append(str)
			
		},
	});//ajax
	
	
}
function fileSizeCheck_H(size){
	  var byteUnits = ["KB", "MB", "GB", "TB"];
		if (size <1024) {
			return size.toFixed(1) + "byte";
		}
	  for (let i = 0; i < byteUnits.length; i++) {
	    size = Math.floor(size / 1024);

	    if (size < 1024) return size.toFixed(1) + byteUnits[i];
	  }

}
/* 보낸쪽지 상세보기 */
function sendLetterDetail(letterNo){
	
	$('#letterDetail').css('display','block')
	$('#letterInbox').css('display','none')
	$('#composeLetter').css('display','none')
	$('#detailMemberBox').css('display','none')
	$('#detailDir').css('display','block')
// 	$('#detailTrashBtn').hide();
	$('#detailTrashBtn').css('display','none')
// 	$('#detailTrashBtn').attr('class','d-none')
	var letterVO={
			letterNo:letterNo,
	}
	
	$.ajax({
		url : "/letter/sendletterdetail",
		type : "post",
		data : JSON.stringify(letterVO),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(res) {
// 			console.log("보낸쪽지함 상세보기:")
// 			console.log(res)
			var senderId= res.letterSender;
			senderMemberDetail(senderId);
			$('.detailDate').text(res.letterDate);
			$('#dtailContent').html(res.letterContent);
			$("#detailNo").val(res.letterNo);
			$('#detailTitle').text(res.letterTitle);
			receiveMemberDetail(res.memberId)
		},
	});//ajax
	
	
}
/* 받은사람 정보 사진이랑 이름불러오기 */
function receiveMemberDetail(memberId){
	var memberVO ={
			memberId : memberId
	}
	
	$.ajax({
		url : "/member/selectMember",
		type : "post",
		data : JSON.stringify(memberVO),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(res) {
// 			console.log(res);
			$('#detailMemberName').text(res.memberName);
			$('#detailMemberId').text(res.memberId);
			$('#detailMemberPic').attr('src',res.memberPic);
		},
	});//ajax
}
	

/* 보낸사람 정보 사진이랑 이름불러오기 */
function senderMemberDetail(senderId){
	var memberVO ={
			memberId : senderId
	}
	var senderName = ""
	$.ajax({
		url : "/member/selectMember",
		type : "post",
		data : JSON.stringify(memberVO),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(res) {
// 			console.log(res);
			$('#detailSenderName').text(res.memberName);
			$('#detailSenderId').text(res.memberId);
			$('#detailSenderPic').attr('src',res.memberPic);
			senderName = res.memberName
		},
	});//ajax
	return senderName
}
	
/* 보낸 쪽지함 */	
function sendInbox(){
	$('#letterDetail').css('display','none')
	$('#letterInbox').css('display','block')
	$('#composeLetter').css('display','none')
	$('#letterPerson').text('받은사람')
	$('#inboxTitle').text('보낸쪽지함')
	$('#letterMark').text('수신확인')
	$('.showbtn').attr('class','showbtn font-17')
	$('#sendInbox').attr('class','showbtn text-primary font-17 fw-bold')
	$('#trashbtn').attr('class','d-none text-end')
	$('#composeBtn').attr('class', 'fs-3 btn btn-outline-primary w-100 waves-effect waves-light')
	var table = $('#letterList').DataTable({
		responsive:true,
		 retrieve: true,
//			 scrollX: true,
		scrollCollapse:true,
	})
	table.clear().draw();
	var memberId = localStorage.getItem('id');
	var letterVO = {
		memberId : memberId
	}
	$.ajax({
		url : "/letter/sendlist",
		type : "post",
		data : JSON.stringify(letterVO),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(res) {
// 			console.log("보낸쪽지함")
// 			console.log(res)
			for (var i = 0; i < res.length; i++) {
			senderMemberDetail(res[i].memberId)
				
			table.row.add([
				`<td>  <input type="checkbox" class="form-check-input" id="chkletter" name="chkletter" value="\${res[i].letterNo}"><label for="chk1" class="toggle"></label>  </td> `,
				`<td> <span id="readchk\${[i]}" class="badge bg-light text-dark rounded-pill">확인전</span></td>`,
				`<td><a id='titlelink\${[i]}' href='javascript: void(0);' onclick= "sendLetterDetail('\${res[i].letterNo}')">\${res[i].letterTitle} </a></td>`,
				`<td> <span id= "targetName">  \${getMemberDetail(res[i].memberId)} </span> </td>`,
				`<td>\${res[i].letterDate}</td>`,
					]).draw(false);
			
				if (res[i].letterCheck == '1' || res[i].letterCheck == 1 ) {
					var readchk='#readchk'+i;
					$(readchk).attr("class","badge bg-success rounded-pill");
					$(readchk).text('확인함');
				}
			}
			
		},
	});//ajax

}	

/* 휴지통 */	
function trashBox(){
	$('#letterDetail').css('display','none')
	$('#letterInbox').css('display','block')
	$('#composeLetter').css('display','none')
	$('#letterPerson').text('받은사람')
	$('#inboxTitle').text('휴지통')
	$('#letterMark').text('복원')
	$('.showbtn').attr('class','showbtn font-17')
	$('#trashBox').attr('class','showbtn text-primary font-17 fw-bold')
	$('#trashbtn').attr('class','d-none text-end')
	$('#composeBtn').attr('class', 'fs-3 btn btn-outline-primary w-100 waves-effect waves-light')
	var table = $('#letterList').DataTable({
		responsive:true,
		 retrieve: true,
//			 scrollX: true,
		scrollCollapse:true,
	})
	table.clear().draw();
	var memberId = localStorage.getItem('id');
	var letterVO = {
		memberId : memberId
	}
	$.ajax({
		url : "/letter/dellist",
		type : "post",
		data : JSON.stringify(letterVO),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(res) {
// 			console.log("휴지통")
// 			console.log(res)
			for (var i = 0; i < res.length; i++) {
				senderMemberDetail(res[i].letterSender)
			table.row.add([
				`<td>  <input type="checkbox" class="form-check-input" id="chkletter" name="chkletter" value="\${res[i].letterNo}"><label for="chk1" class="toggle"></label>  </td> `,
				`<td>  
					<button onclick="refreshLetter(\${res[i].letterNo})" type="button" class="btn btn-info btn-xs waves-effect waves-light">
						<i class="fe-refresh-cw"></i>
					</button>
				</td>`,
				`<td><a  id='titlelink\${[i]}' href='javascript: void(0);' onclick= "letterDetail('\${res[i].letterNo}')">\${res[i].letterTitle} </a></td>`,
				`<td> \${getMemberDetail(res[i].letterSender)} </span> </td>`,
				`<td>\${res[i].letterDate}</td>`,
					]).draw(false);
			
			//href='/letter/datail?letterNo=\${res[i].letterNo}'
				if (res[i].letterCheck == '0' || res[i].letterCheck == 0 ) {
					var linkid='#titlelink'+[i];
					$(linkid).css("font-weight","bold")
				}
			}
			
		},
	});//ajax

}	

/* 쪽지삭제 */
function deleteLetter(){

	var len = $("input[name='chkletter']:checked").length;
// 	console.log("체크박스 길이 : "+len)
	Swal.fire({
		  title: '쪽지 삭제',
		  text: "해당 쪽지를 삭제하시겠습니까?",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제'
		}).then((result) => {
		  if (result.isConfirmed) {
		   
		    if(len > 0){ //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
			    $("input[name='chkletter']:checked").each(function(e){
// 			        console.log("체크박스 값"+$(this).val())
			        	var letterVO = {
							letterNo : $(this).val()
						}
			    	 $.ajax({
							url : "/letter/letterdelete",
							type : "post",
							data : JSON.stringify(letterVO),
							contentType : 'application/json; charset=utf-8',
							dataType : 'text',
							success : function(res) {
// 								console.log(res)
								
// 								showList()
								letterList()
								 Swal.fire(
									      '삭제완료!',
									      '해당 쪽지가 휴지통으로 이동했습니다.',
									      'success'
									    )
									    
							},
						});//ajax
			   		 })
				}
		 	 }//if (result.isConfirmed)
		})//then((result)


}

/* deatil화면에서 삭제 */
function deleteLetterDetail() {
	Swal.fire({
		  title: '쪽지 삭제',
		  text: "해당 쪽지를 삭제하시겠습니까?",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire(
		      '삭제완료!',
		      '해당 쪽지가 휴지통으로 이동했습니다.',
		      'success'
		    )
		        var letterNo = $('#detailNo').val()
	        	var letterVO = {
					letterNo :letterNo
				}
	    	 $.ajax({
					url : "/letter/letterdelete",
					type : "post",
					data : JSON.stringify(letterVO),
					contentType : 'application/json; charset=utf-8',
					dataType : 'text',
					success : function(res) {
// 						console.log(res)
						
						showList()
					},
				});//ajax
		 	 }//if (result.isConfirmed)
   		 })
   		 
}

/* 휴지통에서 복원 복구  */
function refreshLetter(letterNo){
	var letterVO = {
			letterNo:letterNo
	}
Swal.fire({
	  title: '복구하시겠습니까? ',
	  text: "휴지통에서 받은편지함으로 복귀돕니다.",
	  icon: 'info',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: 'OK'
	}).then((result) => {
	  if (result.isConfirmed) {
	    Swal.fire(
	      '복구완료!',
	      '해당 쪽지가 받은 편지함으로 이동되었습니다.',
	      'success'
	    )
	    	 $.ajax({
					url : "/letter/refreshletter",
					type : "post",
					data : JSON.stringify(letterVO),
					contentType : 'application/json; charset=utf-8',
					dataType : 'text',
					success : function(res) {
// 						console.log(res)
						
						trashBox()
					},
				});//ajax
				
		    }//alert if 문
	})
		  

}

function letterSend_K() {
    const sendMemberId = document.querySelector(".select2-multiple").value;
    const letterTitle = document.querySelector("#letterTitle").value;
    const content = $('.ql-editor').html();
    
    const data = {
      letterSender: memberId,
      memberId: sendMemberId,
      letterTitle: letterTitle,
      letterContent : content,
    };
    
    axios
      .post('/letter/insert', data)
      .then((res) => {
         const letterNo = res.data;
         const fileData = document.querySelector("#letterFile");
         
         console.log("성공한 번호 : ", letterNo);
         console.log("fileData.files.length : ", fileData.files.length);
         
         if (fileData.files.length > 0) {
             uploadFileAjax_Letter_K(fileData, letterNo);
         }
         alert('메시지 전송완료 ')
          showList();
         updateAlarm(memberId, 'sendLetter', sendMemberId, '');
      });
}


function uploadFileAjax_Letter_K(fileData, letterNo) {
    const fileList = fileData.files;
    const formData_K = new FormData();
    
    for(var i = 0; i < fileList.length; i++){
        formData_K.append("uploadFile", fileList[i]);   
    }
    
    const jsonObj = {
      letterNo,
      memberId,
    };
    
    const jsonData = JSON.stringify(jsonObj);
    
    formData_K.append("jsonData", jsonData);
    
    $.ajax({
        url : '/letter/uploadAjaxLetter_K',
        processData : false,
        contentType : false,
        data : formData_K,
        type : 'post',
        dataType : 'json',
        success : function(result){
            console.log("파일 다운로드 경로 리스트 :: ", result);
        }
    }); 
}

//파일경로 가져오기 
function getLetterFile(letterNo){
	//테스트 743
	var letterVO={
			letterNo : letterNo
	}
	var letterFileList;
	$.ajax({
		url : "/letter/getletterfile",
		type : "post",
		data : JSON.stringify(letterVO),
		async:false,
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(res) {
			console.log("가져온파일리스트: " ,res)
			letterFileList= res
		},

	});//ajax
	return letterFileList;
}

//보내기 
/* $('#sendLetterBtn').on('click',function(){
	var memberId = $('#selectize-optgroup').val()[0]
	var letterTitle = $('#letterTitle').val()
	var myId = localStorage.getItem('id');
	var content =$('.ql-editor').html();
// 	var file = $('#letterFile').files
	var data ={
			letterSender: localStorage.getItem('id'),
			memberId : memberId,
			letterContent : content,
			letterTitle : letterTitle
			
		}
// 	insertFile(data);
		$.ajax({
			type: 'post',
			url:'/letter/insert',
			data: JSON.stringify(data) ,
			dataType:'text',
			contentType: 'application/json ; charset=utf-8',
			success : function(res){
				updateAlarm(myId, 'sendLetter', memberId, '');
				
				Swal.fire( '전송완료',
					      '쪽지를 보냈습니다.',
					      'success')
					      
			}		
			
		})
	
	
}) */

//회원 이름 가져오기용
function getMemberDetail(memberId) {
		var memberId = {
			memberId : memberId
		}
		var memberName;
		$.ajax({
			url : "/member/selectMember",
			type : "post",
			async : false,
			data : JSON.stringify(memberId),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(res) {
				//console.log(res)
				memberName = res.memberName
			},
		});//ajax
		return memberName;
	}

</script>




