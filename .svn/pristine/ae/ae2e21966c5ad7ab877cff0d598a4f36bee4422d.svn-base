<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <title>BOAT-IN: Main</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/dist/assets/images/favicon.ico">

        <!-- App css -->
        <link href="${pageContext.request.contextPath }/resources/dist/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
        <link href="${pageContext.request.contextPath }/resources/dist/assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />

        <link href="${pageContext.request.contextPath }/resources/dist/assets/css/bootstrap-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
        <link href="${pageContext.request.contextPath }/resources/dist/assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />

        <!-- icons -->
        <link href="/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        
        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">
        
        <style type="text/css">
        	*{
        		font-family: 'IBM Plex Sans KR', sans-serif!important;
        	}
        </style>

		<!-- 실시간 챗봇 -->
		<script>
		  (function(){const w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.")}const ch=function(...args){ch.c(args)};ch.q=[];ch.c=function(args){ch.q.push(args)};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return}w.ChannelIOInitialized=true;const s=document.createElement("script");s.type="text/javascript";s.async=true;s.src='https://cdn.channel.io/plugin/ch-plugin-web.js';const x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x)}}if(document.readyState==="complete"){l()}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l)}})();
		
		  ChannelIO('boot', {
		    "pluginKey": "a933d84c-1791-4ccf-93e3-4edae69ef8c1"
		  });
		</script>


</head>
<body class="loading" data-layout-mode="horizontal" data-layout='{"mode": "light", "width": "fluid", "menuPosition": "fixed", "topbar": {"color": "light"}}' >
        <!-- Begin page -->
        <div id="wrapper">
       

            <!-- Topbar Start -->
            <div class="navbar-custom">
                <div class="container-fluid">
                
                	<!-- left-TopBar -->
                    <ul class="list-unstyled topnav-menu float-end mb-0">
    
                        <li class="dropdown d-none d-lg-inline-block">
                            <a href="/login" class="nav-link dropdown-toggle arrow-none waves-effect waves-light" style="font-size: 1.25em">
                            	<i class="fe-log-in me-1"></i>로그인
                            </a>
                        </li>
                        <li class="dropdown d-none d-lg-inline-block">
                            <a href="/member/register"  class="nav-link dropdown-toggle arrow-none waves-effect waves-light"  style="font-size: 1.25em">
                            	<i class="fe-edit me-1"></i>회원가입
                            </a>
                        </li>
                    </ul>
    
                    <!-- LOGO -->
                    <div class="logo-box">
                        <a href="/boatinmain" class="logo logo-dark text-center">
                            <span class="logo-sm">
                                <img src="assets/images/logo-sm.png" alt="" height="30">
                                <!-- <span class="logo-lg-text-light">Codefox</span> -->
                            </span>
                            <span class="logo-lg">
                                <img src="assets/images/logo-dark.png" alt="" height="20">
                                <!-- <span class="logo-lg-text-light">U</span> -->
                            </span>
                        </a>
    
                        <a href="/boatinmain" class="logo logo-light text-center">
                            <span class="logo-sm">
                                <img src="assets/images/logo-sm.png" alt="" height="30">
                            </span>
                            <span class="logo-lg">
                                <img src="assets/images/logo-light.png" alt="" height="20">
                            </span>
                        </a>
                    </div>
    
                    <ul class="list-unstyled topnav-menu topnav-menu-left m-0">

						 <li class="nav-item" >
                                    <a class="nav-link" href="#introduce" style="font-size: 1.25em">
                                        <i class="fe-briefcase"></i> 회사소개
                                    </a>
                         </li>
                         
                         <li class="nav-item" >
                                    <a class="nav-link" href="#strength" style="font-size: 1.25em">
                                        <i class="fe-grid"></i> 기능소개
                                    </a>
                          </li>
                          
                         <li class="nav-item" >
                                    <a class="nav-link" href="#" style="font-size: 1.25em">
                                        <i class="fe-clipboard"></i> 구인공고
                                    </a>
                          </li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-layout" role="button"
                                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 1.25em">
                                        <i class="fe-heart"></i> 고객센터 <div class="arrow-down"></div>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="topnav-layout" style="font-size: 1.25em">
                                        <a href="#" class="dropdown-item" >공지사항</a>
                                        <a href="#" class="dropdown-item">자주 묻는 질문</a>
                                        <a href="#" class="dropdown-item">문의하기</a>
                                    </div>
                                </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!-- end Topbar -->
            

            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->
			
                <!-- 회사소개 -->   
				<div style="width: 100%; height:970px; position: relative!important;" id="introduce">
					<img alt="" src="${pageContext.request.contextPath }/resources/commons/main/images/001.png" width="100%" height="100%">
					<div style="position: absolute!important; top: 75%; left: 71.8%;">
					 	<a href="#strength" style="font-size: 40px; text-decoration: none!important;
					 	font-family: 'Nanum Myeongjo', serif!important; font-weight: bold!important;">
					 		LEARN MORE<i class="fe-chevrons-down"></i>
					 	</a>
		            </div>
				</div>			
				
				<div id="strength" style="width:100%; height: 850px;">
					<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="height: 100%;">
	                    <ol class="carousel-indicators">
	                        <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true"></li>
	                        <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" class=""></li>
	                        <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" class=""></li>
	                    </ol>
	                    <div class="carousel-inner" role="listbox" style="height: 100%;">
	                        <div class="carousel-item active" style="height: 100%;">
	                            <img class="d-block img-fluid" src="${pageContext.request.contextPath }/resources/commons/main/images/002.png" width="100%;" height="100%;">
	                        </div>
	                        <div class="carousel-item" style="height: 100%;">
	                            <img class="d-block img-fluid" src="${pageContext.request.contextPath }/resources/commons/main/images/003.png" width="100%;" height="100%;">
	                        </div>
	                        <div class="carousel-item" style="height: 100%;">
	                            <img class="d-block img-fluid" src="${pageContext.request.contextPath }/resources/commons/main/images/004.png" width="100%;" height="100%;">
	                        </div>
	                    </div><br><br><br>
		                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
		                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		                        <span class="visually-hidden">Previous</span>
		                    </a>
		                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
		                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
		                        <span class="visually-hidden">Next</span>
		                    </a>
	                </div>
                </div>
				
				
<!--                 Footer Start -->
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div style="text-align: center;">
                                <script>document.write(new Date().getFullYear())</script> &copy;Designed by <a href="/boatInMain">wayVe</a> 
                            </div>
                        </div>
                    </div>
                </footer>

                <!-- end Footer -->
            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->
       
        <!-- Vendor js -->
        <script src="${pageContext.request.contextPath }/resources/dist/assets/js/vendor.min.js"></script>

        <!-- Plugins js-->
        <script src="${pageContext.request.contextPath }/resources/dist/assets/libs/apexcharts/apexcharts.min.js"></script>

        <!-- Dashboard 2 init -->
        <script src="${pageContext.request.contextPath }/resources/dist/assets/js/pages/dashboard-1.init.js"></script>

        <!-- App js -->
        <script src="${pageContext.request.contextPath }/resources/dist/assets/js/app.min.js"></script>
</body>
</html>