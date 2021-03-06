<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="../page/user/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="../page/user/style/authority/common_style.css" rel="stylesheet" type="text/css">



<title>诊断结果</title>
<script type="text/javascript">
	
function show(dis){
document.getElementById('pp').innerHTML="<p>"+dis+"</p>";
document.getElementById('popup').style.display='block';
}
</script>
<style>
	.alt td{ background:black !important;}
</style>
</head>
<body>
	 
		<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
		<input type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName"/>
		<div id="container">
			<div class="ui_content">   
			 <a style="font:'Times New Roman', Times, serif; font-size:large; color:#0066FF; margin-bottom:10px;">诊断结果</a>  
				<div class="ui_tb">
					<table class="table" id="mytable" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th width="30"><input type="checkbox" id="all" onClick="selectOrClearAllCheckbox(this);" />
							</th>
							<th>姓名</th>
							<th>性别</th>
							<th>年龄</th>
							<th>疾病类型</th>
							<th>病情状态</th>
							<!-- <th>健康报告</th> -->
							<th>会诊日期</th>
							<th>操作</th>
						</tr>
						<c:forEach var="showBingliDate" items="${showBingliDates }">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="14458579642011" class="acb" /></td>
								<td>${showBingliDate.u_name }</td>
								<td>${showBingliDate.u_sex }</td>
                                <td>${showBingliDate.u_age }</td>
								<td>${showBingliDate.cond }</td>
								<td>${showBingliDate.state }</td>
								<%-- <td>${showBingliDate.report_name }</td> --%>
                                <td>${showBingliDate.d_date }</td>
                                <td>
                                    <a  onClick="show('${showBingliDate.report}' )" href="#">诊断结果</a>
                                    <form action="<%=basePath %>/diagnose/deldiagnose.do" method="post">
                                    <input style="display: none" name="deldiagparm" value="${showBingliDate.dia_id }">
                                  	<input type="submit" value="删除" onclick="return confirm('你确定要删除吗？')">
                                    </form>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	
 <!-------------------------------------popup开始------------------------------------------>
<div id="popup" >
	<div class="popup-dia"></div>
<div class="popup-con" id="popup-con">
		<h2>处方信息</h2>
        <div id="pp" class="abc" >
              
    </div>
  </div>
</div>
<!-------------------------------------popup结束------------------------------------------>
<div style="display:none"></div>
</body>
</html>

