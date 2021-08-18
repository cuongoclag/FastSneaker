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
          <form class="sign-in-form" method="post" action="/reset_password" onsubmit="return validateForm()">
          <input type="hidden" name="token" value="${token }"/>
            <h2 class="title">Forgot Password</h2>
            <p>We will be sending a reset password link to your email</p>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Enter your new password" name="password" required="required" autofocus="autofocus"/>
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Enter your new password" name="confirmPassword" required="required" autofocus="autofocus" oninput="checkPasswordMatch(this);"/>
            </div>
            <button class="btn solid" type="submit">Change Password</button>          
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
	<script type="text/javascript">
		function checkPasswordMatch(fieldConfirmPassword) {
			if(fieldConfirmPassword.value != $("#password").val()){
				fieldConfirmPassword.setCustomValidity("Passwords do not match!");
			} else {
				fieldConfirmPassword.setCustomValidity("");
			}
		}
	</script>
  </body>
</html>