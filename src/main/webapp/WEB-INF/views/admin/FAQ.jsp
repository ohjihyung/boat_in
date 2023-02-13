<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

<style>
#listBox a{
	font-size: 1.2em;
}
</style>


<div class="content-page">
	<div class="content">

		<div class="row mt-3">
			<div class="col-xl-12">
				<div class="card">
					<div class="card-body">
						
						<div class="row">
							<div class="col-12">
								<h1 style="text-align: center; font-weight: bold;"> FAQ 관리 </h1>
								<div class="row justify-content-center">
									<div class="col-lg-10 mt-3 text-center" id="insertBtnDiv" style="margin-left: auto; margin-right: auto;">
										<button id="faqInsertBtn" type="button" onclick="faqInsert()" class="btn btn-primary waves-effect waves-light" style="font-size: 1.5em">입력하기</button>
										<button id="faqUpdateBtn" type="button" onclick="faqUpdateList()" class="btn btn-primary waves-effect waves-light" style="font-size: 1.5em">수정하기</button>
										<button id="faqListBtn" type="button" onclick="faqList()" class="btn btn-success waves-effect waves-light" style="font-size: 1.5em; display: none">목록</button>
									</div>
								</div>
								<hr style="width: 80%; margin-left: auto; margin-right: auto;">
							
								<div class="row pt-3 justify-content-center" id="listBox">
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
</div>



<script>

$(document).ready(function() {
	faqList();
})


// // 입력하기 클릭 시 버튼 변경
// $('#faqInsertBtn').on("click",function(){
// 	$('#faqUpdateBtn').css('display','none');
// 	$('#faqInsertBtn').css('display','none');
// 	$('#faqListBtn').css('display','inline-block');
// 	faqInsert();
// })

// // 수정하기 클릭 시 버튼 변경
// $('#faqUpdateBtn').on("click",function(){
// 	$('#faqUpdateBtn').css('display','none');
// 	$('#faqInsertBtn').css('display','none');
// 	$('#faqListBtn').css('display','inline-block');
// 	faqUpdateList();
// })

// // 목록 버튼 클릭 시 버튼 변경
// $('#faqListBtn').on("click",function(){
// 	$('#faqUpdateBtn').css('display','inline-block');
// 	$('#faqInsertBtn').css('display','inline-block');
// 	$('#listBox').empty();
// 	faqList();
// })



function faqList() {
	
	// 일단 비우기
	$('#listBox').empty();
	
	$.ajax({
		type : 'POST',
		url : '/faq/faqList',
		dataType : 'json',
		success : function(data) {
// 			console.log("faqList - success");
// 			console.log("faqList - data : ", data);			
			
			var txt = "";
			$.each(data, function(i, item) {
				
				
// 				console.log("i : ", i);
// 				console.log("faqTitle : ", item.faqTitle);
// 				console.log("faqContent : ", item.faqContent);
				
				txt += ` <div style="margin: 3px;" id="custom-accordion-one" class="accordion custom-accordion col-xl-8 \${i}">
					      <div class="card mb-0">
					        <div class="card-header" id="heading\${i}">
						        <h4 class="m-0 position-relative fw-bold">
						            <a class="custom-accordion-title text-reset d-block collapsed boat-a" data-bs-toggle="collapse" href="#collapse\${i}" aria-expanded="false" aria-controls="collapse\${i}" >
						          		\${item.faqTitle}
						                <i class="mdi mdi-chevron-down accordion-arrow"></i>
						            </a>
						        </h4>
					        </div>
					        <div id="collapse\${i}" class="collapse" aria-labelledby="heading\${i}" data-bs-parent="#custom-accordion-one" style="">
						        <div class="card-body">
						        	<p style="font-size: 1.3em; font-weight: bold">
						        		\${item.faqContent}
						        	</p>
						        </div>
							</div>
					      </div>
					      </div>
						`;
			});
			let listBox = document.querySelector("#listBox");
			listBox.innerHTML = txt;
			
			// 버튼 변경
			$('#faqListBtn').css('display','none');
			$('#faqUpdateBtn').css('display','inline-block');
			$('#faqInsertBtn').css('display','inline-block');

		},
		error : function() {
			contsole.log("faqList - error");
		}
	});
}



