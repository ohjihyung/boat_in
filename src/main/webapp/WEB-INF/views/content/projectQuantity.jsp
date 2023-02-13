<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- ============================================================== -->
<!-- Start Page Content here -->
<!-- ============================================================== -->
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

			<!-- start page title -->
			<div class="row ">
				<div class="col-12">
					<div class="page-title-box">
						<h4 class="page-title">PROJECT QUANTITY</h4>
						<div>
							<ul class="breadcrumb ">
								<li class="breadcrumb-item"><button id="createPdf" type="button" class="btn btn-purple waves-effect waves-light" onclick="createPdf()">인쇄</button></li>
								<li class="breadcrumb-item"><button id="testBtn" type="button" class="btn btn-warning waves-effect waves-light">값확인버튼</button></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- end page title -->

			<div class="row">
				<div class="col-md-6 col-xl-3">
					<div class="widget-rounded-circle card bg-purple shadow">
						<div class="card-body">
							<div class="row">
								<div class="col-6">
									<div class="avatar-lg rounded-circle bg-soft-light">
										<i class="fe-bar-chart-line- font-28 avatar-title text-white"></i>
									</div>
								</div>
								<div class="col-6">
									<div class="text-end">
										<p class="text-white mb-0 text-truncate">완료된작업</p>
										<h2 class="text-white mt-2">
											<span id="completeQuantiCnt" data-plugin="counterup"> </span>
										</h2>
									</div>
								</div>
							</div>
							<!-- end row-->
						</div>
					</div>
					<!-- end widget-rounded-circle-->
				</div>
				<!-- end col-->

				<div class="col-md-6 col-xl-3">
					<div class="widget-rounded-circle card bg-info shadow-none">
						<div class="card-body">
							<div class="row">
								<div class="col-6">
									<div class="avatar-lg rounded-circle bg-soft-light">
										<i class="fe-users font-28 avatar-title text-white"></i>
									</div>
								</div>
								<div class="col-6">
									<div class="text-end">
										<p class="text-white mb-0 text-truncate">미완료 작업</p>
										<h2 class="text-white mt-2">
											<span id="goingQuantiCnt" data-plugin="counterup"> </span>
										</h2>
									</div>
								</div>
							</div>
							<!-- end row-->
						</div>
					</div>
					<!-- end widget-rounded-circle-->
				</div>
				<!-- end col 대기중인 작업. 필요없는거같아서 -->
				<!-- 				<div class="col-md-6 col-xl-3"> -->
				<!-- 					<div class="widget-rounded-circle card bg-info shadow-none"> -->
				<!-- 						<div class="card-body"> -->
				<!-- 							<div class="row"> -->
				<!-- 								<div class="col-6"> -->
				<!-- 									<div class="avatar-lg rounded-circle bg-soft-light"> -->
				<!-- 										<i class="fe-users font-28 avatar-title text-white"></i> -->
				<!-- 									</div> -->
				<!-- 								</div> -->
				<!-- 								<div class="col-6"> -->
				<!-- 									<div class="text-end"> -->
				<!-- 										<p class="text-white mb-0 text-truncate">대기중인 작업</p> -->
				<!-- 										<h2 class="text-white mt-2"> -->
				<!-- 											<span id="readyQuantiCnt" data-plugin="counterup"> </span> -->
				<!-- 										</h2> -->
				<!-- 									</div> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 							end row -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 					end widget-rounded-circle -->
				<!-- 				</div> -->
				<!-- 				end col -->

				<div class="col-md-6 col-xl-3">
					<div class="widget-rounded-circle card bg-pink shadow-none">
						<div class="card-body">
							<div class="row">
								<div class="col-6">
									<div class="avatar-lg rounded-circle bg-soft-light">
										<i class="fe-shuffle font-28 avatar-title text-white"></i>
									</div>
								</div>
								<div class="col-6">
									<div class="text-end">
										<p class="text-white mb-0 text-truncate">마감일이 지난작업</p>
										<h2 class="text-white mt-2">
											<span id="deadWorkCnt" data-plugin="counterup"></span>
										</h2>
									</div>
								</div>
							</div>
							<!-- end row-->
						</div>
					</div>
					<!-- end widget-rounded-circle-->
				</div>
				<!-- end col-->

				<div class="col-md-6 col-xl-3">
					<div class="widget-rounded-circle card bg-success shadow-none">
						<div class="card-body">
							<div class="row">
								<div class="col-6">
									<div class="avatar-lg rounded-circle bg-soft-light">
										<i class="fe-download font-28 avatar-title text-white"></i>
									</div>
								</div>
								<div class="col-6">
									<div class="text-end">
										<p class="text-white mb-0 text-truncate">총작업</p>
										<h2 class="text-white mt-2">
											<span id="proQuantiTotalCnt" data-plugin="counterup"></span>
										</h2>
									</div>
								</div>
							</div>
							<!-- end row-->
						</div>
					</div>
					<!-- end widget-rounded-circle-->
				</div>
				<!-- end col-->
			</div>
			<!-- end row-->
			<div class="row">
				<div class="col-xl-6">
					<!-- Portlet card -->
					<div class="card">
						<div class="card-body">
							<div class="card-widgets">
								<a href="javascript: void(0);" data-toggle="reload"><i class="mdi mdi-refresh"></i></a> <a data-bs-toggle="collapse" href="#cardCollpase3" role="button" aria-expanded="false" aria-controls="cardCollpase3"><i class="mdi mdi-minus"></i></a> <a href="javascript: void(0);" data-toggle="remove"><i class="mdi mdi-close"></i></a>
							</div>
							<h4 class="header-title mb-0">작업별 진행도</h4>

							<div id="cardCollpase3" class="collapse pt-3 show" dir="ltr">
								<div id="toalWorkRate" class="apex-charts" data-colors="#f06292"></div>
							</div>
							<!-- collapsed end -->
						</div>
						<!-- end card-body -->
					</div>
					<!-- end card-->
				</div>
				<!-- end col-->
				<div class="col-xl-6">
					<div class="card" style="min-height: 450px;">
						<div class="card-body">
							<ul class="nav nav-pills navtab-bg nav-justified">
								<li class="nav-item"><a href="#deadlineWork" data-bs-toggle="tab" aria-expanded="false" class="nav-link active"> 마감일 임박한 작업 </a></li>
								<li class="nav-item"><a href="#newRegiWork" data-bs-toggle="tab" aria-expanded="true" class="nav-link "> 최근 배정된 작업 </a></li>
							</ul>
							<div class="tab-content">

								<div class="tab-pane show active" id="deadlineWork">
									<div class="table-responsive">
										<table class="table table-hover table-centered mb-0">
											<thead>
												<tr>
													<th>Product Name</th>
													<th>Price</th>
													<th>Quantity</th>
													<th>Status</th>
													<th>Amount</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>ASOS Ridley High Waist</td>
													<td>$79.49</td>
													<td>82</td>
													<td><span class="badge text-success border border-success">Active</span></td>
													<td>$6,518.18</td>
												</tr>
												<tr>
													<td>Marco Lightweight Shirt</td>
													<td>$128.50</td>
													<td>37</td>
													<td><span class="badge text-warning border border-warning">Pending</span></td>
													<td>$4,754.50</td>
												</tr>
												<tr>
													<td>Half Sleeve Shirt</td>
													<td>$39.99</td>
													<td>64</td>
													<td><span class="badge text-primary border border-primary">Done</span></td>
													<td>$2,559.36</td>
												</tr>
												<tr>
													<td>Lightweight Jacket</td>
													<td>$20.00</td>
													<td>184</td>
													<td><span class="badge text-info border border-info">Progress</span></td>
													<td>$3,680.00</td>
												</tr>
												<tr>
													<td>Marco Shoes</td>
													<td>$28.49</td>
													<td>69</td>
													<td><span class="badge text-warning border border-warning">Pending</span></td>
													<td>$1,965.81</td>
												</tr>
												<tr>
													<td>ASOS Ridley High Waist</td>
													<td>$79.49</td>
													<td>82</td>
													<td><span class="badge text-primary border border-primary">Done</span></td>
													<td>$6,518.18</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane" id="newRegiWork">
									<p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.</p>
									<p class="mb-0">Vakal text here dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>
								</div>
								<div class="tab-pane" id="messages1">
									<p>Vakal text here dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>
									<p class="mb-0">Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.</p>
								</div>
							</div>
						</div>
					</div>
					<!-- end card-->
				</div>
				<!-- end col -->

			</div>
			<!-- end row -->

 
			<div class="row">
