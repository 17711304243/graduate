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

<title>辩证治疗</title>
<script type="text/javascript">
	
function show(u_id,m_id){

	document.getElementById('u_id').value=u_id;	
	document.getElementById('m_id').value=m_id;	
	document.getElementById('popup').style.display='block';
}
</script>
<style>
	.alt td{ background:black !important;}
</style>
<style type="text/css">
       
        textarea{
        	resize:none;
        	width:500px;
        }

    </style>
    
</head>
<body>
	 
		<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
		<input type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName"/>
		<div id="container">
			<div class="ui_content">   
			<a style="font:'Times New Roman', Times, serif; font-size:large; color:#0066FF; margin-bottom:10px;">辩证治疗</a>  
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
							<th>既往病历(图片/文件)</th>
							<th>上传日期</th>
							<th>操作</th>
						</tr>
						 <c:forEach var="showBaojingDate"  items="${showBaojingDates}">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="14458579642011" class="acb" /></td>
								<td>${showBaojingDate.u_name}</td>
								<td>${showBaojingDate.u_sex}</td>
                                <td>${showBaojingDate.u_age}</td>
								<td>${showBaojingDate.lowpressure}/${showBaojingDate.highpressure}mmHg</td>
								<td>${showBaojingDate.pulse}次/秒</td>
								<td>${showBaojingDate.temperature}度</td>
                                <td><a href="<%=basePath%>file/${showBaojingDate.ecg}">点击查看/下载</a></td>
                                <td>${showBaojingDate.m_date}</td>
                                <td>
                                    <a  onClick="show(${showBaojingDate.u_id},${showBaojingDate.m_id})" href="#">诊断</a>
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
<div class="popup-con" id="popup-con" style="height:510px">
		<h2>辩证治疗</h2>
        <div class="abc">
               <form action="<%=path %>/diagnose/addBaojing.do" method="post" >
               		<input id="u_id" name="u_id" type="text" style="display: none" value="">
               		<input id="m_id" name="m_id" type="text" style="display: none" value="">
                   <div class="text">
                      <label class="user label">疾病类型</label>
                         <select name="condition" id="#" class="#">
                                <option value="">--请选择--</option>
                                <option value="内科方向">内科方向</option>
                                <option value="骨伤科方向">骨伤科方向</option>
                                <option value="外科方向">外科方向</option>
                     </select>  
                   </div>
                   <div class="text">
                      <label class="user label">病情状态</label>
                      
                         <select name="state" id="#" class="#">
                                <option value="">--请选择--</option>
                                <option value="严重">严重</option>
                                <option value="一般">一般</option>
                                <option value="轻微">轻微</option>
                     </select>  
                   </div>
    <!--                 <div class="text">
                      <label class="user label">分析报告</label>
                      
                         <select name="reportname" id="#" class="#">
                                <option value="">--请选择--</option>
                                <option value="高血压病情分析报告">高血压病情分析报告</option>
                                <option value="心脏病分析报告">心脏病分析报告</option>
                                <option value="发烧的分析报告">发烧的分析报告</option>
                     </select>  
                   </div>
                    -->
          
                     
                         <div class="text">
                      <label class="user label">分析及处方撰写</label>
                      <div class="text-input">
                        <textarea  name="report" id="report" rows=15></textarea>
                      </div>
                   <div>
                         
                      
                   <div class="text">
                      <div class="text-input" style=" position: absolute;left: 121px;">
                      	 <input class="btn" type="submit" value="确定">
                      	<button class="btn" href="#" id="myfault" onClick="document.getElementById('popup').style.display='none';">取消</button>                      
                   </div>
                </form>
    </div>
  </div>
</div>
<!-------------------------------------popup结束------------------------------------------>
<div style="display:none"></div>
</body>
</html>

