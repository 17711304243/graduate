<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
	<meta charset="utf-8">
	<title>登录 - 就诊系统</title>
	<link rel="stylesheet" type="text/css" href="css/register-login.css">
</head>
<body>
<div id="box"></div>
<div class="cent-box">
	<div class="cent-box-header">
		<h2 class="sub-title"><h1>您好，请登录</h2>
	</div>

	<div class="cont-main clearfix">
		<div class="index-tab">
			<div class="index-slide-nav">
				<a href="login.jsp" class="active">登录</a>
				<a href="sign.jsp">注册</a>
				<div class="slide-bar"></div>				
			</div>
		</div>

<form class="loginForm" action="../../login/checklogin.do" method="post">
		<div class="login form">
			<div class="group">
				<div class="group-ipt userName">
					<input type="text" name="username" id="username"  class="userInput" placeholder="输入您的用户名" required>
				</div>
				<div class="group-ipt password">
					<input type="password" name="password" id="password"  class="passInput" placeholder="输入您的登录密码" required>
				</div>
			</div>
		</div>
		
         <p class="loginType">
                <span>请选择您的身份：</span>
			    <span class="left"><input type="radio" id="normalLogin" name="loginType" value="normal" checked="checked" onClick="doSomeChange(1)" /><label for="narmalLogin" >用户</label></span>
			    <span class="right"><input type="radio" id="dynamicLogin" name="loginType" value="dynamic" onClick="doSomeChange(2)"/><label for="dynamilcLogin">医生</label></span>
		</p>
		<div class="button">
			<button type="submit" class="loginButton" id="button" onclick="callback()">登录</button>
		</div>
		
			<label class="forgot-password">
			<a href="../../index.jsp">返回主页？</a>
			</label>
		</div>
	</div>
</form>

<div class="footer">
     <p style="font-weight:bold;font-size:14px;">Copyright &copy; 2018.6 from 中医专家系统 All rights reserved. </p>
</div>

<script src='js/particles.js' type="text/javascript"></script>
<script src='js/background.js' type="text/javascript"></script>
<script src='js/jquery.min.js' type="text/javascript"></script>
<script src='js/layer/layer.js' type="text/javascript"></script>
<script src='js/index.js' type="text/javascript"></script>

</body>
</html>