<!-- 			     <div class="col-xl-5"> -->
<!--                      Portlet card -->
<!--                      <div class="card"> -->
<!--                          <div class="card-body"> -->
<!--                              <div class="card-widgets"> -->
<!--                                  <a href="javascript: void(0);" data-toggle="reload"><i class="mdi mdi-refresh"></i></a> -->
<!--                                  <a data-bs-toggle="collapse" href="#cardCollpase19" role="button" aria-expanded="false" aria-controls="cardCollpase19"><i class="mdi mdi-minus"></i></a> -->
<!--                                  <a href="javascript: void(0);" data-toggle="remove"><i class="mdi mdi-close"></i></a> -->
<!--                              </div> -->
<!--                              <h4 class="header-title mb-0">팀원별 할당된 작업량 도넛차트</h4> -->

<!--                              <div id="cardCollpase19" class="collapse pt-3 show" dir="ltr"> -->
<!--                                  <div id="myWorkCntChart" class="apex-charts" data-colors="#675aa9,#45bbe0,#348cd4,#78c350,#f7531f"></div> -->
<!--                              </div> collapsed end -->
<!--                          </div> end card-body -->
<!--                      </div> end card -->
<!--                  </div> end col -->
			
				<div class="col-xl-5">
					<div class="card">
						<div class="card-body">
							<div class="card-widgets">
								<a href="javascript: void(0);" data-toggle="reload"><i class="mdi mdi-refresh"></i></a> <a data-bs-toggle="collapse" href="#cardCollpase5" role="button" aria-expanded="false" aria-controls="cardCollpase5"><i class="mdi mdi-minus"></i></a> <a href="javascript: void(0);" data-toggle="remove"><i class="mdi mdi-close"></i></a>
							</div>
							<h4 class="header-title mb-0">팀원별 할당된 작업량</h4>
							<div id="cardCollpase5" class="collapse pt-3 show" dir="ltr">
								<div id="myWorkCntChart" class="apex-charts" data-colors="#348cd4,#f06292,#ced4da"></div>
							</div>
							<!-- collapsed end -->
						</div>
						<!-- end card-body -->
					</div>
					<!-- end card-->
				</div>
				
				<!-- end col-->
				<div class="col-xl-4">
					<!-- Portlet card -->
					<div class="card">
						<div class="card-body">
							<div class="card-widgets">
								<a href="javascript: void(0);" data-toggle="reload"><i class="mdi mdi-refresh"></i></a> <a data-bs-toggle="collapse" href="#cardCollpase22" role="button" aria-expanded="false" aria-controls="cardCollpase22"><i class="mdi mdi-minus"></i></a> <a href="javascript: void(0);" data-toggle="remove"><i class="mdi mdi-close"></i></a>
							</div>
							<h4 class="header-title mb-0">팀원별 진행도</h4>

							<div id="cardCollpase22" class="collapse pt-3 show" dir="ltr">
								<div id="myWorkRateChart" class="apex-charts" data-colors="#348cd4,#f06292,#ff9800,#675aa9"></div>
							</div>
							<!-- collapsed end -->
						</div>
						<!-- end card-body -->
					</div>
					<!-- end card-->
				</div>
				<!-- end col-->
				<div class="col-xl-3 col-md-6">
					<div class="card">
						<div class="card-body">
							<div class="dropdown float-end">
								<a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false"> <i class="mdi mdi-dots-vertical"></i>
								</a>
								<div class="dropdown-menu dropdown-menu-end">
									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item">Sales Report</a>
									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item">Export Report</a>
									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item">Profit</a>
									<!-- item-->
									<a href="javascript:void(0);" class="dropdown-item">Action</a>
								</div>
							</div>

							<h4 class="header-title mb-3">최근 업데이트 작업 (로그)</h4>
							<div class="align-items-center border-bottom border-light pb-2 mb-1">
								<h3 class="float-end my-2 py-1">45K</h3>
								<div class="d-flex align-items-center">
									<div class="avatar-md rounded-circle bg-soft-info">
										<i class="mdi mdi-sale font-26 avatar-title text-info"></i>
									</div>

									<div class="ms-2">
										<h5 class="mb-1 mt-0 fw-bold">Total Sales</h5>
										<p class="text-muted mb-0">New Sale 20.5k</p>
									</div>
								</div>
							</div>
							<div class="align-items-center border-bottom border-light py-2 my-1">
								<h3 class="float-end my-2 py-1">13K</h3>
								<div class="d-flex align-items-center">
									<div class="avatar-md rounded-circle bg-soft-warning">
										<i class="mdi mdi-autorenew font-26 avatar-title text-warning"></i>
									</div>

									<div class="ms-2">
										<h5 class="mb-1 mt-0 fw-bold">Product Cost</h5>
										<p class="text-muted mb-0">Total Cost 12.3k</p>
									</div>
								</div>
							</div>
							<div class="align-items-center border-bottom border-light py-2 my-1">
								<h3 class="float-end my-2 py-1">16M</h3>
								<div class="d-flex align-items-center">
									<div class="avatar-md rounded-circle bg-soft-pink">
										<i class="mdi mdi-emoticon-happy-outline font-26 avatar-title text-pink"></i>
									</div>

									<div class="ms-2">
										<h5 class="mb-1 mt-0 fw-bold">Satisfaction Users</h5>
										<p class="text-muted mb-0">Total Users 26M</p>
									</div>
								</div>
							</div>
							<div class="align-items-center pt-2 mt-1">
								<h3 class="float-end my-2 py-1">75K</h3>
								<div class="d-flex align-items-center">
									<div class="avatar-md rounded-circle bg-soft-dark">
										<i class="mdi mdi-cash-multiple font-26 avatar-title text-dark"></i>
									</div>

									<div class="ms-2">
										<h5 class="mb-1 mt-0 fw-bold">Product Income</h5>
										<p class="text-muted mb-0">Income 65.4k</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
			<!-- end row -->

			
		</div>
		<!-- container -->

	</div>
	<!-- content -->



