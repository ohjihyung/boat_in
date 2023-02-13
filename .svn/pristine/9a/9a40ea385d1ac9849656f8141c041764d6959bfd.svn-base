<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

			<!-- start page title -->
			<div class="row">
				<div class="col-12">
					<div class="page-title-box">
						<h4 class="page-title">DEVIN</h4>
						<div>
							<ol class="breadcrumb m-0">
								<li class="breadcrumb-item"><a href="javascript: void(0);">BOAT-IN</a></li>
								<li class="breadcrumb-item active">DEVIN</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
			<!-- end page title -->

			<div class="row" style="height: 600px;">
				<div class="col-lg-12">
					<div class="card h-100">
						<div class="card-header">
							<h2 class="card-title">제목 ${devinVO.dviTitle }</h2>
							<br>
							<div class="card-tools"> 
								<i class="fe-user"></i>&nbsp; ${devinVO.memberId } &nbsp;&nbsp;
								<i class="fe-calendar"></i>&nbsp; ${devinVO.dviDate } 
							</div>
							<div class="card-tools">
								<i class="fe-thumbs-up"></i><span>&nbsp; ${devinVO.dviLike }</span> &nbsp;&nbsp;
								<i class="fe-eye"></i>&nbsp; ${devinVO.dviHit }
							</div>
						</div>
						<div class="card-body">
							<div class="inbox-widget" data-simplebar style="max-height: 600px;">${devinVO.dviContent }</div>
						</div>
						<!-- end card-->
					</div>
				</div>	<!-- end col -->
					<div class="row">
						<div class="col-12">
							<button type="button" class="btn btn-success waves-effect waves-light" id="listBtn">목록</button>
							<button type="button" class="btn btn-primary waves-effect waves-light" id="updateBtn">수정</button>
							<button type="button" class="btn btn-danger waves-effect waves-light" id="delBtn">삭제</button>
						</div>
					</div>
				</div><!-- end row -->
				<br>
			</div><!-- container -->
		</div><!-- content -->
		<form action="/devin/update" method="get" id="nFrm">
			<input type="hidden" name="dviNo" value="${devinVO.dviNo }"/>
		</form>
	</div><!-- content-page -->

<!-- Footer Start -->
<footer class="footer">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6">
				<script>document.write(new Date().getFullYear())</script>
				&copy; Codefox theme by <a href="">Coderthemes</a>
			</div>
			<div class="col-md-6">
				<div class="text-md-end footer-links d-none d-sm-block">
					<a href="javascript:void(0);">About Us</a> <a href="javascript:void(0);">Help</a> <a href="javascript:void(0);">Contact Us</a>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- end Footer -->

<!-- 토스트 UI 뷰어 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/editor/2.0.0/toastui-editor.min.css" />

<script src="https://uicdn.toast.com/editor/2.0.0/toastui-editor-all.min.js"></script>
<script>
// initialValue는 기본값이 content로 되어 있음
// 사용하기 위해서는 넣을 데이터를 content로 선언해야함

	
	window.onload = async function loadDetails() {
		// 데이터를 돌려주는 API GET Method
		// 안에 작성글의 데이터인 details.content가 포함되어 있다.
    const details = await QuestionDetail(question_id);

    // 마크다운 조회
    const viewer = toastui.Editor.factory({
        el: document.querySelector('#viewer'),
        viewer: true,
        height: '500px',
        initialValue: details.content
    });
    
   

</script>

<script type="text/javascript">
// 	const Editor = toastui.Editor;
 
// 	const editor = new Editor({
// 		  el: document.querySelector('#editor'),
// 		  height: '600px',
// 		  initialEditType: 'markdown',
// 		  previewStyle: 'vertical'
// 		});
	
	
//     const editor = new toastui.Editor({
//         el: document.querySelector('#editor'),
//         previewStyle: 'tab',
//         height: '500px',
//         initialValue: content
//       });

</script>

<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<!-- Table Editable plugin-->
<script src="/assets/libs/jquery-tabledit/jquery.tabledit.min.js"></script>

<!-- Table editable init-->
<script src="/assets/js/pages/tabledit.init.js"></script>

<script type="text/javascript">
	$(function(){
		var nFrm = $("#nFrm");
		var listBtn = $("#listBtn");
		var updateBtn = $("#updateBtn");
		var delBtn = $("#delBtn");
		
		listBtn.on("click", function(){
			location.href = "/devin/devinList";
		});
		
		updateBtn.on("click", function(){
			nFrm.submit();
		});
		
		delBtn.on("click", function(){
			if(confirm("정말로 삭제하시겠습니까?")){
				nFrm.attr("method", "post");
				nFrm.attr("action", "/devin/delete");
				nFrm.submit();
			}else{
				nFrm.reset();
			}
		});
	});
</script>