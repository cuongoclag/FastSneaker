<!-- sử dụng tiếng việt -->
<%@page import="com.devpro.entities.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- spring taglibs -->
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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
    <meta name="author" content="Nghia Minh Luong">
    <meta name="keywords" content="Default Description">
    <meta name="description" content="Default keyword">
    <title>Sky - Checkout</title>
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
    
  </head>
  
  	<!-- header -->
		<jsp:include page="/WEB-INF/views/users/common/header.jsp"></jsp:include>
	<!-- /header -->

  <body class="ps-loading">
<main class="ps-main">
      <div class="ps-content pt-80 pb-80">
        <div class="ps-container text-center">
          <h1>Cảm ơn bạn đã mua hàng</h1>
		  <p>Check mail <a href="https://mail.google.com/mail/u/0/#inbox" target="_blank">tại đây</a></p>
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
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAx39JFH5nhxze1ZydH-Kl8xXM3OK4fvcg&amp;region=GB"></script><script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.video.min.js"></script>
<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <!-- Custom scripts-->
    <script src="${base}/resources/user/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/js/main.js"></script>
  </body>
</html>
