<!-- sử dụng tiếng việt -->
<%@page import="com.devpro.entities.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:url value="${pageContext.request.contextPath}" var="base" />

<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- SPRING FORM -->
<%@ taglib prefix="springform"
	uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link href="apple-touch-icon.png" rel="apple-touch-icon">
    <link href="${base}/resources/user/images/logo_fastsneaker.jpg" rel="icon">
    <meta name="author" content="">
    <meta name="keywords" content="Default Description">
    <meta name="description" content="Default keyword">
    <title>FastSneaker</title>
    <!-- Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Archivo+Narrow:300,400,700%7CMontserrat:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="${base}/resources/user/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/ps-icon/style.css">
    <!-- CSS Library-->
    <link rel="stylesheet" href="${base}/resources/user/plugins/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/slick/slick/slick.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/bootstrap-select/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/Magnific-Popup/dist/magnific-popup.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/revolution/css/settings.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/revolution/css/layers.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/revolution/css/navigation.css">
    <!-- Custom-->
    <link rel="stylesheet" href="${base}/resources/user/css/style.css">
    <script type="text/javascript" src="${base}/resources/user/js/script-contact.js"></script>
	<script type="text/javascript" src="${base}/resources/user/js/shop.js"></script>
  </head>
  <body class="ps-loading">
    
    <!-- header -->
		<jsp:include page="/WEB-INF/views/users/common/header.jsp"></jsp:include>
	<!-- /header -->
    
    <main class="ps-main">
      <div class="ps-contact ps-section pb-80">
        <div class="ps-container">
        <h1 style="margin: 2% 0">Edit My Profile</h1>
          <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                  <div class="ps-section__header mb-50">
					<img src="${base}/file/upload_avt/${user.avatar}" alt="" name="images" width="100px" height="100px"/>
                    <form:form method="post" action="/user/save-user"
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
					    <form:input type="text" class="form-control" path="address" aria-describedby="" />
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
					  <div class="form-group form-check">
					    <form:checkbox path="status" class="form-check-input" id="" />
					    <label class="form-check-label" for="exampleCheck1">Status</label>
					  </div>
					  <button type="submit" class="ps-btn">Submit</button>
					</form:form>
                  </div>
                </div>
          </div>
        </div>
      </div>
      <!-- footer -->
		<jsp:include page="/WEB-INF/views/users/common/footer.jsp"></jsp:include>
	  <!-- /footer -->
      
    </main>
    <!-- JS Library-->
    <script type="text/javascript" src="${base}/resources/user/plugins/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/gmap3.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/imagesloaded.pkgd.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/isotope.pkgd.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/jquery.matchHeight-min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/slick/slick/slick.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/elevatezoom/jquery.elevatezoom.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/Magnific-Popup/dist/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAx39JFH5nhxze1ZydH-Kl8xXM3OK4fvcg&amp;region=GB"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.video.min.js"></script>
	<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <!-- Custom scripts-->
    <script type="text/javascript" src="${base}/resources/user/js/main.js"></script>
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
	    <script type="text/javascript">
		function clearFilter() {
			window.location = '/';
		}
	</script>
  </body>
</html>