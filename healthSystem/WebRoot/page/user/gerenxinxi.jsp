	<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="scripts/jquery/jquery-1.7.1.js"></script>
<link href="style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="scripts/artDialog/artDialog.js?skin=default"></script>
<title>健康报告</title>
<style>
	.alt td{ background:black !important;}
</style>
</head>
<body>
	<form id="submitForm" name="submitForm" action="" method="post">
		<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
		<input type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName"/>
		<div id="container">
			<div class="ui_content">
            <p style="font:'Times New Roman', Times, serif; font-size:large; color:#0066FF; margin-bottom:10px;">基本信息</p>
				<div class="ui_tb" align="center">
					<c:forEach var="UserInfo" items="${UserInfos }">
					<p style="font:'Times New Roman', Times, serif; font-size:large; color:#8600FF; margin-bottom:25px;">账号:${UserInfo.u_username }</p>
                    <p style="font:'Times New Roman', Times, serif; font-size:large; color:#8600FF; margin-bottom:25px;">姓名:${UserInfo.u_name }</p>
                    <p style="font:'Times New Roman', Times, serif; font-size:large; color:#8600FF; margin-bottom:25px;">性别:${UserInfo.u_sex }</p>
                    <p style="font:'Times New Roman', Times, serif; font-size:large; color:#8600FF; margin-bottom:25px;">年龄${UserInfo.u_age }</p>
                    </c:forEach>
				</div>
			
			</div>
            
  
            
		</div>
	</form>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
