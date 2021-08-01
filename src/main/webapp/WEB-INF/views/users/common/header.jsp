<%@page import="com.devpro.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- spring taglibs -->
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- SPRING FORM -->
<%@ taglib prefix="springform"
	uri="http://www.springframework.org/tags/form"%>

<c:url value="${pageContext.request.contextPath}" var="base" />

<div class="header--sidebar"></div>
<header class="header">
      <div class="header__top">
        <div class="container-fluid">
          <div class="row">
                <div class="col-lg-6 col-md-8 col-sm-6 col-xs-12 ">
                  <p>460 West 34th Street, 15th floor, New York  -  Hotline: 804-377-3580 - 804-399-3580</p>
                </div>
                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12 ">
                  <div class="header__actions">
                  	<sec:authorize access="isAuthenticated()">
	                  	<div class="btn-group ps-dropdown">
	                  	<%
							String username = "";
						String id = " ";
						Object principal = org.springframework.security.core.context.SecurityContextHolder.getContext().getAuthentication()
								.getPrincipal();
						if (principal instanceof org.springframework.security.core.userdetails.UserDetails) {
							username = ((User) principal).getName();
							id = String.valueOf(((User)principal).getId());
						}
						%> 
	                  	<a href="${base}/history/<%=id%>"><%=username%></a>
	                  	</div>
                  	</sec:authorize>
                  	<sec:authorize access="isAuthenticated()">
                  		<div class="btn-group ps-dropdown">
							<a href="${base}/logout">Logout</a>
						</div>
					</sec:authorize>
					<sec:authorize access="!isAuthenticated()">
						<div class="btn-group ps-dropdown">
							<a href="${base}/login"> Login </a>
						</div>
						<div class="btn-group ps-dropdown">
							<a href="${base}/signup">Sign Up</a>
						</div>
					</sec:authorize>
                    <div class="btn-group ps-dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">USD<i class="fa fa-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="#"><img src="${base}/resources/user/images/flag/usa.svg" alt=""> USD</a></li>
                        <li><a href="#"><img src="${base}/resources/user/images/flag/singapore.svg" alt=""> SGD</a></li>
                        <li><a href="#"><img src="${base}/resources/user/images/flag/japan.svg" alt=""> JPN</a></li>
                      </ul>
                    </div>
                    <div class="btn-group ps-dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Language<i class="fa fa-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="#">English</a></li>
                        <li><a href="#">Japanese</a></li>
                        <li><a href="#">Chinese</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
          </div>
        </div>
      </div>
      <nav class="navigation">
        <div class="container-fluid">
          <div class="navigation__column left">
            <div class="header__logo"><a class="ps-logo" href="${base}/"><img src="${base}/resources/user/images/logo_fastsneaker.jpg" alt=""></a></div>
          </div>
          <div class="navigation__column center">
                <ul class="main-menu menu">
                  <li class="menu-item menu-item-has-children dropdown"><a href="${base}/">Home</a>
                  </li>
                  <li class="menu-item menu-item-has-children dropdown"><a href="${base}/product">Product</a>
                        <ul class="sub-menu">
                        	<c:forEach var="category" items="${categories }">
                          		<li class="menu-item">
                          		<a href="${base }/product/category/${category.seo}">${category.name }
                          		</a></li>
                          	</c:forEach>
                        </ul>
                  </li>
                  <li class="menu-item menu-item-has-children dropdown"><a href="${base}/contact">Contact</a>
                  </li>
                </ul>
          </div>
          <div class="navigation__column right">
            <form class="ps-search--header" action="${base}/" method="get">
              <input class="form-control" name="keyword" th:value="${keyword }" type="text" placeholder="Search Product…">
              <button type="submit" value="Search"><i class="ps-icon-search"></i></button>
            </form>
            <div class="ps-cart"><a class="ps-cart__toggle" href="${base}/cart/check-out"><span id="btnCheckout"><i>${SL_SP_GIO_HANG }</i></span><i class="ps-icon-shopping-cart"></i></a>
              <div class="ps-cart__listing">
                <div class="ps-cart__content">
                  <div class="ps-cart-item"><a class="ps-cart-item__close" href="#"></a>
                    <div class="ps-cart-item__thumbnail"><a href="product-detail.html"></a><img src="${base}/resources/user/images/cart-preview/3.jpg" alt=""></div>
                    <div class="ps-cart-item__content"><a class="ps-cart-item__title" href="">The Rolling Pin</a>
                      <p><span>Quantity:<i>12</i></span><span>Total:<i>£176</i></span></p>
                    </div>
                  </div>
                </div>
                <div class="ps-cart__total">
                  <p>Number of items:<span>36</span></p>
                  <p>Item Total:<span>£528.00</span></p>
                </div>
                <div class="ps-cart__footer"><a class="ps-btn" href="${base}/cart/check-out">Check out<i class="ps-icon-arrow-left"></i></a></div>
              </div>
            </div>
            <div class="menu-toggle"><span></span></div>
          </div>
        </div>
      </nav>
    </header>
    <div class="header-services">
      <div class="ps-services owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="7000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="false" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1" data-owl-duration="1000" data-owl-mousedrag="on">
        <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order with Sky Store</p>
        <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order with Sky Store</p>
        <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order with Sky Store</p>
      </div>
    </div>