function faqUpdateList() {
	
		// 일단 비우기
		$('#listBox').empty();
	
		// 버튼 변경
		$('#faqListBtn').css('display','inline-block');
		$('#faqUpdateBtn').css('display','none');
		$('#faqInsertBtn').css('display','none');
		
		$.ajax({
			type : 'POST',
			url : '/faq/faqList',
			dataType : 'json',
			success : function(data) {
//	 			console.log("faqUpdateList - success");
//	 			console.log("faqUpdateList - data : ", data);			
				
// 				// 기본 리스트 지우기
// 				$('#listBox').empty();
				
				// 수정 버전 리스트 띄우기
				var txt = "";
				$.each(data, function(i, item) {
					
					
					let faqNo = item.faqNo;
					let faqTitle = item.faqTitle;
					let faqContent = item.faqContent.replaceAll("'", "\\'");
					
// 	 				console.log("i : ", i);
// 	 				console.log("faqNo : ", faqNo);
// 	 				console.log("faqTitle : ", faqTitle);
// 	 				console.log("faqContent : ", faqContent);
					
					txt += `
							<div class="accordion custom-accordion col-xl-8">
							      <div class="card mb-0">
							        <div class="card-header" id="heading\${i}">
								        <h4 class="m-0 position-relative fw-bold">
								            <a class="custom-accordion-title text-reset d-block" data-bs-toggle="collapse" aria-expanded="true" aria-controls="collapse\${i}">
								          		\${item.faqTitle}
								          		<button type="button" onclick="faqUpdate('\${faqNo}', '\${faqTitle}', '\${faqContent}')" class="btn btn-primary waves-effect waves-light" style="margin-left: 3px; padding: 5px 10px 5px; font-size: 1.0em">수정</button>
								          		<button type="button" onclick="faqDelete('\${item.faqNo}')" class="btn btn-danger waves-effect waves-light" style="margin-left: 3px; padding: 5px 10px 5px; font-size: 1.0em">삭제</button>
								            </a>
								        </h4>
							        </div>
							        <div id="collapse\${i}" class="collapse show" aria-labelledby="heading\${i}" data-bs-parent="#custom-accordion-one">
								        <div class="card-body">
								        	<p style="font-size: 1.5em; font-weight: bold">
								        	\${item.faqContent}
								        	</p>
								        </div>
									</div>
						     	 </div>
					     	 </div>
							`;
					
				});	// end of each
				$('#listBox').append(txt)
				
			},
			error : function() {
				contsole.log("faqUpdateList - error");
			}
		});	
	
}





function faqInsert() {
	
	// 버튼 변경
	$('#faqUpdateBtn').css('display','none');
	$('#faqInsertBtn').css('display','none');
	$('#faqListBtn').css('display','inline-block');

	let formArea;	

	// 입력 폼 띄우기
	let txt = "";
	txt = `
			<div id="formArea" style="display: flex; justify-content: center;">
				<div class="col-lg-6">
					<form name="ajax-form" action="#" method="post" class="contact-form mt-4 mt-lg-0" data-parsley-validate="" novalidate="">
					    <div class="row">
					        <div class="col-12">
					            <div class="mb-3">
					                <label class="form-label" style="font-size: 1.5em; font-weight: bold">질문</label>
					                <input class="form-control" id="faqTitle" name="faqTitle" type="text" placeholder="질문을 입력하세요" value="" required="" style="font-size: 1.3em">
					            </div>
					        </div>
							
					        <div class="col-12">
					            <div class="mb-3">
					                <label class="form-label" style="font-size: 1.5em; font-weight: bold">답변</label>
					                <textarea class="form-control" id="faqContent" name="faqContent" rows="6" placeholder="답변을 입력하세요" required="" style="font-size: 1.3em"></textarea>
					            </div>
					        </div>
						    <div class="row justify-content-center">
						       	<button type="button" class="btn btn-primary waves-effect waves-light col-6" id="insertBtn" style="font-size: 1.5em">등록</button>
						    </div>
					    </div>
					</form>
				</div>
			</div>
		`;
		
	let listBox = document.querySelector("#listBox");
	listBox.setAttribute("class", "row pt-3 justify-content-center");
	listBox.innerHTML = txt;

// 	// 입력하기 클릭 시 버튼 변경
// 	$('#faqUpdateBtn').on("click",function(){
// 		$('#faqUpdateBtn').css('display','none');
// 		$('#faqListBtn').css('display','inline-block');
// 		faqUpdateList();
// 	})
	
	let faqVO;
	
	$("#insertBtn").on("click", function() {
		
		let faqTitle = $("#faqTitle").val();
		let faqContent = $("#faqContent").val();
		console.log("faqContent : ", faqContent);
		console.log("faqTitle : ", faqTitle);
		
		faqVO = {
				faqTitle : faqTitle,
				faqContent : faqContent
		};
		console.log("faqVO : ", faqVO);
	
		$.ajax({
			type : "POST",
			url : "/faq/faqInsert",
			data : JSON.stringify(faqVO),
			contentType : "application/json; charset=UTF-8",
			dataType : "json",
			success : function(data) {
				console.log("faqInsert - data : ", data);
				console.log("faqInsert - success");
				
				 Swal.fire({
					  position: 'top',
					  icon: 'success',
					  title: '등록 완료',
					  showConfirmButton: false,
					  timer: 1000
					})
				
				formArea = document.querySelector("#formArea");
				console.log("formArea : ", formArea);
				formArea.setAttribute("style", "display: none");
				
				faqList();
			},
			error : function() {
				console.log("faqInsert - error");
			}		
		});	// end of ajax
	});	// end of onclick

}
	


