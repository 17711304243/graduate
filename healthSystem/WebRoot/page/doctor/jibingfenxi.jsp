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



<title>疾病分析</title>
<script type="text/javascript">
	
function show(u_id,m_id){
//	var diatemp = document.getElementById('diatemp').value;
//	alert(diatemp[0]);
//	alert(diatemp[1]);


	document.getElementById('u_id').value=u_id;	
	document.getElementById('m_id').value=m_id;	
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
				<div class="ui_tb">
					<table class="table" id="mytable" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th width="30"><input type="checkbox" id="all" onClick="selectOrClearAllCheckbox(this);" />
							</th>
							<th>姓名</th>
							<th>性别</th>
							<th>年龄</th>
							<th>血压</th>
							<th>脉搏</th>
							<th>体温</th>
							<th>既往病历</th>
							<th>上传日期</th>
							<th>操作</th>
						</tr>
						 <c:forEach var="showBaojingDate"  items="${showBaojingDates1}">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="14458579642011" class="acb" /></td>
								<td>${showBaojingDate.u_name}</td>
								<td>${showBaojingDate.u_sex}</td>
                                <td>${showBaojingDate.u_age}</td>
								<td>${showBaojingDate.lowpressure}/${showBaojingDate.highpressure}mmHg</td>
								<td>${showBaojingDate.pulse}次/秒</td>
								<td>${showBaojingDate.temperature}度</td>
                                <td><a href="../../file/${showBaojingDate.ecg}">图片</a></td>
                                <td>${showBaojingDate.m_date}</td>
                                <td>
                                 <button type="button" class="btn btn-success" id="print" onclick="javascript:window.print()">打印</button>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	
 
 
 
<div style="display:none"></div>
</body>
</html>

