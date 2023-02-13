<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
	<div class="content-page">
		<!-- Start Content-->
		<div class="content">
			<!-- Start container -->
			<div class="container-fluid">

				<!-- Start page title -->
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
				<!-- End page title -->

				<!-- Start list-target -->

				<div class="row" id="list-target">

					<div class="col-lg-12">
						<div class="card h-100">
							<div class="card-header">
								<h2 class="card-title">\${devinVO.dviTitle }</h2>
								<br> <i class="fe-user"></i>
								<div class="card-tools">
									<img class="me-2 avatar-sm rounded-circle" src="assets/images/users/user-3.jpg" alt="Generic placeholder image" />&nbsp; \${devinVO.memberId } &nbsp;&nbsp; <i class="fe-calendar"></i>&nbsp; \${devinVO.dviDate }
								</div>
								<div class="card-tools">
									<i class="fe-list"></i>&nbsp; \${devinVO.dviNo } &nbsp;&nbsp; <i class="fe-thumbs-up"></i><span>&nbsp; \${devinVO.dviLike }</span> &nbsp;&nbsp; <i class="fe-eye"></i>&nbsp; \${devinVO.dviHit }
								</div>
							</div>
							<div class="card-body">
								<div class="inbox-widget" id="viewer" data-simplebar style="max-height: 600px;">\${devinVO.dviContent }</div>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-12">
										<button type="button" class="btn btn-success waves-effect waves-light" onclick="renderDevinList_C()">목록</button>
										<button type="button" class="btn btn-primary waves-effect waves-light" onclick="renderDevinUpdate_C('\${devinVO.dviNo}')">수정</button>
										<button type="button" class="btn btn-danger waves-effect waves-light" id="delBtn" onclick="devinDelete_C('\${devinVO.dviNo}')">삭제</button>
									</div>
								</div>
							</div>
						</div>
					</div>




















					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">

								<!-- Story Box-->
								<!-- 여기를 댓글 리스트로 뿌려줘야겠다  박스채로 추가되면 아작스로 보내면 될듯 보내고 추가로 바로 그려서 비동기 ㄱㄱ -->
								<div class="border border-light p-2 mb-3">
									<div class="d-flex align-items-start">
										<img class="me-2 avatar-sm rounded-circle" src="assets/images/users/user-4.jpg" alt="Generic placeholder image">
										<div class="w-100">
											<h5 class="">
												Thelma Fridley <small class="text-muted"> 1 hour ago</small>
											</h5>
											<div class="">
												Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. <br /> <a href="javascript: void(0);" class="text-muted font-13 d-inline-block mt-2"><i class="mdi mdi-reply"></i> Reply</a>
											</div>
										</div>
										<div class="mt-2">
											<a href="javascript: void(0);" class="btn btn-sm btn-link text-danger"><i class="mdi mdi-heart"></i> Like</a><br> <a href="javascript: void(0);" class="btn btn-sm btn-link text-primary"><i class="mdi mdi-lead-pencil"></i> 수정</a><br> <a href="javascript: void(0);" class="btn btn-sm btn-link text-secondary"><i class="mdi mdi-delete"></i> 삭제</a><br> <a href="javascript: void(0);" class="btn btn-sm btn-link text-muted"><i class="mdi mdi-share-variant"></i> Share</a><br>
										</div>
									</div>
								</div>

								<!-- Story Box-->
								<div class="border border-light p-2 mb-3">
									<div class="d-flex align-items-start">
										<img class="me-2 avatar-sm rounded-circle" src="assets/images/users/user-4.jpg" alt="Generic placeholder image">
										<div class="w-100">
											<h5 class="">
												Thelma Fridley <small class="text-muted"> 1 hour ago</small>
											</h5>
											<div class="">
												Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. <br /> <a href="javascript: void(0);" class="text-muted font-13 d-inline-block mt-2"><i class="mdi mdi-reply"></i> Reply</a>
											</div>
										</div>
									</div>
									<div class="col-lg-12 col-sm-12 text-lg-end ">
										<a href="javascript: void(0);" class="btn btn-sm btn-link text-danger"><i class="mdi mdi-heart"></i> Like (28)</a> <a href="javascript: void(0);" class="btn btn-sm btn-link text-primary"><i class="mdi mdi-lead-pencil"></i> 수정</a> <a href="javascript: void(0);" class="btn btn-sm btn-link text-secondary"><i class="mdi mdi-delete"></i> 삭제</a> <a href="javascript: void(0);" class="btn btn-sm btn-link text-muted"><i class="mdi mdi-share-variant"></i> Share</a>
									</div>
									<div class="d-flex align-items-start mt-2">
										<a class="pe-2" href="#"> <img src="assets/images/users/user-1.jpg" class="rounded-circle" alt="Generic placeholder image" height="31">
										</a>
										<div class="w-100" style="background-color: #f2f8fb;">
											<input type="text" id="simpleinput" class="form-control border-0 form-control-sm" placeholder="Add comment">
										</div>
									</div>
								</div>
								<!-- Story Box end-->

	text = `
								<!-- comment box -->
								<div class="border border-light p-2 mb-3">
									<div class="d-flex align-items-start">
										<img class="me-2 avatar-sm rounded-circle" src="assets/images/users/user-4.jpg" alt="Generic placeholder image">
										<div class="w-100">
											<h5 class="">Thelma Fridley</h5>
											<div id="editor" class="form-control" style="height: 550px;"></div>
											<br>
											<div id="contents"></div>
											<input type="hidden" name="dviContent" id="concon" value="">
										</div>
									</div>
									<div class="col-lg-12 col-sm-12 text-lg-end ">
										<a href="javascript: void(0);" class="btn btn-sm btn-link text-muted"><i class="mdi mdi-share-variant"></i> Share</a> <a href="javascript: void(0);" class="btn btn-sm btn-link text-primary"><i class="mdi mdi-lead-pencil"></i> 등록</a>
									</div>
								</div>
								<!-- end comment box -->

							</div>
							<!-- card-body end -->
						</div>
						<!-- card end -->

					</div>
					<!-- end col -->
`









				</div>
				<!--End list-target -->

			</div>
			<!-- End container -->
		</div>
		<!-- End Content-->
	</div>
</body>
<script type="text/javascript">
	const Editor = toastui.Editor;

	const editor = new Editor({
		el : document.querySelector('#editor'),
		height : '200px',
		initialEditType : 'markdown',
		previewStyle : 'vertical'
	});
</script>