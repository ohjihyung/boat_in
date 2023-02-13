<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->
            <div class="content-page">
                <div class="content">
                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <h4 class="page-title">Dashboard</h4>
                                    <div>
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Codefox</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboard</a></li>
                                            <li class="breadcrumb-item active">Dashboard</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 

                        <div class="row">
                            <div class="col-md-6 col-xl-3">
                                <div class="widget-rounded-circle card bg-purple shadow-none">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="avatar-lg rounded-circle bg-soft-light">
                                                    <i class="fe-bar-chart-line- font-28 avatar-title text-white"></i>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="text-end">
                                                    <h2 class="text-white mt-2">$<span data-plugin="counterup">92,847</span></h2>
                                                    <p class="text-white mb-0 text-truncate">Statistics</p>
                                                </div>
                                            </div>
                                        </div> <!-- end row-->
                                    </div>
                                </div> <!-- end widget-rounded-circle-->
                            </div> <!-- end col-->

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
                                                    <h2 class="text-white mt-2"><span data-plugin="counterup">56</span>k</h2>
                                                    <p class="text-white mb-0 text-truncate">Users Today</p>
                                                </div>
                                            </div>
                                        </div> <!-- end row-->
                                    </div>
                                </div> <!-- end widget-rounded-circle-->
                            </div> <!-- end col-->

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
                                                    <h2 class="text-white mt-2"><span data-plugin="counterup">2568</span></h2>
                                                    <p class="text-white mb-0 text-truncate">Request Per Minute</p>
                                                </div>
                                            </div>
                                        </div> <!-- end row-->
                                    </div>
                                </div> <!-- end widget-rounded-circle-->
                            </div> <!-- end col-->

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
                                                    <h2 class="text-white mt-2"><span data-plugin="counterup">523</span></h2>
                                                    <p class="text-white mb-0 text-truncate">New Downloads</p>
                                                </div>
                                            </div>
                                        </div> <!-- end row-->
                                    </div>
                                </div> <!-- end widget-rounded-circle-->
                            </div> <!-- end col-->
                        </div>
                        <!-- end row-->

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="dropdown float-end">
                                            <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="mdi mdi-dots-vertical"></i>
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
    
                                        <h4 class="header-title mb-0">Statistics</h4>
    
                                        <div dir="ltr">
                                            <div id="apex-area-charts" class="mt-0"></div>
                                        </div>
                                    </div>
                                </div> <!-- end card -->
                            </div> <!-- end col-->
                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="dropdown float-end">
                                            <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="mdi mdi-dots-vertical"></i>
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
    
                                        <h4 class="header-title mb-3">Product License</h4>
                                        <div class="position-relative">
                                            <div class="row align-items-center">
                                                <div class="col-xl-5">
                                                    <h5>Standard <span class="text-muted fw-normal"> - Single Site</span> <b class="px-2">-</b> <span class="text-muted">30%</span></h5>
                                                </div>
                                                <div class="col-xl-7">
                                                    <div class="progress" style="height: 6px;">
                                                        <div class="progress-bar bg-info" role="progressbar" style="width: 30%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row align-items-center mt-2">
                                                <div class="col-xl-5">
                                                    <h5>Multisite <span class="text-muted fw-normal"> - Unlimited sites</span> <b class="px-2">-</b> <span class="text-muted">60%</span></h5>
                                                </div>
                                                <div class="col-xl-7">
                                                    <div class="progress" style="height: 6px;">
                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 60%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row align-items-center mt-2">
                                                <div class="col-xl-5">
                                                    <h5>Extended <span class="text-muted fw-normal"> - For paying users</span> <b class="px-2">-</b> <span class="text-muted">85%</span></h5>
                                                </div>
                                                <div class="col-xl-7">
                                                    <div class="progress" style="height: 6px;">
                                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 85%;" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-6 col-lg-12 col-md-6">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row align-items-center">
                                                    <div class="col-5">
                                                        <div class="apex-charts" id="sparkline-chart-1"></div>
                                                    </div>
                                                    <div class="col-6 offset-1">
                                                        <div class="text-end">
                                                            <p class="font-14 mb-1">Total Products Sales</p>
                                                            <h2 class="fw-bold mb-1">64.5K</h2>
                                                            <h5 class="mb-0 text-success"><i class="mdi mdi-trending-up font-18 me-1"></i>20.7%</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
        
                                    <div class="col-xl-6 col-lg-12 col-md-6">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row align-items-center">
                                                    <div class="col-5">
                                                        <div class="apex-charts" id="sparkline-chart-2"></div>
                                                    </div>
                                                    <div class="col-6 offset-1">
                                                        <div class="text-end">
                                                            <p class="font-14 mb-1">Active Users</p>
                                                            <h2 class="fw-bold mb-0">50.24K</h2>
                                                            <h5 class="mb-0 text-success"><i class="mdi mdi-trending-up font-18 me-1"></i>20.7%</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <div class="row">
                            <div class="col-lg-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div class="w-100">
                                                <h5 class="text-muted mt-0">Active Users</h5>
                                                <h2 class="mb-0">24,600</h2>
                                            </div>
                                            <i class="mdi mdi-account text-light display-3 float-end"></i>
                                        </div>
                                        <p class="text-muted mt-3 mb-3">Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut ratione voluptate msequi nesciunt.</p>
                                        <div>
                                            <a href="#" class="text-primary float-end"><i class="mdi mdi-arrow-right font-20"></i></a>
                                            <span class="bg-soft-primary fw-medium text-primary rounded px-2 font-12 py-1">Excellent</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div class="w-100">
                                                <h5 class="text-muted mt-0">Business Profile</h5>
                                                <h2 class="mb-0">$40,340</h2>
                                            </div>
                                            <i class="mdi mdi-office-building text-light display-3 float-end"></i>
                                        </div>
                                        <p class="text-muted mt-3 mb-3">Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur.</p>
                                        <div>
                                            <a href="#" class="text-primary float-end"><i class="mdi mdi-arrow-right font-20"></i></a>
                                            <span class="bg-soft-warning fw-medium text-warning rounded px-2 font-12 py-1">Excellent</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div class="w-100">
                                                <h5 class="text-muted mt-0">Market Price</h5>
                                                <h2 class="mb-0">$1,180</h2>
                                            </div>
                                            <i class="mdi mdi-database-marker text-light display-3 float-end"></i>
                                        </div>
                                        <p class="text-muted mt-3 mb-3">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.</p>
                                        <div>
                                            <a href="#" class="text-primary float-end"><i class="mdi mdi-arrow-right font-20"></i></a>
                                            <span class="bg-soft-pink fw-medium text-pink rounded px-2 font-12 py-1">Excellent</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="dropdown float-end">
                                            <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="mdi mdi-dots-vertical"></i>
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
    
                                        <h4 class="header-title mb-3">Recent Product</h4>

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
                                        </div> <!-- end table responsive-->
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="dropdown float-end">
                                            <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="mdi mdi-dots-vertical"></i>
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
    
                                        <h4 class="header-title mb-3">Latest Update</h4>
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
                            <div class="col-xl-3 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="dropdown float-end">
                                            <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="mdi mdi-dots-vertical"></i>
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
    
                                        <h4 class="header-title mb-3">Total Users</h4>
                                        <div class="text-center mb-4">
                                            <div class="apex-charts" id="radialBar"></div>
                                        </div>
                                        <div class="row align-items-center justify-content-center">
                                            <div class="col-5">
                                                <h5><i class="mdi mdi-circle-double text-info me-1"></i> Last Month</h5>
                                            </div>
                                            <div class="col-6">
                                                <div class="progress" style="height: 6px;">
                                                    <div class="progress-bar bg-info" role="progressbar" style="width: 55%;" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row align-items-center justify-content-center mt-1">
                                            <div class="col-5">
                                                <h5><i class="mdi mdi-circle-double text-pink me-1"></i> Last week</h5>
                                            </div>
                                            <div class="col-6">
                                                <div class="progress" style="height: 6px;">
                                                    <div class="progress-bar bg-pink" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->
                        
                    </div> <!-- container -->

                </div> <!-- content -->



            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->
            
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="${pageContext.request.contextPath }/resources/dist/assets/js/pages/dashboard-1.init.js"></script>
