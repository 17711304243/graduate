<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <title>入院办理</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=path%>/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/Css/style.css" />
    <script type="text/javascript" src="<%=path%>/Js/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="<%=path%>/Js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=path%>/Js/ckform.js"></script>
    <script type="text/javascript" src="<%=path%>/Js/common.js"></script>
	<script type="text/javascript" src="<%=path%>/Js/My97DatePicker/WdatePicker.js"></script>

    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
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
		document.forms[0].setAttribute("action","HospitalAction?action=FindHosPage&pageNo=1");
		document.forms[0].submit();
	}
    //上一页
	function upPage(pageNo){
		if(pageNo!=1){//判断当前页数是否不等于1
		pageNo=parseInt(pageNo)-1;
		}
		document.forms[0].setAttribute("action","HospitalAction?action=FindHosPage&pageNo="+pageNo);
        document.forms[0].submit();
	}
	//下一页
	function nextTotal(pageNo,totalPage){
		if(pageNo!=totalPage){//判断当前页数是否等于总页数
		pageNo=parseInt(pageNo)+1;
		}
		document.forms[0].setAttribute("action","HospitalAction?action=FindHosPage&pageNo="+pageNo);
       	document.forms[0].submit();
	} 	
	//尾页
	function totalPage(totalPage){
		document.forms[0].setAttribute("action","HospitalAction?action=FindHosPage&pageNo="+totalPage);
        document.forms[0].submit();
	}	
	//点击任意一页
	function anyPage(li){
	document.forms[0].setAttribute("action","HospitalAction?action=FindHosPage&pageNo="+li);
    document.forms[0].submit();
	}	
	//当前页码高亮
	$(document).ready(function(){$("a[onclick='anyPage("+${pageNo}+")']").addClass("current");});

	 $(function () {
		$('#newNav').click(function(){
				window.location.href="hospital/add.jsp";
		 });
		
		$('#cls').click(function(){
			window.location.href="<%=path%>/HospitalAction?action=FindHosPage";
		});
		
		$('#exportExcel').click(function(){
			var file_name = window.prompt("请指定输出文件名称(.xls)", "C:/hospital.xls");
			$.ajax({
				type : "POST",
				url : "<%=path%>/HospitalAction?action=ExportExcel",
	 			data : "fileName="+file_name,
				success : function(msg) {
					if (msg==1) {
						alert("已导出至"+file_name);
					}else{
						alert("导出失败!")
					}
				}
			}); 
		 });
		
    });
	
    	function checkall(){
			var alls=document.getElementsByName("check");
			var ch=document.getElementById("checkall");
			if(ch.checked){
				for(var i=0;i<alls.length;i++){
					alls[i].checked=true;	
				}	
			}else{
				for(var i=0;i<alls.length;i++){
					alls[i].checked=false;	
				}	
			}
		}
		function delAll(){
			var alls=document.getElementsByName("check");
			var ids=new Array();
			for(var i=0;i<alls.length;i++){
				if(alls[i].checked){
					ids.push(alls[i].value);
				}		
			}
			if(ids.length>0){
				if(confirm("确认操作?")){
					alert("成功!");
				}
			}else{
				alert("请选中要操作的项");
			}
		}
		
		function judge(){
			var st=$("#stime").val();
			var ft=$("#ftime").val();
			var date1 = new Date(st.replace(/-/g,"/"));
			var date2 = new Date(ft.replace(/-/g,"/"));
			var d1=date1.getTime();
			var d2=date2.getTime();
			if (d2>d1||(isNaN(d1)&&isNaN(d2))) {
				document.forms[0].setAttribute("action","HospitalAction?action=FindHosPage");
				document.forms[0].submit();
			}else{
				alert("终止时间应大于起始时间!")
			}
		}
    </script>
    <script type="text/javascript">
		function exi(mno){
 	 	$.ajax({
			type : "POST",
			url : "<%=path%>/HospitalAction?action=ExitHos",
 			data : "mno="+mno,
			success : function(msg) {
				if (msg==1) {
					window.location.href="<%=path%>/HospitalAction?action=FindHosPage";
				}else{
					alert("退院失败!只有已结算状态才能退院!")
				}
			}
		});  
 	 	}
		function leave(mno){
	 	 	$.ajax({
				type : "POST",
				url : "<%=path%>/HospitalAction?action=LeaveHos",
	 			data : "mno="+mno,
				success : function(msg) {
					if (msg==1) {
						window.location.href="<%=path%>/HospitalAction?action=FindHosPage";
					}else{
						alert("办理出院失败!只有已结算状态才能出院!")
					}
				}
			});  
	 	 }
		function sel(){
			$("#depid option[value="+${depId}+"]").attr("selected",true);
		}
    </script>
</head>
<body onload="sel();">

