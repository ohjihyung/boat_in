
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

.newsCard:hover{
	treansform: scale(1.03);
	-webkit-transform: scale(1.03);
	cursor: pointer;
}

#projectIcon{
	font-size: 3.3em;
}


#projectNameSpan{
	display:none;
}

#projectBtnFromHome:hover #projectIcon{
	display:none;
}

#projectBtnFromHome:hover #proTypeNamePTag{
	display:none;
}

#projectBtnFromHome:hover #projectNameSpan{
	display:block;
}

#proTypeNamePTag{
	font-size: 1.2em;
	font-weight: bold;
}

#projectNameSpan{
	font-size: 1.3em;
	font-weight: bold;
}


</style>

<button id="popupBtn" type="button" class="btn btn-primary d-none" data-bs-toggle="modal" data-bs-target="#standard-modal">Standard Modal</button>
	<div id="standard-modal" class="modal fade" tabindex="-1"
		aria-labelledby="standard-modalLabel" 
		aria-modal="true" role="dialog">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="width: 500px; height: 650px">
				<div class="modal-header" style="background-color: #dbe7ec; text-align: center">
					<span class="modal-title fs-2 fw-bold" id="standard-modalLabel" style=" margin-left: 18%;">📢 BOAT-IN에서 알려드립니다</span>
				</div>
				<div class="modal-body text-center">
					<div style="padding: 0px">
						<span class="fs-3 fw-bold text-center">
							[공지] BOAT-IN 고객센터 휴무 안내 (2/15 ~ 2/21)
						</span>
					</div>
					<hr>
					<div>
						<p class="fs-4">
							안녕하십니까? BOAT-IN입니다.<br>
							
							고객센터 휴무에 대해 안내해드립니다.<br>
							아래 내용을 확인하셔서 서비스 이용에 참고해주시기 바랍니다.<br><br>
							
							■ 임시 휴무 안내<br>
							- 2023년 2월 15일(수) ~ 2월 21일(화)<br>
							
							■ 임시 휴무에 따른 영향<br>
							- 고객센터(게시판/전화) 운영 제한<br><br>
							
							■ 서비스 안내<br>
							- 서비스 신규 신청 및 연장은 자동으로 처리됩니다.<br>
							- 메일 문의 및 전화 문의는 2월 21일 14시부터 가능합니다. <br>
							- 서비스 이용 및 서버 모니터링은 365일 24시간 모니터링되고 있습니다.<br><br>
							
							더 나은 서비스를 제공하기 위해 노력하겠습니다.<br>
							감사합니다.
							
						</p>
					</div>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button type="button" class="btn btn-primary" onclick="setCookie('popup','close', 1)" style="font-size: 1.3em">하루 보지 않기</button>
					<button type="button" class="btn btn-light" data-bs-dismiss="modal" id="closePopBtn" style="font-size: 1.3em">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<div class="content-page" id="changeMyhomeBgDiv">
		<!-- 배경색 변경은 이 div에 줘야함 -->
		<div class="content">
			<div class="container-fluid" id="home-target">
				<!-- 여기까지만 동일 -->


				<div class="mt-2">
					<div class="row justify-content-center">
						<div class="col-xl-10">
							<div class="card-body" style="text-align: center">
								<div>
									<img src="" class="rounded-circle avatar-xxl"
										alt="profile-image" id="memberPicPrintTag">
								</div>
								<h1 style="font-weight: bold">
									안녕하세요, <span id="memberNamePrint"></span>&nbsp;님
								</h1>
							</div>
						</div>
					</div>
				</div>


				<div class="row justify-content-center">
					<div class="col-xl-10" style="padding: 0%;">

						<nav id="navbar-example2"
							class="navbar navbar-light bg-white px-3"
							style="border-radius: 5px">
							<a class="navbar-brand ps-2"
								style="width: 119px; font-size: 1.4em"><strong>HOME</strong></a>

							<div class="justify-content-center">
								<ul class="nav nav-pills">
									<li class="nav-item" style="font-size: 1em"><input
										type="text" id="inputDateInMyHome"
										style="text-align: center; outline-style: none; width: 50%; margin-left: 20%; border: none; font-weight: bold; font-size: 1.4em"
										readonly></li>
								</ul>
							</div>
							<ul class="nav nav-pills">
								<li class="nav-item pe-2"><a href="#myHomeCostomizingModal"
									data-bs-toggle="modal" style="color: black; font-size: 1.2em;">
										<img alt="" src="/resources/src/images/컬러칩.png"
										style="width: 30px"> <strong>홈 배경색 설정</strong>
								</a></li>

							</ul>
						</nav>
					</div>
				</div>
				<br>


				<div class="row justify-content-center homeDraggable">
					<div class="col-xl-10" style="padding: 0%;">
						<div class="card" style="height: 180px;">
							<div class="card-body">
								<div class="row align-items-center">
									<h3 class="header-title mb-2" style="font-size: 1.3em">
										내 프로젝트<span class="badge bg-primary rounded-pill ms-1"
											id="myhomeprojectList"></span>
									</h3>
									<!-- START carousel-->
									<div id="carouselExampleControls" class="carousel slide">
										<div class="carousel-inner" role="listbox"
											style="margin-left: 2%; width: 97.7%">
											<div class="d-flex" id="myprojectListInMyhome">
												<div style="margin: auto; padding-top: 2%; display: none"
													id="projectMakeFromMyhome">
													<button type="button"
														class="btn btn-primary waves-effect waves-light width-lg"
														onclick="newProjectModalToggle()">새 프로젝트 생성</button>
												</div>
											</div>
											<div class="carousel-item active projectListItem"
												data-bs-interval="120000">
												<div id="testcaro1"></div>
											</div>
											<div class="carousel-item projectListItem"
												data-bs-interval="120000">
												<div id="testcaro2"></div>
											</div>
										</div>

									</div>
									<div id="projectListCarouselBtn">
										<a class="carousel-control-prev"
											href="#carouselExampleControls" role="button"
											data-bs-slide="prev" style="width: 6%;"> <span
											class="text-dark"
											style="margin-top: 40%; font-size: 3em; padding: 0%; border-radius: 40%"><i
												class="fe-chevron-left"></i></span> <span class="visually-hidden">Previous</span>
										</a> <a class="carousel-control-next"
											href="#carouselExampleControls" role="button"
											data-bs-slide="next" style="width: 6%"> <span
											class="text-dark"
											style="margin-top: 40%; font-size: 3em; padding: 0%; border-radius: 40%"><i
												class="fe-chevron-right"></i></span> <span class="visually-hidden">Next</span>
										</a>
									</div>

								</div>


							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 내 프로젝트 row끝! -->

			<div class="row justify-content-center homeDraggable">


				<div class="col-xl-5">
					<div class="card" style="height: 340px;">
						<div class="card-body">
							<div class="row">
								<h4 class="header-title mb-2"
									style="float: left; font-size: 1.3em">내 작업</h4>
							</div>
							<!-- 이 안에 내용 들어가야 함 -->
							<div class="ustify-content-center">
								<div>
									<ul class="nav nav-pills navtab-bg nav-justified">
										<li class="nav-item"><a
											style="font-size: 1.2em; font-weight: bold"
											href="#deadLinebefore3DaysWorkList" data-bs-toggle="tab"
											aria-expanded="true" class="nav-link active"> 마감일 3일 이내
												작업 </a></li>
										<li class="nav-item"><a
											style="font-size: 1.2em; font-weight: bold"
											href="#outOfdeadLineWorkList" data-bs-toggle="tab"
											aria-expanded="true" class="nav-link"> 마감일 지난 작업 </a></li>
									</ul>

									<div class="tab-content">
										<div class="tab-pane active" id="deadLinebefore3DaysWorkList">
											<table class="table table-hover table-centered mb-0"
												id="before3DaysWorksTable">
												<thead style="font-size: 1.2em">
													<tr>
														<th style="width: 25%">작업이름</th>
														<th style="width: 17%">작업상태</th>
														<th style="width: 18%">시작일</th>
														<th style="width: 18%">마감일</th>
														<th style="width: 25%">프로젝트</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
										<div class="tab-pane show" id="outOfdeadLineWorkList">
											<table class="table table-hover table-centered mb-0"
												id="outOfdeadLineWorksTable">
												<thead style="font-size: 1.2em">
													<tr>
														<th style="width: 25%">작업이름</th>
														<th style="width: 15%">진행도</th>
														<th style="width: 17%">작업상태</th>
														<th style="width: 18%">마감일</th>
														<th style="width: 25%">프로젝트</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>


				<div class="col-xl-5">
					<div class="card" style="height: 340px;">
						<div class="card-body">

							<div class="row">
								<h4 class="header-title mb-2"
									style="float: left; font-size: 1.3em">
									알림&nbsp;<i class="fe-bell"></i>
								</h4>
							</div>

							<div class="row justify-content-center">
								<div class="col-xl-3">
									<div class="nav flex-column nav-pills nav-pills-tab"
										id="v-pills-tab-myHome" role="tablist"
										aria-orientation="vertical" style="font-size: 1.1em">
										<a style="font-weight: bold" class="nav-link show mb-1 active"
											id="v-pills-project-tab" data-bs-toggle="pill"
											href="#v-pills-project" role="tab"
											aria-controls="vv-pills-project" aria-selected="true">
											프로젝트<span class="badge bg-danger rounded-pill ms-1 float-end"
											id="pojectUnreadAlarmLength"></span>
										</a> <a style="font-weight: bold" class="nav-link mb-1"
											id="v-pills-invite-tab" data-bs-toggle="pill"
											href="#v-pills-invite" role="tab"
											aria-controls="v-pills-invite" aria-selected="false">
											프로젝트 초대<span
											class="badge bg-danger rounded-pill ms-1 float-end"
											id="inviteUnreadAlarmLength"></span>
										</a> <a style="font-weight: bold" class="nav-link mb-1"
											id="v-pills-mail-tab" data-bs-toggle="pill"
											href="#v-pills-mail" role="tab" aria-controls="v-pills-mail"
											aria-selected="false"> 쪽지<span
											class="badge bg-danger rounded-pill ms-1 float-end"
											id="mailUnreadAlarmLength"></span></a> <a
											style="font-weight: bold" class="nav-link mb-1"
											id="v-pills-chatting-tab" data-bs-toggle="pill"
											href="#v-pills-chatting" role="tab"
											aria-controls="v-pills-chatting" aria-selected="false">
											채팅<span class="badge bg-danger rounded-pill ms-1 float-end"
											id="chattingUnreadAlarmLength"></span>
										</a> <a style="font-weight: bold" class="nav-link mb-1"
											id="v-pills-common-tab" data-bs-toggle="pill"
											href="#v-pills-common" role="tab"
											aria-controls="v-pills-common" aria-selected="false"> 댓글<span
											class="badge bg-danger rounded-pill ms-1 float-end"
											id="commentUnreadAlarmLength"></span></a> <a
											style="font-weight: bold" class="nav-link mb-1"
											id="v-pills-likelike-tab" data-bs-toggle="pill"
											href="#v-pills-likelike" role="tab"
											aria-controls="v-pills-likelike" aria-selected="false">
											좋아요❤<span class="badge bg-danger rounded-pill ms-1 float-end"
											id="likeUnreadAlarmLength"></span>
										</a>
									</div>
								</div>
								<!-- end col-->

								<div class="col-xl-8" data-simplebar style="max-height: 257px;">
									<div class="tab-content pt-0">
										<div class="tab-pane fade active show" id="v-pills-project"
											role="tabpanel" aria-labelledby="v-pills-project-tab"
											style="font-size: 1.13em">
											<div class="list-group" id="myAlarmProject1"
												style="font-weight: bold">
												<div style="text-align: center;" class="mt-5 pt-2"
													id="sppinerInAlarm">
													<div class="spinner-border text-primary m-2 avatar-sm"
														role="status"></div>
												</div>
											</div>
											<div class="list-group" id="myAlarmProject2"
												style="font-weight: bold"></div>

										</div>
										<div class="tab-pane fade" id="v-pills-invite" role="tabpanel"
											aria-labelledby="v-pills-invite-tab"
											style="font-size: 1.13em">
											<div class="list-group" id="myAlarmInvite1"
												style="font-weight: bold"></div>
											<div class="list-group" id="myAlarmInvite2"
												style="font-weight: bold"></div>
										</div>
										<div class="tab-pane fade" id="v-pills-mail" role="tabpanel"
											aria-labelledby="v-pills-mail-tab" style="font-size: 1.13em">
											<div class="list-group" id="myAlarmMail1"
												style="font-weight: bold"></div>
											<div class="list-group" id="myAlarmMail2"
												style="font-weight: bold"></div>
										</div>
										<div class="tab-pane fade" id="v-pills-chatting"
											role="tabpanel" aria-labelledby="v-pills-chatting-tab"
											style="font-size: 1.13em">
											<div class="list-group" id="myAlarmChatting1"
												style="font-weight: bold"></div>
											<div class="list-group" id="myAlarmChatting2"
												style="font-weight: bold"></div>
										</div>
										<div class="tab-pane fade" id="v-pills-common" role="tabpanel"
											aria-labelledby="v-pills-common-tab"
											style="font-size: 1.13em">
											<div class="list-group" id="myAlarmComment1"
												style="font-weight: bold"></div>
											<div class="list-group" id="myAlarmComment2"
												style="font-weight: bold"></div>
										</div>
										<div class="tab-pane fade" id="v-pills-likelike"
											role="tabpanel" aria-labelledby="v-pills-likelike-tab"
											style="font-size: 1.13em">
											<div class="list-group" id="myAlarmLike1"
												style="font-weight: bold"></div>
											<div class="list-group" id="myAlarmLike2"
												style="font-weight: bold"></div>
										</div>
									</div>
								</div>
								<!-- end col-->
							</div>
							<!-- end row -->

						</div>
					</div>
				</div>




			</div>

			<!-- 	 		<div style="height:100px"></div>배경색 끝까지 채우기 위해서 필요 -->


			<div class="homeDraggable">
				<div class="row justify-content-center">


					<div class="col-xl-10">

						<div id="carouselExampleSlidesOnly" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-inner" role="listbox">

								<div class="carousel-item active" data-bs-interval="4500">
									<div class="row">
										<div class="col-xl-4 newsCard" id="newsLinkTag1" onclick="">
											<div class="card mb-3" style="height: 145px">
												<div class="row g-0">
													<div class="col-xl-5"
														style="height: 145px; margin: 0 auto;">
														<img id="newsImgTag1"
															style="width: 100%; height: 100%; object-fit: fill; border-top-left-radius: 3%; border-bottom-left-radius: 3%"
															src="" alt="...">
													</div>
													<div class="col-xl-7">
														<div class="card-body" style="padding-top: 7%;">
															<div style="height: 90px;">
																<h4 class="card-title"
																	style="line-height: 1.5em; margin-bottom: 1%;">
																	<strong id="newsTitle1"></strong>
																</h4>
																<p class="card-text">
																	<small class="text-muted"> <strong
																		id="newsTime1"></strong>
																	</small>
																</p>
															</div>
															<div>
																<img class="avatar-xs rounded-circle"
																	src="/resources/profileImg/mk_logo.jfif"> <strong>매일경제:&nbsp;IT&#149;인터넷</strong>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 newsCard" id="newsLinkTag2" onclick="">
											<div class="card mb-3" style="height: 145px">
												<div class="row g-0">
													<div class="col-xl-5"
														style="height: 145px; margin: 0 auto;">
														<img id="newsImgTag2"
															style="width: 100%; height: 100%; object-fit: fill; border-top-left-radius: 3%; border-bottom-left-radius: 3%"
															src="" alt="...">
													</div>
													<div class="col-xl-7">
														<div class="card-body" style="padding-top: 7%;">
															<div style="height: 90px;">
																<h4 class="card-title"
																	style="line-height: 1.5em; margin-bottom: 1%;">
																	<strong id="newsTitle2"></strong>
																</h4>
																<p class="card-text">
																	<small class="text-muted"> <strong
																		id="newsTime2"></strong>
																	</small>
																</p>
															</div>
															<div>
																<img class="avatar-xs rounded-circle"
																	src="/resources/profileImg/mk_logo.jfif"> <strong>매일경제:&nbsp;IT&#149;인터넷</strong>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 newsCard" id="newsLinkTag3" onclick="">
											<div class="card mb-3" style="height: 145px">
												<div class="row g-0">
													<div class="col-xl-5"
														style="height: 145px; margin: 0 auto;">
														<img id="newsImgTag3"
															style="width: 100%; height: 100%; object-fit: fill; border-top-left-radius: 3%; border-bottom-left-radius: 3%"
															src="" alt="...">
													</div>
													<div class="col-xl-7">
														<div class="card-body" style="padding-top: 7%;">
															<div style="height: 90px;">
																<h4 class="card-title"
																	style="line-height: 1.5em; margin-bottom: 1%;">
																	<strong id="newsTitle3"></strong>
																</h4>
																<p class="card-text">
																	<small class="text-muted"> <strong
																		id="newsTime3"></strong>
																	</small>
																</p>
															</div>
															<div>
																<img class="avatar-xs rounded-circle"
																	src="/resources/profileImg/mk_logo.jfif"> <strong>매일경제:&nbsp;IT&#149;인터넷</strong>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- carousel item끝 -->

								<div class="carousel-item" data-bs-interval="4500">
									<div class="row">
										<div class="col-xl-4 newsCard" id="newsLinkTag4" onclick="">
											<div class="card mb-3" style="height: 145px">
												<div class="row g-0">
													<div class="col-xl-5"
														style="height: 145px; margin: 0 auto;">
														<img id="newsImgTag4"
															style="width: 100%; height: 100%; object-fit: fill; border-top-left-radius: 3%; border-bottom-left-radius: 3%"
															src="" alt="...">
													</div>
													<div class="col-xl-7">
														<div class="card-body" style="padding-top: 7%;">
															<div style="height: 90px;">
																<h4 class="card-title"
																	style="line-height: 1.5em; margin-bottom: 1%;">
																	<strong id="newsTitle4"></strong>
																</h4>
																<p class="card-text">
																	<small class="text-muted"> <strong
																		id="newsTime4"></strong>
																	</small>
																</p>
															</div>
															<div>
																<img class="avatar-xs rounded-circle"
																	src="/resources/profileImg/mk_logo.jfif"> <strong>매일경제:&nbsp;IT&#149;인터넷</strong>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 newsCard" id="newsLinkTag5" onclick="">
											<div class="card mb-3" style="height: 145px">
												<div class="row g-0">
													<div class="col-xl-5"
														style="height: 145px; margin: 0 auto;">
														<img id="newsImgTag5"
															style="width: 100%; height: 100%; object-fit: fill; border-top-left-radius: 3%; border-bottom-left-radius: 3%"
															src="" alt="...">
													</div>
													<div class="col-xl-7">
														<div class="card-body" style="padding-top: 7%;">
															<div style="height: 90px;">
																<h4 class="card-title"
																	style="line-height: 1.5em; margin-bottom: 1%;">
																	<strong id="newsTitle5"></strong>
																</h4>
																<p class="card-text">
																	<small class="text-muted"> <strong
																		id="newsTime5"></strong>
																	</small>
																</p>
															</div>
															<div>
																<img class="avatar-xs rounded-circle"
																	src="/resources/profileImg/mk_logo.jfif"> <strong>매일경제:&nbsp;IT&#149;인터넷</strong>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 newsCard" id="newsLinkTag6" onclick="">
											<div class="card mb-3" style="height: 145px">
												<div class="row g-0">
													<div class="col-xl-5"
														style="height: 145px; margin: 0 auto;">
														<img id="newsImgTag6"
															style="width: 100%; height: 100%; object-fit: fill; border-top-left-radius: 3%; border-bottom-left-radius: 3%"
															src="" alt="...">
													</div>
													<div class="col-xl-7">
														<div class="card-body" style="padding-top: 7%;">
															<div style="height: 90px;">
																<h4 class="card-title"
																	style="line-height: 1.5em; margin-bottom: 1%;">
																	<strong id="newsTitle6"></strong>
																</h4>
																<p class="card-text">
																	<small class="text-muted"> <strong
																		id="newsTime6"></strong>
																	</small>
																</p>
															</div>
															<div>
																<img class="avatar-xs rounded-circle"
																	src="/resources/profileImg/mk_logo.jfif"> <strong>매일경제:&nbsp;IT&#149;인터넷</strong>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- carousel-item끝 -->

								<div class="carousel-item" data-bs-interval="4500">
									<div class="row">
										<div class="col-xl-4 newsCard" id="newsLinkTag7" onclick="">
											<div class="card mb-3" style="height: 145px">
												<div class="row g-0">
													<div class="col-xl-5"
														style="height: 145px; margin: 0 auto;">
														<img id="newsImgTag7"
															style="width: 100%; height: 100%; object-fit: fill; border-top-left-radius: 3%; border-bottom-left-radius: 3%"
															src="" alt="...">
													</div>
													<div class="col-xl-7">
														<div class="card-body" style="padding-top: 7%;">
															<div style="height: 90px;">
																<h4 class="card-title"
																	style="line-height: 1.5em; margin-bottom: 1%;">
																	<strong id="newsTitle7"></strong>
																</h4>
																<p class="card-text">
																	<small class="text-muted"> <strong
																		id="newsTime7"></strong>
																	</small>
																</p>
															</div>
															<div>
																<img class="avatar-xs rounded-circle"
																	src="/resources/profileImg/mk_logo.jfif"> <strong>매일경제:&nbsp;IT&#149;인터넷</strong>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 newsCard" id="newsLinkTag8" onclick="">
											<div class="card mb-3" style="height: 145px">
												<div class="row g-0">
													<div class="col-xl-5"
														style="height: 145px; margin: 0 auto;">
														<img id="newsImgTag8"
															style="width: 100%; height: 100%; object-fit: fill; border-top-left-radius: 3%; border-bottom-left-radius: 3%"
															src="" alt="...">
													</div>
													<div class="col-xl-7">
														<div class="card-body" style="padding-top: 7%;">
															<div style="height: 90px;">
																<h4 class="card-title"
																	style="line-height: 1.5em; margin-bottom: 1%;">
																	<strong id="newsTitle8"></strong>
																</h4>
																<p class="card-text">
																	<small class="text-muted"> <strong
																		id="newsTime8"></strong>
																	</small>
																</p>
															</div>
															<div>
																<img class="avatar-xs rounded-circle"
																	src="/resources/profileImg/mk_logo.jfif"> <strong>매일경제:&nbsp;IT&#149;인터넷</strong>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 newsCard" id="newsLinkTag9" onclick="">
											<div class="card mb-3" style="height: 145px">
												<div class="row g-0">
													<div class="col-xl-5"
														style="height: 145px; margin: 0 auto;">
														<img id="newsImgTag9"
															style="width: 100%; height: 100%; object-fit: fill; border-top-left-radius: 3%; border-bottom-left-radius: 3%"
															src="" alt="...">
													</div>
													<div class="col-xl-7">
														<div class="card-body" style="padding-top: 7%;">
															<div style="height: 90px;">
																<h4 class="card-title"
																	style="line-height: 1.5em; margin-bottom: 1%;">
																	<strong id="newsTitle9"></strong>
																</h4>
																<p class="card-text">
																	<small class="text-muted"> <strong
																		id="newsTime9"></strong>
																	</small>
																</p>
															</div>
															<div>
																<img class="avatar-xs rounded-circle"
																	src="/resources/profileImg/mk_logo.jfif"> <strong>매일경제:&nbsp;IT&#149;인터넷</strong>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- carousel item끝 -->

							</div>
						</div>
						<!-- 				carousel끝 -->


					</div>
					<!-- 젤 처음 생성한 row를 col-10으로 고정해주는 div -->

				</div>
				<!-- end row  -->

			</div>
			<!-- news위젯 끝! -->

			<!-- 사용자 지정 관련 모달 -->
			<div id="myHomeCostomizingModal" class="modal fade" tabindex="-1"
				style="display: none;" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
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
										<div class="backgroundColorDiv"
											style="background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);"
											id="bgcolor111">
											<i class="fe-check bgCheckedIcon" id="bgcolorIcon111"></i>
										</div>
										<div class="backgroundColorDiv"
											style="background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);"
											id="bgcolor222">
											<i class="fe-check bgCheckedIcon" id="bgcolorIcon222"></i>
										</div>
										<div class="backgroundColorDiv"
											style="background-image: linear-gradient(45deg, #ff9a9e 0%, #fad0c4 99%, #fad0c4 100%);"
											id="bgcolor333">
											<i class="fe-check bgCheckedIcon" id="bgcolorIcon333"></i>
										</div>
										<div class="backgroundColorDiv"
											style="background-image: linear-gradient(to top, #a18cd1 0%, #fbc2eb 100%);"
											id="bgcolor444">
											<i class="fe-check bgCheckedIcon" id="bgcolorIcon444"></i>
										</div>
										<div class="backgroundColorDiv"
											style="background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);"
											id="bgcolor555">
											<i class="fe-check bgCheckedIcon" id="bgcolorIcon555"></i>
										</div>
										<div class="backgroundColorDiv"
											style="background-color: #ecf2f5" id="bgcolor666">
											<i class="fe-check bgCheckedIcon" id="bgcolorIcon666"></i>
										</div>
									</div>
								</div>
								<!-- 배경색 변경 div끝! -->

							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary waves-effect"
								data-bs-dismiss="modal">취소</button>
							<button type="button"
								class="btn btn-primary waves-effect waves-light"
								onclick="updateMyhomeBgColor()">저장</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<!-- <table border="0" width="100%" height="100%"> -->
	<!-- 	<tbody> -->
	<!-- 		<tr> -->
	<!-- 			<td colspan="2" height="377"> -->
	<!-- 				<a href="이동할 주소" target="_blank">공지사항~</a> -->
	<!-- 			</td> -->
	<!-- 		</tr> -->
	<!-- 		<tr> -->
	<!-- 			<td width="250" height="23" valign="top" bgcolor="#ffffff"> -->
	<!-- 				<input type="checkbox" name="name1" onfocus="this.blur()">오늘 하루 이 창 띄우지 않음 -->
	<!-- 			</td> -->
	<!-- 			<td width="50" valign="bottom" bgcolor="#ffffff" height="23"> -->
	<!-- 				<a href="#" onclick="popup.close();">[닫기]</a> -->
	<!-- 			</td> -->
	<!-- 		</tr> -->
	<!-- 	</tbody> -->
	<!-- </table> -->