function faqUpdate(a,b,c) {
	
	// 버튼 변경
	$('#faqListBtn').css('display','inline-block');
	$('#faqUpdateBtn').css('display','none');
	$('#faqInsertBtn').css('display','none');
	
	let faqNo = a.replaceAll("'", "\\'");
	let faqTitle = b;
	let faqContent = c;
	
	console.log("faqNo : ", faqNo);
	console.log("faqTitle : ", faqTitle);
	console.log("faqContent : ", faqContent);
	
	// 수정 버전 폼 띄우기
	let txt = "";
	txt = `
			<div id="formArea" style="display: flex; justify-content: center;">
				<div class="col-lg-6"> 
					<form name="ajax-form" action="#" method="post" class="contact-form mt-4 mt-lg-0" data-parsley-validate="" novalidate="">
					    <div class="row">
					        <div class="col-12">
					            <div class="mb-3">
					            	<h2 id="faqNo">\${faqNo}번</h2>
					                <label class="form-label"  style="font-size: 1.5em; font-weight: bold">질문</label>
					                <input class="form-control" id="faqTitle" name="faqTitle" type="text" value="\${faqTitle}"  style="font-size: 1.5em">
					            </div>
					        </div>
							
					        <div class="col-12">
					            <div class="mb-3">
					                <label class="form-label"  style="font-size: 1.5em; font-weight: bold">답변</label>
					                <textarea class="form-control" id="faqContent" name="faqContent" rows="6"  style="font-size: 1.5em">\${faqContent}</textarea>
					            </div>
					        </div>
						    <div class="row justify-content-center">
						       	<button type="button" class="btn btn-primary waves-effect waves-light col-6" id="updateBtn" style="font-size: 1.5em">등록</button>
						    </div>
					    </div>
					</form>
				</div>
			</div>
		`;

	let listBox = document.querySelector("#listBox");
	listBox.setAttribute("class", "row pt-3 justify-content-center");
	listBox.innerHTML = txt;
	
	let faqVO;
	
	$("#updateBtn").on("click", function() {

		let faqno = $("#faqNo").text();
		let faqNo = faqno.slice(0, -1);
		let faqTitle = $("#faqTitle").val();
		let faqContent = $("#faqContent").val();
		console.log("updateBtn - faqNo : ", faqNo);
		console.log("updateBtn - faqTitle : ", faqTitle);
		console.log("updateBtn - faqContent : ", faqContent);
		
		faqVO = {
					faqNo : faqNo,
					faqTitle : faqTitle,
					faqContent : faqContent											
				};
		console.log("faqVO : ", faqVO);
		
		$.ajax({
			type : "POST",
			url : "/faq/faqUpdate",
			data : JSON.stringify(faqVO),
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				console.log("faqUpdate - success");
				console.log("faqUpdate - data : ", data);

				 Swal.fire({
					  position: 'top',
					  icon: 'success',
					  title: '수정 완료',
					  showConfirmButton: false,
					  timer: 900
					})
				
				// 수정 버전 폼 숨기기
				let formArea = document.querySelector("#formArea");
				console.log("formArea : ", formArea);
				formArea.setAttribute("style", "display: none");
				
				// 기본 리스트 띄우기
				faqList();
			},
			error : function() {
				console.log("faqUpdate - error");
			}
		});
	})
}





function faqDelete(a) {
	
	let faqNo = a;
	console.log("faqNo - faqDelete : ", faqNo);
	
	let faqVO = { faqNo : faqNo };
	
	$.ajax({
		type : "POST",
		url : "/faq/faqDelete",
		data : JSON.stringify(faqVO),
		contentType : "application/json; charset=UTF-8",
		dataType : "json",
		success : function(data) {
			console.log("faqDelete - success");

			 Swal.fire({
				  position: 'top',
				  icon: 'success',
				  title: '삭제 완료',
				  showConfirmButton: false,
				  timer: 900
				})
			
			// 수정 버전 리스트 지우기
			let listBox = document.querySelector("#listBox");
			while(listBox.firstChild) {
				listBox.removeChild(listBox.firstChild);
			}
			
			// 기본 리스트 띄우기
			faqList();
		},
		error : function() {
			console.log("faqDelete - error");
		}
	});
	
	
	
	
}



</script>





