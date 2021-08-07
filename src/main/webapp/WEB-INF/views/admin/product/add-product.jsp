  
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
    <link href="${base}/resources/admin/summernote/summernote.min.css" rel="stylesheet">
	<script src="${base}/resources/admin/summernote/summernote.min.js"></script>
	

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
                    <h1 class="h3 mb-2 text-gray-800">Add Product</h1>
                    <form:form method="post" action="/admin/save-product"
							modelAttribute="product" enctype="multipart/form-data">
						<form:hidden path="id" />
					  <div class="form-group">
					    <label for="inputAddress">Name Product</label>
					    <form:input type="text" class="form-control" path="title"  aria-describedby="" />
					  </div>
					  <div class="form-group">
					    <label for="inputAddress">Price</label>
					    <form:input type="text" class="form-control" path="price"  aria-describedby="" />
					  </div>
					  <div class="form-group">
					    <label for="inputAddress">Description</label>
					    <form:textarea class="form-control" id="txtshortDescription1" path="shortDes" />
					  </div>
					  <div class="form-group">
					    <label for="inputAddress">Detail Description </label>
					    <form:textarea class="form-control" id="txtDetailDescription" path="shortDetails" />
					  </div>
					  <div class="form-group">
					    <label for="inputAddress">Category</label>
					    <form:select path="category.id">
							<form:options items="${categories}" itemValue="id"
								itemLabel="name"/>
						</form:select>
					  </div>
					  <div class="form-group">
					    <label for="inputAddress">Photos Product</label>
					    <input class="form-control" type="file" name="images" multiple="multiple" />
					  </div>
					  <div class="form-group form-check">
					    <form:checkbox path="status" class="form-check-input" id="exampleCheck1" />
					    <label class="form-check-label" for="exampleCheck1">Status</label>
					  </div>
					  <button type="submit" class="btn btn-primary">Submit</button>
					</form:form>
					<a href="${base }/admin/list-product" class="btn btn-danger btn-sm">Back</a>
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
    <script>
		$(document).ready(function() {
			$('#txtDetailDescription').summernote();
		});
	</script>

</body>

</html>