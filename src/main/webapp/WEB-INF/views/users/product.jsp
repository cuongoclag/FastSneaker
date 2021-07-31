<%@page import="com.devpro.entities.User"%>
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
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link href="apple-touch-icon.png" rel="apple-touch-icon">
    <link href="favicon.png" rel="icon">
    <meta name="author" content="">
    <meta name="keywords" content="Default Description">
    <meta name="description" content="Default keyword">
    <title>Sky - Homepage</title>
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
      <div class="ps-products-wrap pt-80 pb-80">
        <div class="ps-products" data-mh="product-listing">
          <div class="ps-product-action">
            <div class="ps-product__filter">
            <button onclick="Shop.highTolow('${base}/product/');" >Price (High to Low)</button>
			<button onclick="Shop.lowToHight('${base}/product/');" >Price (Low to High)</button>
            </div>
            <div class="ps-pagination">
              <ul class="pagination">
                <li><a href="#" id="previous" onclick="Shop.homePrevious('${base}/product/')"><i class="fa fa-angle-left"></i></a></li>
                <c:forEach var="numberOPs" items="${numberOP }">
					<li><a href="#"
						onclick="Shop.homePage('${base}/product/', '${numberOPs }')">${numberOPs }</a></li>
				</c:forEach>           
                <li><a href="#" id="next" onclick="Shop.homeNext('${base}/product/','${numberOfPage }')"><i class="fa fa-angle-right"></i></a></li>
              </ul>
            </div>
          </div>
          <div class="ps-product__columns">
          
          <c:forEach var="product" items="${products }">
            <div class="ps-product__column">
              <div class="ps-shoe">
                  <div class="ps-shoe__thumbnail">
                      <a class="ps-shoe__favorite" href="#"><i class="ps-icon-heart"></i></a>
	                      <c:choose>
	                      <c:when test="${empty product.productImages }">
							<img src="${base}/resources/user/images/shoe/2.jpg" alt="">
						  </c:when>
	                      <c:otherwise>
	                      	<img src="${base}/file/upload/${product.productImages[0].path}" alt="">
	                      </c:otherwise>
	                      </c:choose>
                      <a class="ps-shoe__overlay" href="${base}/detail-product/${product.seo }"></a>
                      </div>
                      <div class="ps-shoe__content">
                        <div class="ps-shoe__variants">
                          <div class="ps-shoe__variant normal">
	                          <img src="${base}/file/upload/${product.productImages[0].path}" alt="">
	                          <img src="${base}/file/upload/${product.productImages[1].path}" alt="">
	                          <img src="${base}/file/upload/${product.productImages[2].path}" alt="">
	                          <img src="${base}/file/upload/${product.productImages[3].path}" alt="">
                          	  <img src="${base}/file/upload/${product.productImages[4].path}" alt="">
                          </div>
                          <select class="ps-rating ps-shoe__rating">
                            <option value="1">1</option>
                            <option value="1">2</option>
                            <option value="1">3</option>
                            <option value="1">4</option>
                            <option value="2">5</option>
                          </select>
                        </div>
                        <div class="ps-shoe__detail">
                        <a class="ps-shoe__name" href="${base}/detail-product/${product.seo }" style="text-transform: uppercase">${product.title }</a>
                          <span class="ps-shoe__price">${product.priceVN }</span>
                        </div>
                      </div>
                </div>
            </div>
            </c:forEach>
            
          </div>
        
        </div>
        <div class="ps-sidebar" data-mh="product-listing">
          <aside class="ps-widget--sidebar ps-widget--category">
            <div class="ps-widget__header">
              <h3>Category</h3>
            </div>
            <div class="ps-widget__content">
              <ul class="ps-list--checked">
                <c:forEach var="category" items="${categories }">
               		<li>
               		<a href="${base }/product/category/${category.seo}">${category.name }</a>
               		</li>
               	</c:forEach>
              </ul>
            </div>
          </aside>
          <aside class="ps-widget--sidebar ps-widget--filter">
            <div class="ps-widget__header">
              <h3>Price</h3>
            </div>
            <div class="ps-widget__content">
              	<a href="${base }/product/?price=1" onclick="">Under 5.000.000đ</a> <br><br>
				<a href="${base }/product/?price=2" onclick="">5.000.000đ - 10.000.000đ</a><br><br>
				<a href="${base }/product/?price=3" onclick="">10.000.000đ - 15.000.000đ</a><br><br>
				<a href="${base }/product/?price=4" onclick="">15.000.000đ - 20.000.000đ</a><br><br>
				<a href="${base }/product/?price=5" onclick="">Bigger 20.000.000đ</a>
            </div>
          </aside>
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