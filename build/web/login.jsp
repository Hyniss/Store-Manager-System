
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            Object mess = request.getAttribute("mess");
            if (mess == null) {
                mess = "";
            }
            Object checkLogin = request.getAttribute("checkLogin");
            Object checkRegis = request.getAttribute("checkRegis");
            if (checkLogin == null) {
                checkLogin = "checked";
            }
        %>
        <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" <%= checkLogin %> ><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up" <%= checkRegis %> ><label for="tab-2" class="tab">Sign Up</label>
		<div class="login-form">
			<div class="sign-in-htm">
                            <form method="post" action="AccountController" >
				<div class="group">
					<label for="user" class="label" >Username</label>
					<input id="user" type="text" name="username" placeholder="Username" class="input" required autofocus="">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password" name="password" placeholder="Password" class="input" data-type="password" required autofocus="">
				</div>
                                     <h6 style="color: red" style="font-size: small" ><%= mess %></h6>
				<div class="group">
					<input type="submit" class="button" value="Sign In">
                                        <input type="hidden" name="service" value="login">
				</div>
                            </form>
                  <a style="color: yellow" href="Home" id="cancel_signup" ><i class="fas fa-angle-left"></i> Back to homepage</a>
				<div class="hr"></div>
			</div>
			<div class="sign-up-htm">
                            <form action="loginController" method="get">
				<div class="group">
					<label for="user" class="label">Username</label>
					<input id="user" type="text" name="signupusername" placeholder="Username" class="input" required autofocus="" >
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password" name="signuppass" class="input" placeholder="Password" data-type="password" required autofocus="" >
				</div>
				<div class="group">
					<label for="pass" class="label">Repeat Password</label>
					<input id="pass" type="password" name="resignuppass" class="input" placeholder="Repeat Password" data-type="password"required autofocus="" >
				</div>
                                <h6 style="color: green;" style="font-size: small" >${mess}</h6>
				<div class="group">
					<input type="submit" class="button" value="Sign Up">
                                        <input type="hidden" name="service" value="register">
				</div>
                            </form>
				<div class="hr"></div>
				<div class="foot-lnk">
					<label for="tab-1">Already Member?</a>
				</div>
			</div>
		</div>
	</div>
</div>
    </body>
</html>
