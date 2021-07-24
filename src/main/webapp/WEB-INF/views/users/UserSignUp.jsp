<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:url value="${pageContext.request.contextPath}" var="base" />

<!-- SPRING FORM -->
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<title>Sign Up</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" type="text/css"
	href="${base}/css/users/UserSignUp.css">
<link href="${base}/css/users/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${base}/css/users/bootstrap/js/jquery-3.5.1.min.js"></script>
<script src="${base}/css/users/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- wrapper -->
	<div class="wrapper">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/users/common/header.jsp"></jsp:include>
		<!-- /header -->
		<!-- main -->
		<div class="main">
			<!-- top -->
			<div class="top">
				<div class="left">
					<span>Tạo tài khoản</span>
				</div>
				<div class="right">
					<span>Bạn là thành viên? <a href="${base}/login">Đăng
							nhập</a> tại đây
					</span>
				</div>
			</div>
			<!-- /top -->
			<!-- mid -->
			<p style="color : red">${error }</p>

			<div class="mid" style="background: #d6dff3; border-radius: 5px;">
				<form method="post" action="/save-guestUser"
							modelAttribute="user" enctype="multipart/form-data">
					<div class="top" style="margin-top: 20px;">
						<div class="form-row">
								<div class="form-group col-md-6">
									<label>Tên đăng nhập</label>
									<input type="text" class="form-control" path="username" name="username" required="required"
										placeholder="Nhập tên đăng nhập của bạn" />
								</div>
								<div class="form-group col-md-6">
									<label>Họ và tên đệm</label>
									<input type="text" class="form-control" path="firstName" name="firstName" required="required"
										placeholder="Nhập họ và tên đệm của bạn" />
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Mật khẩu</label>
									<input type="password" class="form-control" name="password" required="required"
										path="password" placeholder="Nhập mật khẩu của bạn" />
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Tên</label>
									<input type="text" class="form-control" path="name" name="name" required="required"
										placeholder="Nhập tên của bạn" />
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Email</label>
									<input type="email" class="form-control" path="email" value="${email}" name="email" required="required"
										placeholder="nguyenvana@gmail.com" />
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Số điện thoại</label>
									<input type="number" class="form-control" path="phone" name="phone" required="required"
										placeholder="Nhập số điện thoại của bạn" /> 
								</div>
							</div>
							<div class="form-group" style="width: 772px; margin-left: 15px;">
								<label for="inputAddress">Địa chỉ</label>
								<input type="text" class="form-control" path="address" name="address" required="required"
									placeholder="1234 Main St" />
							</div>
							<div class="form-check" style="margin-left: 20px;">
							<label>Giới Tính</label> <br>
								<input type="radio" path="gender" class="form-check-input" name="gender" required="required"
									value="true" />
								<label class="form-check-label"> Nam </label>
								<input type="radio" path="gender" class="form-check-input" name="gender" required="required"
									value="false" />
								<label class="form-check-label"> Nữ </label>
							</div>
							<div class="form-group" style="width: 772px; margin-left: 15px;">
								<input type="text" class="form-control" path="" name="code"
									placeholder="Code" />
								<button type="submit" formaction="/send-code">Send Code</button>
							</div>
					</div>
					<div class="mid" style="margin-top: 10px;"></div>
					<div class="bot">

						<button type="submit" value="Lưu" class="btn btn-primary btn-sm"
								style="width: 200px; line-height: 28px; margin-left: -20px; margin-bottom: 50px;">Lưu</button><br>

						<p>
							Khi bạn nhấn Đăng ký, bạn đã đồng ý thực hiện mọi giao dịch mua
							bán theo <a href="#">điều kiện sử dụng và chính sách</a> của
							chúng tôi.
						</p>
					</div>
				</form>
			</div>
			<!-- /mid -->

		</div>
		<!-- /main -->
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/users/common/footer.jsp"></jsp:include>
		<!-- /footer -->
	</div>
	<!-- /wrapper -->
	
	<!--Start of Tawk.to Script-->
	<script type="text/javascript">
	var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
	(function(){
	var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
	s1.async=true;
	s1.src='https://embed.tawk.to/60f2ab4dd6e7610a49abb66d/1fapuqadn';
	s1.charset='UTF-8';
	s1.setAttribute('crossorigin','*');
	s0.parentNode.insertBefore(s1,s0);
	})();
	</script>
	<!--End of Tawk.to Script-->
	
	
</body>
</html>