<form action="<%=path%>/HospitalAction?action=FindHosPage" method="post" class="definewidth m20">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">病例号：</td>
        <td><input type="text" name="medicalNo" value="${medicalNo}"/></td>
		
        <td width="10%" class="tableleft">主治医生：</td>
        <td><input type="text" name="docName" value="${docName}"/></td>
		
        <td width="10%" class="tableleft">诊断方向：</td>
        <td><select name="depId" id="depid">
	        <option value="0">所有方向</option>
	        <c:forEach items="${depList}" var="dep">
	        <option value="${dep.id}">${dep.depName}</option>
	        </c:forEach>
       		</select>
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">住院时间：</td>
		
		  <td colspan="5">
			<input name="stime" id="stime" type="text" class="Wdate" value="${stime}" onfocus="WdatePicker({el:$dp.$('stime')})"/>
			&nbsp;至&nbsp;
			<input name="ftime" id="ftime" type="text" class="Wdate" value="${ftime}" onfocus="WdatePicker({el:$dp.$('ftime')})"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-primary" onclick="judge();">查询</button> 
            <button type="reset" class="btn btn-primary" id="cls">清空</button> 
        </td>
    </tr>
</table>
</form>
   
<table class="table table-bordered table-hover definewidth m10" >
   <thead>
    <tr>
    	<th><input type="checkbox" id="checkall" onChange="checkall();"></th>
        <th>病历号</th>
        <th>姓名</th>
        <th>床位号</th>
        <th>联系电话</th>
        <th>押金</th>
        <th>主治医生</th>
        <th>入院时间</th>
        <th>诊断方向</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:forEach items="${hosList}" var="hos">
	     <tr>
         	<td style="vertical-align:middle;"><input type="checkbox" name="check" value="1"></td>
            <td style="vertical-align:middle;">${hos.medicalNo}</td>
            <td style="vertical-align:middle;">
				<c:forEach items="${regList}" var="reg">
				<c:if test="${reg.medicalNo==hos.medicalNo}">${reg.name}</c:if>
				</c:forEach>
			</td>
            <td style="vertical-align:middle;">${hos.bedNo}</td>
            <td style="vertical-align:middle;">
				<c:forEach items="${regList}" var="reg">
				<c:if test="${reg.medicalNo==hos.medicalNo}">${reg.phoneNumber}</c:if>
				</c:forEach>
			</td>
            <td style="vertical-align:middle;">${hos.payCase}</td>
            <td style="vertical-align:middle;">
            	<c:forEach items="${regList}" var="reg">
				<c:if test="${reg.medicalNo==hos.medicalNo}">
					<c:forEach items="${docList}" var="doc">
					<c:if test="${reg.docid==doc.id}">${doc.name}</c:if>
					</c:forEach>
				</c:if>
				</c:forEach>
			</td>
            <td style="vertical-align:middle;">${hos.hosTime}</td>
            <td style="vertical-align:middle;">
				<c:forEach items="${regList}" var="reg">
				<c:if test="${reg.medicalNo==hos.medicalNo}">
					<c:forEach items="${depList}" var="dep">
					<c:if test="${reg.depid==dep.id}">${dep.depName}</c:if>
					</c:forEach>
				</c:if>
				</c:forEach>
			</td>
            <td style="vertical-align:middle;" id="fl">
				<c:forEach items="${regList}" var="reg">
				<c:if test="${reg.medicalNo==hos.medicalNo}">
					<c:if test="${reg.flag==1}">已挂号</c:if>
		            <c:if test="${reg.flag==2}">已询医</c:if>
		            <c:if test="${reg.flag==3}">已出院</c:if>
		            <c:if test="${reg.flag==4}">已退号</c:if>
		            <c:if test="${reg.flag==5}">已住院</c:if>
		            <c:if test="${reg.flag==6}">已退院</c:if>
		            <c:if test="${reg.flag==7}">已结算</c:if>
				</c:if>
				</c:forEach>
			</td>
            <td style="vertical-align:middle;"><a href="<%=path%>/HospitalAction?action=Look&mNo=${hos.medicalNo}">详情>>></a>&nbsp;&nbsp;&nbsp;
	            <a href="<%=path%>/HospitalAction?action=EditHosA&mNo=${hos.medicalNo}">更改</a>&nbsp;&nbsp;&nbsp;
	            <a href="javascript:void(0)" onclick="exi(${hos.medicalNo});">退院</a>&nbsp;&nbsp;&nbsp;
	            <a href="javascript:void(0)" onclick="leave(${hos.medicalNo});">出院</a>
	        </td>
        </tr>
        </c:forEach>
  </table>
  
  <table class="table table-bordered table-hover definewidth m10" >
  	<tr><th colspan="5">  
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
			<a href="javascript:void(0)" onclick="totalPage('${totalPage}')">尾页</a> <span>共${totalPage}页,${totalCount}条</span>
		 </div>
		 <div><button type="button" class="btn btn-success" id="newNav">录入住院信息</button>&nbsp;&nbsp;&nbsp;
		 <button type="button" class="btn btn-success" id="delPro" onClick="delAll();">出院</button>&nbsp;&nbsp;&nbsp;
		 <button type="button" class="btn btn-success" id="delP" onClick="delAll();">退院</button>&nbsp;&nbsp;&nbsp;
		 <button type="button" class="btn btn-success" id="exportExcel">导出Excel</button>
		 <button type="button" class="btn btn-success" id="delPr" onclick="javascript:window.print()">打印</button>
		 
		 </div>
		 
		 </th></tr>
  </table>
  
</body>
</html>

