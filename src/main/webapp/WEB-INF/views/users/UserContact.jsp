<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:url value="${pageContext.request.contextPath}" var="base" />

<!-- SPRING FORM -->
<%@ taglib prefix="springform"
	uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Contact</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" type="text/css"
	href="${base}/css/users/UserContact.css">
<script type="text/javascript" src="${base}/js/users/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${base}/js/users/script-contact.js"></script>
<script type="text/javascript" src="${base}/js/users/shop.js"></script>
</head>
<body>
	<!-- wrapper -->
	<div class="wrapper">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/users/common/header.jsp"></jsp:include>
		<!-- /header -->
		<!-- main -->
		<div class="main">
			<div class="contact" style="background:#dce1ed;">
				<div class="title">
					<span>Liên Hệ</span>
				</div>
				<c:if test="${ not empty message }">
					<div id="alert" role="alert"
						style="width: 400px; line-height: 40px; background: #cbe5fe; margin: auto; color: #3e618b; border-radius: 5px; text-align: center;">
						${message }</div>
				</c:if>

				<springform:form action="${base}/contact" method="post"
					modelAttribute="contact">
					<br>
					<div class="content">
						<label for="fname">Họ và Tên đệm:</label><br>
						<springform:input path="firstName" id="fname" />
						<br> <label for="lname">Tên:</label><br>
						<springform:input path="lastName" id="lname" />
						<br> <label for="email">Email:</label><br>
						<springform:input path="email" id="email" />
						<br> <label for="subject">Chủ đề:</label><br>
						<springform:textarea path="subject" id="subject" />
						<br> <input type="button"
							style="background: #ff9007; width: 100px; border-radius: 5px; border: 0px; margin-left: 360px;"
							name="" value="Submit" onclick="Shop.saveContact()">
					</div>
				</springform:form>
			</div>
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
