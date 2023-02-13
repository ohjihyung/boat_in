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

			<div class="row" style="height: 750px;">
				<div class="col-lg-12">
					<div class="card h-100">
						<form action="insert" method="post" id="devinForm">
							<input type="hidden" name="dviNo" /> 
							<input type="hidden" name="memberId" id="memberId" value="" />
							<div class="card-body">
								<div class="form-group">
									<label for="inputName">제목</label> 
									<input type="text" id="dviTitle" name="dviTitle" value="" class="form-control" placeholder="제목을 입력해주세요">
									<br>
								</div>

								<div class="form-group">
									<label for="inputName">내용</label>
									<div id="editor" class="form-control"></div>
									<br>
									<div id="contents"></div>
									<input type="hidden" name="dviContent" id="concon" value="">
								</div>

								<div class="row">
									<div class="col-12">
										<input type="button" value="목록" id="listBtn" class="btn btn-success waves-effect waves-light"> 
										<input type="submit" value="등록" id="formBtn" class="btn btn-primary waves-effect waves-light">
									</div>
								</div>
							</div>
						</form>
					</div><!-- end card-->
				</div><!-- end col -->
			</div><!-- end row -->
			
			<br>
		</div><!-- container -->
	</div><!-- content -->
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

<!-- 토스트 UI에디터 -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>


<script type="text/javascript">
	const Editor = toastui.Editor;
 
	const editor = new Editor({
		  el: document.querySelector('#editor'),
		  height: '550px',
		  initialEditType: 'markdown',
		  previewStyle: 'vertical'
		});
	
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

<script>
	var formBtn = $("#formBtn");
	var listBtn = $("#listBtn");
	
	var memberId = localStorage.getItem("id")
	console.log("memberId : ", memberId)
	$("#memberId").val(memberId)

	var formBtn = $("#formBtn");
	
	formBtn.on("click", function(){
 		alert(editor.getHTML());
 		cont = editor.getHTML();
 		conte = cont.replaceAll('"',"'")
// 		conte = cont.replace("<p>","")
// 		conten = conte.replace("</p>","")
// 		content = conten.replace("<br>","")
		
		$("#concon").val(conte);
	})
	
	listBtn.on("click", function(){
		location.href = "/devin/devinList";
	});
	
// 	formBtn.on("click", function(){
	
//  		if($("#devinTitle").val() == null || $("#devinTitle").val() == ""){
// 			alert("제목을 입력해주세요.");
// 			$("#devinTitle").focus();
// 			return false;
// 		}
		
// 		if($(this).val() == "수정"){
// 			$("#devinForm").attr("action", "/devin/update");
// 		}
		
// 		$("#devinForm").submit(); 
// 	});
</script>


