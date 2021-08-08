
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:url value="${pageContext.request.contextPath}" var="base" />

<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="${base}/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${base}/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
    <script type="text/javascript" src="${base}/resources/admin/js/old/delete-saleOrder.js"></script>

</head>

<body id="page-top">
	<div id="wrapper">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/admin/common/Menu.jsp"></jsp:include>
		<!-- /header -->
		<div id="content-wrapper" class="d-flex flex-column">
		<div id="content">
			<!-- menu -->
			<jsp:include page="/WEB-INF/views/admin/common/Header.jsp"></jsp:include>
			<!-- /menu -->
			<!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">List Orders</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Code Order</th>
                                            <th>Username</th>
                                            <th>Phone</th>
                                            <th>Email</th>
                                            <th>Created Day</th>
                                            <th>Total</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${saleOrders }" var="saleOrder">
                                        <tr>
                                            <td>${saleOrder.code }</td>
                                            <td>${saleOrder.customerName }</td>
                                            <td>${saleOrder.customerPhone }</td>
											<td>${saleOrder.customerEmail }</td>
											<td>${saleOrder.createdDate }</td>
											<td>${saleOrder.totalVN }</td>
											<td>
												<c:choose>
													<c:when test="${saleOrder.status =='true'}">
														<span style="background: #FFFF00; border-radius: 5px; color: white;">&nbsp;Pending&nbsp;</span>
													</c:when>
													<c:otherwise>
														<span style="background: #0099FF; border-radius: 5px; color: white;">&nbsp;Completed&nbsp;</span>
													</c:otherwise>
												</c:choose>
											</td>
											<td>
											<a href="${base }/admin/view-order/${saleOrder.id}"
												class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>
											</td>
                                        </tr>
                                     </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
		</div>
		</div>
	</div>

    <!-- Bootstrap core JavaScript-->
    <script src="${base}/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${base}/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${base}/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${base}/resources/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${base}/resources/admin/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${base}/resources/admin/js/demo/chart-area-demo.js"></script>
    <script src="${base}/resources/admin/js/demo/chart-pie-demo.js"></script>

</body>

</html>