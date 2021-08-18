<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:url value="${pageContext.request.contextPath}" var="base" />

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${base}/resources/user/css/login-signup.css" />
    <title>Sign in & Sign up Form</title>
  </head>
  <body>
  <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <div class="container">
      <div class="forms-container">
        <div class="signin-signup">
          <form class="sign-in-form" method="post" action="/login" onsubmit="return validateForm()">
            <h2 class="title">Sign in</h2>
            <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<c:if test="${not empty param.login_error}">
				<div class="alert alert-danger" role="alert">Login attempt
					was not successful, try again.</div>
			</c:if>
			<c:if test="${param.accessDenied != null}">
				<div class="alert alert-danger">
					<p>You do not have permission to access this page</p>
				</div>
			</c:if>
			<div>
				<h4><a href="/oauth2/authorization/google">Login with Google</a></h4>
			</div>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" placeholder="Username" type="text" name="username"/>
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Password" name="password"/>
            </div>
            <div class="g-recaptcha" data-sitekey="6LfNa6MbAAAAAEMrdL6lGuOXmFy3N7KrcfWi355b"></div>
            <button class="btn solid" type="submit">LOGIN</button>    
            <a href="/forgot_password">Forgot your password</a>      
          </form>
          
          <form class="sign-up-form" method="post" action="/save-guestUser" modelAttribute="user" enctype="multipart/form-data">
            <h2 class="title">Sign up</h2>
            <p style="color : red">${error }</p>
            <p style="color : blue">${success }</p>
            
            <div class="form-bigger">
            <div class="form-smaller">
	            <div class="input-field">
	              <i class="fas fa-user"></i>
	              <input type="text" placeholder="Username" path="username" name="username" required="required"/>
	            </div>
	            <div class="input-field">
	              <i class="fas fa-user"></i>
	              <input type="text" placeholder="Surname and middle name" path="firstName" name="firstName" required="required"/>
	            </div>
	            <div class="input-field">
	              <i class="fas fa-user"></i>
	              <input type="text" placeholder="Name" path="name" name="name" required="required"/>
	            </div>
	            <div class="input-field">
	              <i class="fas fa-lock"></i>
	              <input type="password" placeholder="Password" path="password" name="password" required="required"/>
	            </div>
            </div>
            <div class="form-smaller">
	            <div class="input-field">
	              <i class="fas fa-phone"></i>
	              <input type="number" placeholder="Phone" path="phone" name="phone" required="required"/>
	            </div>
	            <div class="input-field">
	              <i class="fas fa-envelope"></i>
	              <input type="email" placeholder="Email" path="email" value="${email}" name="email" required="required"/>
	            </div>
	            <div class="input-field">
	              <i class="fas fa-map-marker-alt"></i>
	              <input type="text" placeholder="Address" path="address" name="address" required="required"/>
	            </div>

	            <label style="color: #aaa; font-weight: bold">Giới Tính</label> <br>
					<input type="radio" path="gender" name="gender" required="required"
						value="true" />
					<label style="color: #aaa; font-weight: 500"> Nam </label>
					<input type="radio" path="gender" name="gender" required="required"
						value="false" />
				<label  style="color: #aaa; font-weight: 500"> Nữ </label>
			</div>
            </div>
            <div class="input-field">
	              <i class="fab fa-codepen"></i>
	              <input type="text" path="code" name="code" placeholder="Code"/>
	        </div>
            <button type="submit" formaction="/send-code"
            style="border-radius: 10px; width: 20%;
		    height: 30px;
		    background-color: #5995FD;
		    color: #fff;
		    border: none;">Send Code</button>
            <button type="submit" value="Sign Up" class="btn solid" >Sign Up</button><br>
          </form>
          
          
        </div>
      </div>


      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>New here ?</h3>
            <p>
              Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis,
              ex ratione. Aliquid!
            </p>
            <button class="btn transparent" id="sign-up-btn">
              Sign up
            </button>
          </div>
          <img src="${base}/resources/user/images/log.svg" class="image" alt="" />
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>One of us ?</h3>
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
              laboriosam ad deleniti.
            </p>
            <button class="btn transparent" id="sign-in-btn">
              Sign in
            </button>
          </div>
          <img src="${base}/resources/user/images/register.svg" class="image" alt="" />
        </div>
      </div>
    </div>

    <script src="${base}/resources/user/js/login-signup.js"></script>
    <script type="text/javascript">
    
	function validateForm(){
		if(grecaptcha.getResponse()){
			return true;
		} else {
			alert("Please prove that you/re not robot!!!");
			return false;
		}
	}
</script>
  </body>
</html>