<script>
$(function(){
	if (localStorage.getItem("id")!="admin") {
		if(getCookie("popup") !="close"){
			$('#popupBtn').click();
		}
	}
})
function getCookie(name){
    var nameOfCookie = name + "=";
    var x =0;
    while (x<=document.cookie.length){
        var y = (x+nameOfCookie.length);
        if(document.cookie.substring(x,y) == nameOfCookie){
            if((endOfCookie=document.cookie.indexOf(";",y))==-1)
                endOfCookie = document.cookie.length;
            return unescape(document.cookie.substring(y, endOfCookie));
            }
            x=document.cookie.indexOf(" ",x) +1;
            if(x==0)
            break;
            }
        return "";
}

function setCookie(name, value, expiredays){
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie=name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
    
    //눌렀을 때  모달 닫고 배경 없에기 
    $('#closePopBtn').click();
}


var myHomeBgColor = "";

$(function() {
	getMemberNameAndImg()
	getTodayDate()
	changeMyhomeBg()
	projectList_B()
	selectMyAllAlarmList()
	before3DaysWorksTable()
	outOfdeadLineWorksTable()
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
	         
	         itNewsList()
	         
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

function itNewsList(){
	var newsListFirstRow = $("#newsListFirstRow");
	var newsListSecondRow = $("#newsListSecondRow");
	
	$.ajax({
	      url : "/myhome/crawlingNews",
	      type : "get",
	      contentType : 'application/json; charset=utf-8',
	      dataType : 'json',
	      success : function(res) {
	    	  
	    	  	  let list = res.newsList;
// 	    	  	  console.log("뉴스",res)
	    	  	  
 				for (let i = 0; i < list.length; i++) {
 					$("#newsTitle" + (i+1)).text(list[i].newsTitle);
 				}
 				
 				for (let i = 0; i < list.length; i++) {
 					$("#newsImgTag" + (i+1)).attr("src", list[i].newsImgSrc);
				}
 				
 				for (let i = 0; i < list.length; i++) {
 					$("#newsLinkTag" + (i+1)).attr("onclick", "window.open('" + list[i].newsLink +"')");
				}
 				
 				for(let i = 0; i < list.length; i++){
 					let str = "";
 					str += timeForToday(list[i].newsTime);
 					$("#newsTime" + (i+1)).text(str);
//  					console.log(str);
 				}
 				
	      }
	   });
	
}


function timeForToday(newsTime) {
		
			let today = new Date();
		    let timeValue = new Date(newsTime);
		
		    let betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
		    if (betweenTime < 1) return '방금전';
		    if (betweenTime < 60) {
		        return `\${betweenTime}분전`;
		    }
		
		    let betweenTimeHour = Math.floor(betweenTime / 60);
		    if (betweenTimeHour < 24) {
		        return `\${betweenTimeHour}시간전`;
		    }
		
		    let betweenTimeDay = Math.floor(betweenTime / 60 / 24);
		    if (betweenTimeDay < 365) {
		        return `\${betweenTimeDay}일전`;
		    }
    
}

function projectList_B(){
	let memberVO = {
	         memberId : localStorage.getItem('id')
	   }
	
	let myprojectListInMyhome = $("#myprojectListInMyhome")
	
	$.ajax({
		type: "post",
		url: "/myhome/projectList",
		data: JSON.stringify(memberVO),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function(res){
// 			console.log("projectList", res);
			  let str = [] ; 
		         
		         //projecttype에 따라서 다른 색상의 버튼과 아이콘 나중에 설정해주기
		         for (let i = 0; i < res.length; i++) {
		            if(res[i].proType == "WEB"){
		            str.push(` <div style="margin-left:2.5%; display:inline-block;">
		                            <div style="width:100px;height:100px;">
		                               <button id="projectBtnFromHome" onclick="location.href='/project/home?proNo=\${res[i].proNo}'" type="button" class="btn btn-soft-pink waves-effect waves-light" style="width:100%;height:100%;border-radius:15%;padding-top:15px">
		                              <iconify-icon icon="heroicons:window" id="projectIcon"></iconify-icon><p id="proTypeNamePTag">WEB</p><span id="projectNameSpan">\${res[i].proName}</span></button>
		                           </div>
		                          </div>`);
		            }else if(res[i].proType == "AI"){
		               str.push(` <div style="margin-left:2.5%;display:inline-block;">
		                        <div style="width:100px;height:100px;">
		                           <button id="projectBtnFromHome" onclick="location.href='/project/home?proNo=\${res[i].proNo}'" type="button" class="btn btn-soft-warning waves-effect waves-light" style="width:100%;height:100%;border-radius:15%;padding-top:15px">
		                          <iconify-icon icon="fluent:brain-circuit-24-regular" id="projectIcon"></iconify-icon><p id="proTypeNamePTag">A.I</p><span id="projectNameSpan">\${res[i].proName}</span></button>
		                       </div>
		                      </div>`);
		            }else if(res[i].proType == "SISM"){
		               str.push(` <div  style="margin-left:2.5%; display:inline-block;">
		                       <div style="width:100px;height:100px;">
		                          <button id="projectBtnFromHome" onclick="location.href='/project/home?proNo=\${res[i].proNo}'" type="button" class="btn btn-soft-success waves-effect waves-light" style="width:100%;height:100%;border-radius:15%;padding-top:15px">
		                         <iconify-icon icon="clarity:settings-line" id="projectIcon"></iconify-icon><p id="proTypeNamePTag">SI/SM</p><span id="projectNameSpan">\${res[i].proName}</span></button>
		                      </div>
		                     </div>`);
		            }else if(res[i].proType == "APP"){
		               str.push(` <div   style="margin-left:2.5%;display:inline-block;">
		                         <div style="width:100px;height:100px;">
		                            <button id="projectBtnFromHome" onclick="location.href='/project/home?proNo=\${res[i].proNo}'" type="button" class="btn btn-soft-info waves-effect waves-light" style="width:100%;height:100%;border-radius:15%;padding-top:15px">
		                            <iconify-icon icon="ri:apps-2-line" id="projectIcon"></iconify-icon><p id="proTypeNamePTag">APP</p><span id="projectNameSpan">\${res[i].proName}</span></button>
		                           </div>
		                    </div>`)
		            }else if(res[i].proType == "GAME"){
		               str.push(` <div  style="margin-left:2.5%;display:inline-block;">
		                     <div style="width:100px;height:100px;">
		                        <button id="projectBtnFromHome" onclick="location.href='/project/home?proNo=\${res[i].proNo}'" type="button" class="btn btn-soft-purple waves-effect waves-light" style="width:100%;height:100%;border-radius:15%;padding-top:15px">
		                        <iconify-icon icon="carbon:game-wireless" id="projectIcon"></iconify-icon><p id="proTypeNamePTag">GAME</p><span id="projectNameSpan">\${res[i].proName}</span></button>
		                       </div>
		                </div>`)
		            }else if(res[i].proType == "BIGDATA"){
		               str.push(` <div  style="margin-left:2.5%;display:inline-block;">
		                     <div style="width:100px;height:100px;">
		                    <button id="projectBtnFromHome" onclick="location.href='/project/home?proNo=\${res[i].proNo}'" type="button" class="btn btn-soft-secondary waves-effect waves-light" style="width:100%;height:100%;border-radius:15%;padding-top:15px">
		                    <iconify-icon icon="carbon:db2-database" id="projectIcon"></iconify-icon><p id="proTypeNamePTag">BIG&nbsp;DATA</p><span id="projectNameSpan">\${res[i].proName}</span></button>
		                    </div>
		             </div>`);
		            }
		            
		         }
// 		         console.log("내홈 프로젝트 : ",str)
		         	let strLength = str.length;
		         	
		         	if(str.length == 0){
		         		$("#projectMakeFromMyhome").show();
		         		$("#myhomeprojectList").text(strLength);
		         		$("#projectListCarouselBtn").hide();
		         	}
		         
		         	if(str.length>0 && str.length<9){
		         		let firstpage = "";
		         		
		         		for(var i = 0; i < str.length; i++){
		         			firstpage += str[i];
		         		}
// 		         		console.log("첫번째 페이지", firstpage)
		         		myprojectListInMyhome.html(firstpage);
		         		
		         		$("#myhomeprojectList").text(strLength);
		         		$("#projectListCarouselBtn").hide();
		         	}else if(str.length > 9){
		         		for(var i = 0; i < 9; i++){
		         			 $('#testcaro1').append(str[i])
		         		}
		         		for(var i = 9; i < 18; i++){
		         			$('#testcaro2').append(str[i])
		         		}
		         		$("#myhomeprojectList").text(strLength);
		         	}
		         	
		      }//success끝
	});
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

function projectListValue(){
	 let memberVO = {
	         memberId : localStorage.getItem('id')
	 }	 
	let proList ;
	$.ajax({
		type: "post",
		url: "/myhome/projectList",
		data: JSON.stringify(memberVO),
		async: false,
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function(res){
			proList = res;
		}
	})
	return proList;
}

function selectMyAllAlarmList(){
	 let memberVO = {
	         memberId : localStorage.getItem('id')
	 }	 
	 
	 var myAlarmProject = $("#myAlarmProject");//프로젝트 관련
	 var myAlarmInvite = $("#myAlarmInvite");//프로젝트 초대
	 var myAlarmMail = $("#myAlarmMail");//쪽지
	 
	 var myAlarmLike = $("#myAlarmLike");//개발자 지식 in 좋아요 
	 
	  $.ajax({
		    type: "post",
			url: "/myhome/selectMyAllAlarm/",
			data:JSON.stringify(memberVO),
			contentType: "application/json; charset=utf-8",
			dataType: "json",	
			success: function(result){
				
				let project = []; 
				let invite = []; 
				let mail = []; 
				let chatting = []; 
				let comment = []; 
				let like = []; 
				
				for(var i=0; i<result.length; i++){
					
					if(result[i].alrTNo == "1"){
						chatting.push(result[i]);
					}else if(result[i].alrTNo == "2"){
						comment.push(result[i]);
					}else if(result[i].alrTNo == "3"){
						like.push(result[i]);
					}else if(result[i].alrTNo == "4"){
						project.push(result[i]);
					}else if(result[i].alrTNo == "5"){
						invite.push(result[i]);
					}else if(result[i].alrTNo == "6"){
						mail.push(result[i]);
					}
				}
				
				checkreadAlarm(chatting, comment, like, project, invite, mail);
					
			}
	  })
}

function checkreadAlarm(chatting, comment, like, project, invite, mail){

	 let nonReadChat = [];
	 let readChat = [];
	 let nonReadComment = [];
	 let readComment = [];
	 let nonReadLike = [];
	 let readLike = [];
	 let nonReadProject = [];
	 let readProject = [];
	 let nonReadInvite = [];
	 let readInvite = [];
	 let nonReadMail = [];
	 let readMail = [];
	 
	 let noAlarm = `<div class="list-group-item list-group-item-light" style="height:257px;text-align:center">
									<p style="font-size:1.3em;margin-top:27%;"><i class="fe-bell-off"></i>&nbsp;알림이 없습니다</p>
							</div>`
	 
		 if(project.length == 0){
			$("#myAlarmProject1").html(noAlarm);	 
		 }
		if(invite.length == 0){
			$("#myAlarmInvite1").html(noAlarm);
		 }
		if(mail.length == 0){
			 $("#myAlarmMail1").html(noAlarm);
		 }
		if(chatting.length == 0){
			 $("#myAlarmChatting1").html(noAlarm);
		 }
		
		if(comment.length == 0){
			 $("#myAlarmComment1").html(noAlarm);
		 }
		
		if(like.length == 0){
			 $("#myAlarmLike1").html(noAlarm);
		 }
	 
		if(chatting.length > 0){
			 for (var i = 0; i < chatting.length; i++) {
				 
				 if(chatting[i].alarmCheck == "F"){
					 nonReadChat.push(chatting[i]);
				 }else{
					 readChat.push(chatting[i]);
				 }
			 }	 
		}
		 
		if(comment.length > 0){
			 for (var i = 0; i < comment.length; i++) {
				 
				 if(comment[i].alarmCheck == "F"){
					 nonReadComment.push(comment[i]);
				 }else{
					 readComment.push(comment[i]);
				 }
			 }
		}
		
		if(like.length > 0){
			 for (var i = 0; i < like.length; i++) {
				 
				 if(like[i].alarmCheck == "F"){
					 nonReadLike.push(like[i]);
				 }else{
					 readLike.push(like[i]);
				 }
			 }
		}
		 
		if(project.length > 0){
			 for (var i = 0; i < project.length; i++) {
				 if(project[i].alarmCheck == "F"){
					 nonReadProject.push(project[i]);
				 }else{
					 readProject.push(project[i]);
				 }
			 }
		}
		 
		if(invite.length > 0){
			 for (var i = 0; i < invite.length; i++) {
				 
				 if(invite[i].alarmCheck == "F"){
					 nonReadInvite.push(invite[i]);
				 }else{
					 readInvite.push(invite[i]);
				 }
			 }
		}
		 
		if(mail.length > 0){
			 for (var i = 0; i < mail.length; i++) {
				 if(mail[i].alarmCheck == "F"){
					 nonReadMail.push(mail[i]);
				 }else{
					 readMail.push(mail[i]);
				 }
			 }
		}
	 
	 
	 unReadAlarmListPrint(nonReadChat, nonReadComment, nonReadLike, nonReadProject, nonReadInvite, nonReadMail);
	 readAlarmListPrint(readChat, readComment, readLike, readProject, readInvite, readMail);
}


function unReadAlarmListPrint(nonReadChat, nonReadComment, nonReadLike, nonReadProject, nonReadInvite, nonReadMail){
	$("#sppinerInAlarm").hide();
	
	//list-group div
	var myAlarmProject1 = $("#myAlarmProject1");
	var myAlarmInvite1 = $("#myAlarmInvite1");
	var myAlarmMail1 = $("#myAlarmMail1");
	var myAlarmChatting1 = $("#myAlarmChatting1");
	var myAlarmComment1 = $("#myAlarmComment1");
	var myAlarmLike1 = $("#myAlarmLike1");
	
	//badge
	var pojectUnreadAlarmLength = $("#pojectUnreadAlarmLength");
	var inviteUnreadAlarmLength = $("#inviteUnreadAlarmLength");
	var mailUnreadAlarmLength = $("#mailUnreadAlarmLength");
	var chattingUnreadAlarmLength = $("#chattingUnreadAlarmLength");
	var commentUnreadAlarmLength = $("#commentUnreadAlarmLength");
	var likeUnreadAlarmLength = $("#likeUnreadAlarmLength");
	
	let projectStr = "";
	let invieteStr = "";
	let mailStr = "";
	let chatStr = "";
	let commentStr = "";
	let likeStr = "";
	
	//채팅방 초대
	if(nonReadChat.length > 0){
		for (var i = 0; i < nonReadChat.length; i++) {
			chatStr += `<a href="javaScript:makeReadAlarm(\${nonReadChat[i].alarmNo},\${nonReadChat[i].alrTNo},'\${nonReadChat[i].alarmData}','','')" class="list-group-item list-group-item-action">
										<div class="d-flex w-100 justify-content-between">
										<p class="mb-1 text-black"><span>\${nonReadChat[i].alarmSender}님</span>이 \${nonReadChat[i].alarmContent}</p>
											<small class="text-muted">`
			chatStr += timeForToday(nonReadChat[i].alarmDate);								
			chatStr += `</small></div></a>`
		}
		myAlarmChatting1.html(chatStr);
		chattingUnreadAlarmLength.text(nonReadChat.length);
	}
	
	//내 글에 댓글 달렸을 때
	if(nonReadComment.length > 0){
		for (var i = 0; i < nonReadComment.length; i++) {
			commentStr += `<a href="javaScript:makeReadAlarm(\${nonReadComment[i].alarmNo},\${nonReadComment[i].alrTNo},'\${nonReadComment[i].alarmData}','\${nonReadComment[i].alarmData2}', '')" class="list-group-item list-group-item-action">
											<div class="d-flex w-100 justify-content-between">
											<p class="mb-1 text-black"><span>\${nonReadComment[i].alarmSender}님</span>이 \${nonReadComment[i].alarmContent}</p>
												<small class="text-muted">`
			commentStr += timeForToday(nonReadComment[i].alarmDate)									
			commentStr += `</small></div></a>`
		}
		myAlarmComment1.html(commentStr);
		commentUnreadAlarmLength.text(nonReadComment.length);
	}
	
	if(nonReadLike.length > 0){
		for (var i = 0; i < nonReadLike.length; i++) {
			likeStr +=  `<a href="javaScript:makeReadAlarm(\${nonReadLike[i].alarmNo},\${nonReadLike[i].alrTNo},'\${nonReadLike[i].alarmData}','\${nonReadLike[i].alarmData2}','')" class="list-group-item list-group-item-action">
										<div class="d-flex w-100 justify-content-between">
										<p class="mb-1 text-black">\${nonReadLike[i].alarmContent}</p>
											<small class="text-muted">`
			likeStr += timeForToday(nonReadLike[i].alarmDate)			
			likeStr += `</small></div></a>`
		}
		myAlarmLike1.html(likeStr);
		likeUnreadAlarmLength.text(nonReadLike.length);
	}
	
	//프로젝트 관련 알림
	if(nonReadProject.length > 0){
		let projectNoList = [];
		for (var i = 0; i < nonReadProject.length; i++) {
			projectNoList.push(nonReadProject[i].alarmData);
			projectStr += `<a href="javaScript:makeReadAlarm(\${nonReadProject[i].alarmNo},\${nonReadProject[i].alrTNo},\${nonReadProject[i].alarmData},'\${nonReadProject[i].alarmData2}','\${nonReadProject[i].alarmContent}')" class="list-group-item list-group-item-action">
										<div class="d-flex w-100 justify-content-between">
										<p class="mb-1" id="unReadProjectNamePTag\${i}"></p>
											<small class="text-muted">`
			projectStr += 	timeForToday(nonReadProject[i].alarmDate)							
			projectStr += `</small></div>`
			projectStr += `<p class="mb-1 text-black">\${nonReadProject[i].alarmContent}</p>`
// 			projectStr += `<p class="mb-1" id="unReadProjectNamePTag\${i}"></p>`
			projectStr += `</a>`
		}
		myAlarmProject1.html(projectStr);
		pojectUnreadAlarmLength.text(nonReadProject.length);
		
		const proList = projectListIconPrintInAlarm(projectNoList);
		let unReadProNameList = proList .proName;
		let unReadProTypeList = proList.proType;
		
		makeProBadgeInMyAlarm(unReadProNameList, unReadProTypeList, 'unRead');
	}
	
	//프로젝트 초대
	if(nonReadInvite.length > 0){
		for (var i = 0; i < nonReadInvite.length; i++) {
			invieteStr += `<a href="javaScript:makeReadAlarm(\${nonReadInvite[i].alarmNo},\${nonReadInvite[i].alrTNo},\${nonReadInvite[i].alarmData},'\${nonReadInvite[i].memberId}','\${nonReadInvite[i].alarmContent}')" class="list-group-item list-group-item-action">
											<div class="d-flex w-100 justify-content-between">
											<p class="mb-1 text-black">\${nonReadInvite[i].alarmSender}님이 \${nonReadInvite[i].alarmContent}</p>
												<small class="text-muted">`
			invieteStr += timeForToday(nonReadInvite[i].alarmDate)
			invieteStr += `</small></div></a>`
		}
		myAlarmInvite1.html(invieteStr);
		inviteUnreadAlarmLength.text(nonReadInvite.length);
	}
	
	//쪽지
	if(nonReadMail.length > 0){
		for (var i = 0; i < nonReadMail.length; i++) {
			mailStr += `<a href="javaScript:makeReadAlarm(\${nonReadMail[i].alarmNo},\${nonReadMail[i].alrTNo},'','','')" class="list-group-item list-group-item-action">
									<div class="d-flex w-100 justify-content-between">
									<p class="mb-1 text-black">\${nonReadMail[i].alarmSender}님으로부터 \${nonReadMail[i].alarmContent}</p>
										<small class="text-muted">`
		  mailStr +=  timeForToday(nonReadMail[i].alarmDate)					
		   mailStr += `</small></div></a>`
		}
		myAlarmMail1.html(mailStr);
		mailUnreadAlarmLength.text(nonReadMail.length);
	}
	
	if(nonReadProject.length == 0){
		pojectUnreadAlarmLength.css("display", "none");
	}
	
	if(nonReadInvite.length == 0){
		inviteUnreadAlarmLength.css("display", "none");
	}
	
	if(nonReadMail.length == 0){
		mailUnreadAlarmLength.css("display", "none");
	}
	
	if(nonReadChat.length == 0){
		chattingUnreadAlarmLength.css("display", "none");
	}
	
	if(nonReadComment.length == 0){
		commentUnreadAlarmLength.css("display", "none");
	}
	
	if(nonReadLike.length == 0){
		likeUnreadAlarmLength.css("display", "none");
	}
	
}

function readAlarmListPrint(readChat, readComment, readLike, readProject, readInvite, readMail){
	$("#sppinerInAlarm").hide();
	
	//read list-group div
	var myAlarmProject2 = $("#myAlarmProject2");
	var myAlarmInvite2 = $("#myAlarmInvite2");
	var myAlarmMail2 = $("#myAlarmMail2");
	var myAlarmChatting2 = $("#myAlarmChatting2");
	var myAlarmComment2 = $("#myAlarmComment2");
	var myAlarmLike2 = $("#myAlarmLike2");
	
	let projectStr = "";
	let invieteStr = "";
	let mailStr = "";
	let chatStr = "";
	let commentStr = "";
	let likeStr = "";
	
	//채팅방 초대
	if(readChat .length > 0){
		for (var i = 0; i < readChat .length; i++) {
			chatStr += `<a href="/chat/chatMain?roomId=\${readChat[i].alarmData}" class="list-group-item list-group-item-light">
										<div class="d-flex w-100 justify-content-between">
										<p class="mb-1 text-black"><span>\${readChat[i].alarmSender}님</span>이 \${readChat[i].alarmContent}</p>
											<small class="text-muted">`
			chatStr += timeForToday(readChat[i].alarmDate);
			chatStr += `</small></div></a>`
		}
		myAlarmChatting2.html(chatStr);
	}
	
	//내 글에 댓글 달렸을 때
	if(readComment.length > 0){
		for (var i = 0; i < readComment .length; i++) {
			commentStr += `<a href="/devin/devinList?devinId=\${readComment[i].alarmData}&devinOwner=\${readComment[i].alarmData2}" class="list-group-item list-group-item-light">
											<div class="d-flex w-100 justify-content-between">
											<p class="mb-1 text-black"><span>\${readComment[i].alarmSender}님</span>이 \${readComment[i].alarmContent}</p>
												<small class="text-muted">`
			commentStr += timeForToday(readComment[i].alarmDate);
			commentStr += `</small></div></a>`
		}
		myAlarmComment2.html(commentStr);
	}
	
	if(readLike.length > 0){
		for (var i = 0; i < readLike.length; i++) {
			likeStr +=  `<a href="/devin/devinList?devinId=\${readLike[i].alarmData}&devinWriter=\${readLike[i].alarmData2}" class="list-group-item list-group-item-light">
										<div class="d-flex w-100 justify-content-between">
										<p class="mb-1 text-black">\${readLike[i].alarmContent}</p><small class="text-muted">`
			likeStr += timeForToday(readLike[i].alarmDate);	
			likeStr += `</small></div></a>`
		}
		myAlarmLike2.html(likeStr);
	}

	//프로젝트 관련 알림
	if(readProject.length > 0){
		let projectNoList = [];
		for (var i = 0; i < readProject.length; i++) {
			projectNoList.push(readProject[i].alarmData);
			if(readProject[i].alarmContent == "새로운 공지사항이 등록되었습니다."){
				projectStr +=`<a href="/project/home?proNo=\${readProject[i].alarmData}&proNoticeNo=\${readProject[i].alarmData2}" class="list-group-item list-group-item-light">`
			}else if(readProject[i].alarmContent == "새로운 상위작업이 등록되었습니다."){
				projectStr += `<a href="/project/home?proNo=\${readProject[i].alarmData}&topWorkNo=\${readProject[i].alarmData2}" class="list-group-item list-group-item-light">`
			}else if(readProject[i].alarmContent == "나의 상위작업에 댓글이 달렸습니다."){
				projectStr += `<a href="/project/home?proNo=\${readProject[i].alarmData}&topWorkNo=\${readProject[i].alarmData2}"class="list-group-item list-group-item-light">`
			}else if(readProject[i].alarmContent == "나의 하위작업이 댓글이 달렸습니다."){
				projectStr += `<a href="/project/home?proNo=\${readProject[i].alarmData}&topWorkNo=\${readProject[i].alarmData2}" class="list-group-item list-group-item-light">`
			}else if(readProject[i].alarmContent == "프로젝트 내 작업이 승인대기 상태입니다."){
				projectStr += `<a href="/project/home?proNo=\${readProject[i].alarmData}&topWorkNo=\${readProject[i].alarmData2}" class="list-group-item list-group-item-light">`
			}else if(readProject[i].alarmContent == "프로젝트 내 작업이 승인되었습니다."){
				projectStr += `<a href="/project/home?proNo=\${readProject[i].alarmData}&topWorkNo=\${readProject[i].alarmData2}" class="list-group-item list-group-item-light">`
			}else if(readProject[i].alarmContent == "프로젝트 내 작업이 반려되었습니다."){
				projectStr += `<a href="/project/home?proNo=\${readProject[i].alarmData}&topWorkNo=\${readProject[i].alarmData2}" class="list-group-item list-group-item-light">`
			}
			projectStr += `<div class="d-flex w-100 justify-content-between">
								   		<p class="mb-1" id="projectNamePTag\${i}"></p>
											<small class="text-muted">`
			projectStr += timeForToday(readProject[i].alarmDate);							
			projectStr += `</small></div>`
			projectStr += `<p class="mb-1 text-black">\${readProject[i].alarmContent}</p>`
			projectStr += `</a>`
		}
		myAlarmProject2.html(projectStr);
		const proList = projectListIconPrintInAlarm(projectNoList);
		let proNameList = proList.proName;
		let proTypeList = proList.proType;
		
 		makeProBadgeInMyAlarm(proNameList, proTypeList, 'Read');
	}
	
	//프로젝트 초대
	if(readInvite.length > 0){
		for (var i = 0; i < readInvite.length; i++) {
			invieteStr += `<a href="/projoin/inviteConrfirmPro?proNo=\${readInvite[i].alarmData}&email=\${readInvite[i].memberId}" class="list-group-item list-group-item-light">
											<div class="d-flex w-100 justify-content-between">
											<p class="mb-1 text-black"><span>\${readInvite[i].alarmSender}</span>님이 \${readInvite[i].alarmContent}</h5></p>
												<small class="text-muted">`
			invieteStr += timeForToday(readInvite[i].alarmDate);
			invieteStr += `</small></div></a>`
		}
		myAlarmInvite2.html(invieteStr);
	}
	
	//쪽지
	if(readMail.length > 0){
		for (var i = 0; i < readMail.length; i++) {
			mailStr += `<a href="/letter/home" class="list-group-item list-group-item-light">
									<div class="d-flex w-100 justify-content-between">
									<p class="mb-1 text-black"><span>\${readMail[i].alarmSender}</span>님으로부터 \${readMail[i].alarmContent}</p>
										<small class="text-muted">`
			mailStr += timeForToday(readMail[i].alarmDate);
			mailStr += `</small></div></a>`
		}
		myAlarmMail2.html(mailStr);
	}
	
}

function projectListIconPrintInAlarm(projectAlarm){
	
// 	console.log("값이 어떻게 들어오남: ", projectAlarm);
	
	let proList = projectListValue();
	let proName = [];
	let proType = [];
	
	for (var i = 0; i < projectAlarm.length; i++) {
		for (var j = 0; j < proList.length; j++) {
			if(projectAlarm[i] == proList[j].proNo){
				proName.push(proList[j].proName);
				proType.push(proList[j].proType);
			}
			
		}
	}
// 	console.log(proType);
	
	return {
		proName,
		proType
	}
}

function makeProBadgeInMyAlarm(name, type, mode){
	for (var i = 0; i < type.length; i++) {
		let str1 = "";
// 		console.log("proName return: ", name[i]);
// 		console.log("proType return: ", type[i]);
		
			if(type[i] == "WEB"){
				str1 += `<span  class="badge badge-soft-pink rounded-pill" style="font-size:0.9em"><iconify-icon icon="heroicons:window"></iconify-icon>
					&nbsp;\${name[i]}</span>`
			}else if(type[i] == "AI"){
				str1 += `<span  class="badge badge-soft-warning rounded-pill" style="font-size:0.9em"><iconify-icon icon="fluent:brain-circuit-24-regular"></iconify-icon>
					&nbsp;\${name[i]}</span>`
			}else if(type[i] == "SISM"){
				str1 += `<span  class="badge badge-soft-success rounded-pill" style="font-size:0.9em"><iconify-icon icon="clarity:settings-line"></iconify-icon>
					&nbsp;\${name[i]}</span>`
			}else if(type[i] == "APP"){
				str1 += `<span  class="badge badge-soft-info rounded-pill" style="font-size:0.9em"><iconify-icon icon="ri:apps-2-line"></iconify-icon>
					&nbsp;\${name[i]}</span>`
			}else if(type[i] == "GAME"){
				str1 += `<span  class="badge badge-soft-purple rounded-pill" style="font-size:0.9em"><iconify-icon icon="carbon:game-wireless"></iconify-icon>
					&nbsp;\${name[i]}</span>`
			}else if(type[i] == "BIGDATA"){
				str1 += `<span  class="badge badge-soft-secondary rounded-pill" style="font-size:0.9em"><iconify-icon icon="carbon:db2-database"></iconify-icon>
					&nbsp;\${name[i]}</span>`
			}
		
		if (mode == "unRead") {
		  $("#unReadProjectNamePTag" + i).html(str1);
		}else if( mode == "Read"){
		  $("#projectNamePTag" + i).html(str1);
		}else if(mode == "before3daysworkList"){
			$("#before3daysProName" + i).html(str1);
		}else{
			$("#outOfdProName" + i).html(str1);
		}
		
	}//for문 끝
}

function before3DaysWorksTable(){
	var table = $('#before3DaysWorksTable').DataTable({
		responsive:true,
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
	        emptyTable: "조건에 해당하는 내 작업이 없습니다",
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
	        order: [ [ 3, "asc" ] ],
	        pageLength: 2,
	})//dataTable 설정
	table.clear().draw();
	
	var memberVO = {
		 memberId : localStorage.getItem('id')
	};
	
	$.ajax({
		url:"/myhome/before3daysworkList",
		type: "post",
		data: JSON.stringify(memberVO),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(res) {
// 			console.log("마감 3일전 작업: ", res);
			
			var workState = "";
			let proNoList = [];
			
			for(var i= 0; i<res.length; i++){
				proNoList.push(res[i].proNo)
				if (res[i].topWorkState == 0) {
					workState =`<span class="badge bg-secondary">작업대기</span>`;
				}else if(res[i].topWorkState == 1){
					workState =`<span class="badge bg-primary">진행중</span>`;
				}else if(res[i].topWorkState == 2){
					workState =`<span class="badge bg-purple">승인대기</span>`;
				}else if(res[i].topWorkState == 3){
					workState =`<span class="badge bg-warning">수정요청</span>`;
				}else if(res[i].topWorkState == 4){
					workState =`<span class="badge bg-success">승인완료</span>`;
				}table.row.add([
					`<td><a href="/project/home?proNo=\${res[i].proNo}&topWorkNo=\${res[i].topWorkNo}">\${res[i].topWorkTitle}</a></td>`,
					`<td>\${workState}</td>`,
					`<td>\${res[i].topWorkStart}</td>`,
					`<td>\${res[i].topWorkEnd}</td>`,
					`<td><span id="before3daysProName\${i}"></span></td>`
				]).draw(false)
			}//for문끝
			
			const proList = projectListIconPrintInAlarm(proNoList);
			let proNameList = proList .proName;
			let proTypeList = proList.proType;
			
			makeProBadgeInMyAlarm(proNameList, proTypeList, 'before3daysworkList');
		}
	})
	
	
}

function outOfdeadLineWorksTable(){
	var table = $('#outOfdeadLineWorksTable').DataTable({
		responsive:true,
		 retrieve: true,
	//		 scrollX: true,
		scrollCollapse:true,
		searching: false,
		lengthChange: false,
		 lengthMenu :  [ [5], [5] ],
		 bAutoWidth: false, //자동너비
	//		columns:[
	//			{data : "컬럼명"},
	//			{data : "컬럼명"},
	//		]
		language: {
	        emptyTable: "조건에 해당하는 내 작업이 없습니다",
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
	        order: [ [ 3, "asc" ] ],
	        pageLength: 2,
	})
	table.clear().draw();
	
	var memberVO = {
		 memberId : localStorage.getItem('id')
	};
	
	$.ajax({
		url:"/myhome/outOfdeadlinelist",
		type: "post",
		data: JSON.stringify(memberVO),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(res) {
			console.log(res);
			
			var workState = "";
			let proNoList = [];
			
			for(var i= 0; i<res.length; i++){
				proNoList.push(res[i].proNo)
				if (res[i].topWorkState == 0) {
					workState =`<span class="badge bg-secondary">작업대기</span>`;
				}else if(res[i].topWorkState == 1){
					workState =`<span class="badge bg-primary">진행중</span>`;
				}else if(res[i].topWorkState == 2){
					workState =`<span class="badge bg-purple">승인대기</span>`;
				}else if(res[i].topWorkState == 3){
					workState =`<span class="badge bg-warning">수정요청</span>`;
				}else if(res[i].topWorkState == 4){
					workState =`<span class="badge bg-success">승인완료</span>`;
				}table.row.add([
					`<td><a href="/project/home?proNo=\${res[i].proNo}&topWorkNo=\${res[i].topWorkNo}">\${res[i].topWorkTitle}</td>`,
					`<td>\${res[i].topWorkProgress}%</td>`,
					`<td>\${workState}</td>`,
					`<td><span style="color:red">\${res[i].topWorkEnd}</span></td>`,
					`<td><span id="outOfdProName\${i}"></span></td>`
				]).draw(false)
			}//for문끝
			
			const proList = projectListIconPrintInAlarm(proNoList);
			let proNameList = proList .proName;
			let proTypeList = proList.proType;
			
			makeProBadgeInMyAlarm(proNameList, proTypeList, 'outOfdeadlinelist');
		}
	})//ajax끝
}


//////////김진호
//드래그 이벤트주기용
var dragItems = document.querySelectorAll(".homeDraggable");
//drag(dragItems); 일단 주석
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



function renderReadyProject() {
	let projectText = ``;
	projectText += `<div class="row">`;
	projectText += `    <div class="col-12">`;
	projectText += `      <div>`;
	projectText += `      `;
	projectText += `        <ul class="nav nav-tabs nav-bordered nav-justified">`;
	projectText += `        `;
	projectText += `            <li class="nav-item">`;
	projectText += `                <a href="#home-b2" onclick="pageTap('home')" data-bs-toggle="tab" aria-expanded="false" class="nav-link active jino-em-b">`;
	projectText += `                    홈`;
	projectText += `                </a>`;
	projectText += `            </li>`;
	projectText += `            <li class="nav-item">`;
	projectText += `                <a href="#profile-b2" onclick="pageTap('gantt')" data-bs-toggle="tab" aria-expanded="true" class="nav-link jino-em-b">`;
	projectText += `                    간트 차트`;
	projectText += `                </a>`;
	projectText += `            </li>`;
	projectText += `            <li class="nav-item">`;
	projectText += `                <a href="#messages-b2" onclick="pageTap('kanban')" data-bs-toggle="tab" aria-expanded="false" class="nav-link jino-em-b">`;
	projectText += `                    칸반 보드`;
	projectText += `                </a>`;
	projectText += `            </li>`;
	projectText += `            <li class="nav-item">`;
	projectText += `                <a href="#messages-b2" onclick="pageTap('calendar')" data-bs-toggle="tab" aria-expanded="false" class="nav-link jino-em-b">`;
	projectText += `                    캘린더`;
	projectText += `                </a>`;
	projectText += `            </li>`;
	projectText += `            <li class="nav-item">`;
	projectText += `                <a href="#messages-b2" onclick="pageTap('dataRoom')" data-bs-toggle="tab" aria-expanded="false" class="nav-link jino-em-b">`;
	projectText += `                    자료실`;
	projectText += `                </a>`;
	projectText += `            </li>`;
	projectText += `            <li class="nav-item">`;
	projectText += `                <a href="#messages-b2" onclick="pageTap('gdocs')" data-bs-toggle="tab" aria-expanded="false" class="nav-link jino-em-b">`;
	projectText += `                    공유문서 작성`;
	projectText += `                </a>`;
	projectText += `            </li>`;
	projectText += `            <li class="nav-item">`;
	projectText += `                <a href="#messages-b2" onclick="pageTap('projectNotice')" data-bs-toggle="tab" aria-expanded="false" class="nav-link jino-em-b">`;
	projectText += `                    공지사항`;
	projectText += `                </a>`;
	projectText += `            </li>`;
	projectText += `        </ul>`;
	projectText += `      </div>`;
	projectText += `    </div>`;
	projectText += `  </div>`;
	projectText += ``;
	projectText += `  <div id="finish-marquee" style="margin: 10px; background: black; display: none;">`;
	projectText += `  </div>`;
	projectText += `  <div id="kanbanTopDiv"></div>`;
	projectText += `  <div class="row justify-content-center spa"></div>`;
	projectText += `  `;
	projectText += `  <div class="row justify-content-center gantt" style="display: none;">`;
	projectText += `    <div class="row">`;
	projectText += `       <div class="col-lg-6">`;
	projectText += `         <div class="page-title-box">`;
	projectText += `           <h4 class="page-title">Gantt Chart</h4>`;
	projectText += `         </div>`;
	projectText += `       </div>`;
	projectText += `       <div class="col-lg-6" style="margin-top: 10px;" align="right">`;
	projectText += `         <button class="btn btn-success width-sm waves-effect waves-light" onclick="saveToExcel()">Excel 인쇄하기</button>`;
	projectText += `       </div>`;
	projectText += `     </div>`;
	projectText += `      `;
	projectText += `    <div id="gantt_wrap" style="width:98%; height:800px; margin-top: 0px;"></div>`;
	projectText += `    </div>`;
	projectText += `  </div>`;
	projectText += `  <div>`;
	projectText += `  </div>`;
	projectText += `</div>`;
	projectText += `</div>`;
	projectText += `</div>`;
	
	document.querySelector("#home-target").innerHTML = projectText;
}
  
  
</script>
