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
                    <h1 class="h3 mb-2 text-gray-800">Add User</h1>
                    <form:form method="post" action="/admin/save-user"
							modelAttribute="user" enctype="multipart/form-data">
						<form:hidden path="id" />
						<div class="row">
							<div class="form-group col-md-6">
						    <label for="inputAddress">Username</label>
						    <form:input type="text" class="form-control" path="username" aria-describedby="" />
						  	</div>
						  	<div class="form-group col-md-6">
						    <label for="inputAddress">Surname and middle name</label>
						    <form:input type="text" class="form-control" path="firstName" aria-describedby="" />
						  	</div>
						</div>		
						<div class="row">
							<div class="form-group col-md-6">
						    <label for="inputAddress">Password</label>
						    <form:input type="password" class="form-control" path="password" aria-describedby="" />
						  	</div>
						  	<div class="form-group col-md-6">
						    <label for="inputAddress">Name</label>
						    <form:input type="password" class="form-control" path="name" aria-describedby="" />
						  	</div>
						</div>  
					  
					  	<div class="row">
					  		<div class="form-group col-md-6">
						    <label for="inputAddress">Email</label>
						    <form:input type="email" class="form-control" path="email" aria-describedby="" />
						 	</div>
						  	<div class="form-group col-md-6">
						    <label for="inputAddress">Phone</label>
						    <form:input type="number" class="form-control" path="phone" aria-describedby="" />
						  	</div>
					  	</div>
					  <div class="form-group">
					    <label for="inputAddress">Address</label>
					    <form:input type="number" class="form-control" path="address" aria-describedby="" />
					  </div>
					  <div class="form-group">
					    <label for="inputAddress">Avatar</label>
					    <input type="file" class="form-control" name="images" aria-describedby="" />
					  </div>
					  <div class="form-group form-check">
					    <form:radiobutton  path="gender" class="form-check-input" value="true" />
					    <label class="form-check-label mr-5" for="">Male</label>
					    <form:radiobutton  path="gender" class="form-check-input" value="false" />
					    <label class="form-check-label" for="">Female</label>
					  </div>
					  <div class="form-group">
					    <label for="">Decentralization </label>
					    <div class="row">
					    	<div class="col-md-6">
					    	<label for="">Admin</label>
					    	<form:checkbox class="form-control" path="roles" aria-describedby="" value="1"/>
					    	</div>
							<div class="col-md-6">
							<label for="">User</label>
							<form:checkbox class="form-control" path="roles" aria-describedby="" value="2"/>
							</div>
					    </div>					    
					  </div>
					  <div class="form-group form-check">
					    <form:checkbox path="status" class="form-check-input" id="" />
					    <label class="form-check-label" for="exampleCheck1">Status</label>
					  </div>
					  <button type="submit" class="btn btn-primary">Submit</button>
					</form:form>
					<a href="${base }/admin/list-user" class="btn btn-danger btn-sm">Back</a>
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