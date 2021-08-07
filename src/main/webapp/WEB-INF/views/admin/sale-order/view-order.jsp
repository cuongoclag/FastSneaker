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
                	<div  id="print_div">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Order Information <span style="color: red;">${saleOrder.code }</span></h1>
                    <br/>
                    <br/>
                    <div>
                    <h3>User Information</h3>
                    <table class="table">
					  <thead>
					    <tr>
					      <th scope="col">Name</th>
					      <th scope="col">Phone</th>
					      <th scope="col">Email</th>
					      <th scope="col">Address</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th>${saleOrder.customerName }</th>
					      <td>${saleOrder.customerPhone }</td>
					      <td>${saleOrder.customerEmail }</td>
					      <td>${saleOrder.customerAddress }</td>
					    </tr>
					  </tbody>
					</table>
                    </div>
                    <h3>List Product</h3>
                    <table class="table">
					  <thead>
					    <tr>
					      <th scope="col">ID</th>
					      <th scope="col">Product Name</th>
					      <th scope="col">Price</th>
					      <th scope="col">Quantity</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach items="${saleOrderProduct }" var="saleOrderProducts">
					    <tr>
					      <th>${saleOrderProducts.id}</th>
					      <td>${saleOrderProducts.product.title }</td>
					      <td>${saleOrderProducts.product.price } $</td>
					      <td>${saleOrderProducts.quantity}</td>
					    </tr>
					   </c:forEach>
					  </tbody>
					</table>
					<table class="table">
					  <thead>
					    <tr>
					      <th style="color: red">TOTAL</th>
					      <th>${saleOrder.total } $</th>
					    </tr>
					  </thead>
					</table>
					</div>	
					<c:choose>
						<c:when test="${saleOrder.status =='true'}">
							<button type="button" name=""
								onclick="confirmDelete('${saleOrder.id }')"
								class="btn btn-primary btn-sm"
								">Complete </button>
						</c:when>
						<c:otherwise>
							<button type="button" name="" class="btn btn-danger btn-sm"
								">Completed</button>
						</c:otherwise>
					</c:choose>
					<a href="${base }/admin/list-order" class="btn btn-danger btn-sm">Back</a>
					<button type="button" name="" class="btn btn-primary btn-sm" onclick="printdiv('print_div')">Print</button>
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
	<script type="text/javascript">
		function printdiv(printpage) {
			var headstr = "<html><head><title></title></head><body>";
			var footstr = "</body>";
			var newstr = document.all.item(printpage).innerHTML;
			var oldstr = document.body.innerHTML;
			document.body.innerHTML = headstr + newstr + footstr;
			window.print();
			document.body.innerHTML = oldstr;
			return false;
		}
	</script>
</body>

</html>