</div>

<!-- ============================================================== -->
<!-- End Page content -->
<!-- ============================================================== -->

<script type="text/javascript">
	
</script>

<script type="text/javascript">
	//pdf만들기
	$('#createPdf').on('click', function() {
		$('#chatImg').css('display', 'none')
		window.print()
		$('#chatImg').css('display', 'block')
	})

	var proNo = '103';
	var topworkVO = {
		proNo : proNo
	}

	$(function() {
		//값 확인용 버튼 클릭 
		$('#testBtn').on('click', function() {
			
		})
		toalWorkRate(topworkVO)
		totalCnt(topworkVO);
		printStateCnt();
		deadWorkCnt(topworkVO)
		myWorkCnt(topworkVO)
		myWorkRate(topworkVO);
	})

	function printStateCnt() {
		/*  0: 작업대기(미배정된작업)
		1:진행중 (배정됨)
		2:승인대기
		3:수정요청
		4:승인완료 (작업완료)
		 * */
		var ready = stateCnt(0)
		var going = stateCnt(1)
		var complete = stateCnt(4)
		$('#readyQuantiCnt').text(ready)
		$('#goingQuantiCnt').text(going)
		$('#completeQuantiCnt').text(complete)
		console.log("작업대기: ", ready)
		console.log("진행중: ", going)
		console.log("작업완료: ", complete)
	}

	//상위작업의 총 갯수 
	function totalCnt(topworkVO) {
		$.ajax({
			url : "/proquanti/totalcnt",
			type : "post",
			data : JSON.stringify(topworkVO),
			contentType : 'application/json; charset=utf-8',
			dataType : 'text',
			success : function(res) {
				console.log(res)
				$('#proQuantiTotalCnt').text(res)
			},
		});//ajax
	}

	//이미지나간작업 총갯수 
	function deadWorkCnt(topworkVO) {
		$.ajax({
			url : "/proquanti/deadworkcnt",
			type : "post",
			data : JSON.stringify(topworkVO),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(res) {
				console.log("마감일지난", res)
				$('#deadWorkCnt').text(res)
			},
		});//ajax
	}

	//상태별 상위작업의 갯수  컨트롤러에서 조건별 나눠서 리턴함
	function stateCnt(stateCode) {
		var proNo = '103';
		var topworkVO = {
			proNo : proNo,
			topWorkState : stateCode
		}
		var cnt;
		$.ajax({
			url : "/proquanti/statecnt",
			type : "post",
			async : false,
			data : JSON.stringify(topworkVO),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(res) {
				cnt = res;
			},
		});//ajax
		return cnt;
	}

	// 팀원별 할당된 작업량 
	function myWorkCnt(topworkVO) {
		$.ajax({
			url : "/proquanti/myworkcnt",
			type : "post",
			async : false,
			data : JSON.stringify(topworkVO),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(res) {
				var categories = [];
				var data = [];
				var memberName = [];
				console.log("아작스 반환값 : ", res)
				for (var i = 0; i < res.length; i++) {
					memberName.push(getMemberDetail(res[i].memberId))
					categories.push(res[i].memberId)
					data.push(res[i].topWorkCnt*1)
				}
/*
				var options = {
					chart : {
						type : 'bar'
					},
					plotOptions : {
						bar : {
							distributed : true
						}
					},
					series : [ {
						name : '작업 갯수',
						data : data
					} ],
					xaxis : {
						//회원아이디 또는 이름
						categories : memberName
					}
				}*/
				

			      
		        var options = {
		          series:data,
		          chart: {
		          width: 380,
		          type: 'donut',
		        },
		        plotOptions: {
		          pie: {
		            startAngle:0,
		            endAngle: 360
		          }
		        },
		        dataLabels: {
		          enabled: true,
		        },
		        fill: {
		          type: 'gradient',
		        },
		        legend: {
		          formatter: function(val, opts) {
		        	  console.log("값뭥미 :: ",val)
		            return val + " - " + (opts.w.globals.series[opts.seriesIndex]/1)
		          }
		        },
		        title: {
		          text: '할당된 작업량'
		        },
		        responsive: [{
		          breakpoint: 480,
		          options: {
		            chart: {
		              width: 200
		            },
		            legend: {
		              position: 'bottom'
		            }
		          }
		        }]
		        };

				var chart = new ApexCharts(document
						.querySelector("#myWorkCntChart"), options);
				chart.render();

			},
		});//ajax
	}
	// 작업별 진행도
	function toalWorkRate(topworkVO) {
		$.ajax({
			url : "/proquanti/toalworkrate",
			type : "post",
			async : false,
			data : JSON.stringify(topworkVO),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(res) {
				//작업번호,타이틀, 진행도
				var categories = [];
				var data = [];
				
				console.log("아작스 반환값 : ", res)
				for (var i = 0; i < res.length; i++) {
					categories.push(res[i].topWorkTitle)
					data.push(res[i].topWorkProgress)
				}
				console.log(categories)
				 var options = {
				          series: [{
				          name: '진행률',
				          data: data
				        }],
				          chart: {
				          height: 350,
				          type: 'line',
				        },
				        stroke: {
				          width: 5,
				          curve: 'smooth'
				        },
				        xaxis: {
// 				            type: 'datetime',
				            categories:categories ,
				        },
				        title: {
				          text: '진행도',
				          align: 'left',
				          style: {
				            fontSize: "16px",
				            color: '#666'
				          }
				        },
				        fill: {
				          type: 'gradient',
				          gradient: {
				            shade: 'dark',
				            gradientToColors: [ '#FDD835'],
				            shadeIntensity: 1,
				            type: 'horizontal',
				            opacityFrom: 1,
				            opacityTo: 1,
				            stops: [0, 100, 100, 100]
				          },
				        },
				        yaxis: {
				          min: 0,
				          max: 100
				        }
				        };

				        var chart = new ApexCharts(document.querySelector("#toalWorkRate"), options);
				        chart.render();

			},
		});//ajax
	}

	function myWorkRate(topworkVO) {

		$.ajax({
			url : "/proquanti/myworkrate",
			type : "post",
			async : false,
			data : JSON.stringify(topworkVO),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(res) {
				var categories = [];
				var data = [];
				var memberName = [];
				console.log("아작스 반환값 : ", res)
				for (var i = 0; i < res.length; i++) {
					memberName.push(getMemberDetail(res[i].memberId))
					categories.push(res[i].memberId)
					data.push(parseInt(res[i].topWorkRate))
				}
				var options = {
					chart : {
						height : 280,
						type : "radialBar",
					},
					series : data,
					plotOptions : {
						radialBar : {
							dataLabels : {
								total : {
									show : true,
									label : 'TOTAL'
								}
							},
						}
					},
					labels : memberName,
				};

				var chart = new ApexCharts(document
						.querySelector("#myWorkRateChart"), options);

				chart.render();
			},
		});//ajax
	}

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
				console.log(res)
				memberName = res.memberName
			},
		});//ajax
		return memberName;
	}
</script>

