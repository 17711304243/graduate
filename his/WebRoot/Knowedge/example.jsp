<%@page import="com.his.serviceimpl.RoleServiceImpl"%>
<%@page import="com.his.service.RoleService"%>
<%@page import="com.his.serviceimpl.UserServiceImpl"%>
<%@page import="com.his.service.UserService"%>
<%@page import="com.his.vo.User"%>
<%@page import="com.his.vo.Role"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<title>病例管理</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=path%>/Css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/Css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/Css/style.css" />
<script type="text/javascript" src="<%=path%>/Js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/Js/jquery.sorted.js"></script>
<script type="text/javascript" src="<%=path%>/Js/bootstrap.js"></script>
<script type="text/javascript" src="<%=path%>/Js/ckform.js"></script>
<script type="text/javascript" src="<%=path%>/Js/common.js"></script>

<%
    String ui=request.getParameter("uid");

    if (ui==null||ui=="") {
	   ui="125";
	   }
    int uid=Integer.valueOf(ui);

    UserService users=new UserServiceImpl();
    User user0=users.findUserById(uid);
    int roleid0=user0.getRoleid();
    RoleService roles=new RoleServiceImpl();
    Role role0=roles.findRoleById(roleid0);
    if(roleid0 ==1 || roleid0 ==2 || roleid0 ==3){
    System.out.println(roleid0);
    	
    }
    else{
    	request.getRequestDispatcher("fail2.jsp").forward(request,response);
    }

%>

<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}
.cur{
color:red;
}

@media ( max-width : 980px) { /* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
<script type="text/javascript">
    //首页	
 	function toptotal(){
 		document.forms[0].setAttribute("action","RecordAction?action=FindRecPage&pageNo=1");
 		document.forms[0].submit();
 	}
     //上一页
 	function upPage(pageNo){
 		if(pageNo!=1){//判断当前页数是否不等于1
 		pageNo=parseInt(pageNo)-1;
 		}
 		document.forms[0].setAttribute("action","RecordAction?action=FindRecPage&pageNo="+pageNo);
        document.forms[0].submit();
 	}
 	//下一页
 	function nextTotal(pageNo,totalPage){
 		if(pageNo!=totalPage){//判断当前页数是否等于总页数
 		pageNo=parseInt(pageNo)+1;
 		}
 		document.forms[0].setAttribute("action","RecordAction?action=FindRecPage&pageNo="+pageNo);
        document.forms[0].submit();
 	} 	
 	//尾页
 	function totalPage(totalPage){
 		document.forms[0].setAttribute("action","RecordAction?action=FindRecPage&pageNo="+totalPage);
        document.forms[0].submit();
 	}	
 	//点击任意一页
 	function anyPage(li){
 	document.forms[0].setAttribute("action","RecordAction?action=FindRecPage&pageNo="+li);
     document.forms[0].submit();
 	}	
 	
 	//复选框删除
	function delAll(){
		var alls=document.getElementsByName("check");
		var ids=new Array();
		for(var i=0;i<alls.length;i++){
			if(alls[i].checked){
				ids.push(alls[i].value);
			}		
		}
		if(ids.length>0){
			if(confirm("确认删除?")){
				alert("删除成功!");
				document.forms[0].setAttribute("action","<%=path%>/RecordAction?action=delChecked&rids="+rids);	
				document.forms[0].submit();
			}
		}else{
			alert("请选中要删除的项");
		}
	}
 	
 	//当前页码高亮
	$(document).ready(function(){$("a[onclick='anyPage("+${pageNo}+")']").addClass("current");});
		
    </script>
    
</head>
<body >
	<form action="<%=path%>/RecordAction?action=FindRecPage" method="post" class="definewidth m20">
		患者姓名：
    <input type="text" name="rname" id="rname" class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>
</form>

	<table class="table table-bordered table-hover definewidth m10" id="tabl">
		<thead>
			<tr>
			    <th width="5%"><input type="checkbox" id="checkall" onChange="checkall();"></th>
				<th>编号</th>
				<th>患者姓名</th>
				<th>病情描述</th>
				<th>中医辩证</th>
				<th>处方信息</th> 
				<!-- <th>治疗结果</th> -->
				<th>操作</th>
			</tr>
		</thead>
		<c:forEach items="${recList}" var="rec">
			<tr>
			  <td style="vertical-align:middle;">
				<input type="checkbox" name="check" value="${rec.rid}">
				</td>
			    <td style="vertical-align:middle;">${rec.rid}</td>
				<td style="vertical-align:middle;">${rec.rname}</td>
				<td style="vertical-align:middle;">${rec.rdesc}</td>
				<td style="vertical-align:middle;">${rec.rview}</td>
				<td style="vertical-align:middle;">${rec.rpresc}</td>
				<%-- <td style="vertical-align:middle;">${rec.rcure}</td> --%>
				<td style="vertical-align:middle;">
				<a href="<%=path%>/RecordAction?action=Look&rid=${rec.rid}">详情</a>&nbsp;&nbsp;&nbsp;
				<a href="<%=path%>/RecordAction?action=FindRecById&rid=${rec.rid}">更改</a>&nbsp;&nbsp;&nbsp;
				<a href="<%=path%>/RecordAction?action=DelRecById&rid=${rec.rid}">删除</a>
				</td>
			</tr>
		</c:forEach>
	</table>

	<table class="table table-bordered table-hover definewidth m10">
		<tr>
	  	<th colspan="5">  
	  	<div class="inline pull-right page">
	        <a href="javascript:void(0)" onclick="toptotal()">首页</a> 
			<a href='javascript:void(0)' onclick="upPage('${pageNo}')">上一页</a> 
			<a href="javascript:void(0)" onclick="nextTotal('${pageNo}','${totalPage}')">下一页</a> 
			<c:if test="${totalPage<4}">
				<c:forEach items="${lis}" var="li">
					<a href="javascript:void(0)" onclick="anyPage(${li})">${li}</a>
				</c:forEach>
			</c:if>
			<c:if test="${totalPage>=4}">
				<a href="javascript:void(0)" onclick="anyPage(${pageMid-1})">${pageMid-1}</a>
				<a href="javascript:void(0)" onclick="anyPage(${pageMid})">${pageMid}</a>
    			<a href="javascript:void(0)" onclick="anyPage(${pageMid+1})">${pageMid+1}</a>
			</c:if>
			<a href='javascript:void(0)' onclick="totalPage('${totalPage}')">尾页</a> <span>共${totalPage}页,${totalCount}条</span>
		</div>
				<div>
					
					<!-- <button type="button" class="btn btn-success" id="exportExcel">导出Excel</button> -->
					<button type="button" class="btn btn-success" id="delPro" onClick="delAll();">删除选中</button>
					<button type="button" class="btn btn-success" id="delP" onClick="javascript:window.print()">打印</button>
				</div></th>
		</tr>
	</table>

</body>
</html>
