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

<link href="../page/user/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="../page/user/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script>
/* function check(){
	console.log("1");
	var val1 = document.getElementById("val1").value;
	var val2 = document.getElementById("val2").value;
	var val3 = document.getElementById("val3").value;
	var val4 = document.getElementById("val4").value;
	var reg=/^[1-9]\d*$|^0$/;   // 注意：故意限制了 0321 这种格式，如不需要，直接reg=/^\d+$/;
	if(reg.test(val1)==true && reg.test(val2)==true&& reg.test(val3)==true&& reg.test(val4)==true){
	    alert("添加成功");
	    console.log("2");
	    return true;
	}else{
	    alert("请填写正确的格式！(只能是数字)");
	    return false;
	}
} */
</script>

<title>数据监测</title>
<script type="text/javascript">
	
function show(){
	
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
            <a style="font:'Times New Roman', Times, serif; font-size:large; color:#0066FF; margin-bottom:10px;">数据采集</a>
            <a style="float:right;font:'Times New Roman', Times, serif; font-size:large; color:#0066FF;margin-bottom:10px;" onClick="show()" href="#">上传</a>
            
				<div class="ui_tb">
					<table class="table" id="mytable" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th width="30"><input type="checkbox" id="all" onClick="selectOrClearAllCheckbox(this);" />
							</th>
							<th>血压</th>
							<th>脉搏</th>
							<th>体温</th>
							<th>既往病历(图片/文件)</th>
							<th>上传日期</th>
							<th>操作</th>
						</tr>
							 <c:forEach var="Monitoring"  items="${Monitorings}">
							<tr>
						
								<td><input type="checkbox" name="IDCheck" value="14458579642011" class="acb" /></td>
								<td> ${Monitoring.lowpressure}/${Monitoring.highpressure}mmHg</td>
								<td>${Monitoring.pulse}次/秒</td>
								<td>${Monitoring.temperature}度</td>
                                 <td><a href="<%=basePath%>file/${Monitoring.ecg}">点击查看/下载</a></td>
                                <td>${Monitoring.m_date}</td>
								<td>
								<form action="<%=basePath %>/monitor/del.do" method="post">
								<input hidden="display:none" id="text1" name="delparm" type="text" value="${Monitoring.m_id}" >
								<input type="submit" value="删除" onclick="return confirm('你确定要删除吗？')">
								
								</form>
								<!--<a href="javascript:del('14458579642011');">删除</a>  -->
								</td>
							</tr>
						 </c:forEach> 
							<!-- 删除功能重新做一个表单，循环出一个隐藏数据，讲该数据提交到表单 -->
						
					</table>
				</div>
			
					<div class="ui_frt">
						<!--    如果是第一页，则只显示下一页、尾页 -->
						
							<input type="button" value="首页" class="ui_input_btn01" />
							<input type="button" value="上一页" class="ui_input_btn01" />
							<input type="button" value="下一页" class="ui_input_btn01"
								onclick="jumpNormalPage(2);" />
							<input type="button" value="尾页" class="ui_input_btn01"
								onclick="jumpNormalPage(9);" />
						
						
						
						<!--     如果是最后一页，则只显示首页、上一页 -->
						
						转到第<input type="text" id="jumpNumTxt" class="ui_input_txt01" />页
							 <input type="button" class="ui_input_btn01" value="跳转" onClick="jumpInputPage(9);" />
					</div>
				</div>
			</div>
            
            
		</div>
 <!-------------
 
 ------------------------popup开始------------------------------------------>
<div id="popup" >
	<div class="popup-dia"></div>
<div class="popup-con" id="popup-con">
		<h2>数据采集</h2>
        <div class="abc">
                 <form target="waiguan_hidden_frame" action="<%= basePath%>upload/up.do" method="post" enctype="multipart/form-data">
    				 <div class="text" >
                      <label class="user label">既往病历</label>
                         <input  type="file" name="f1" class="form-control" >
                         <input type="submit" value="保存" onclick="return confirm('你确定要保存吗？')"/>
                   </div>
                 </form>
                   <iframe name="waiguan_hidden_frame" id="waiguan_hidden_frame" style="display:none"></iframe>  
                    <form action="<%= basePath%>monitor/add.do" method="post">
                   <div class="text">
                      <label class="user label">血压</label>
                      <div class="text-input">
                         <input id="val1" name="highpress" type="text" class="form-control"><span>mmHg(高压)</span>
                         
                      </div>
                   </div>
                   <div class="text">
                      <label class="user label"></label>
                      <div class="text-input">
                         
                         <input id="val2"name="lowpress" type="text" class="form-control"><span>mmHg(低压)</span>
                      </div>
                   </div>
                   
                   <div class="text">
                      <label class="user label">脉搏</label>
                      <div class="text-input">
                         <input id="val3" name="pulse" type="text" class="form-control" ><span>次/分</span>
                      </div>
                   </div>
                   
                   <div class="text">
                      <label class="user label">体温</label>
                      <div class="text-input">
                         <input id="val4" name="temperature" type="text" class="form-control" ><span>度</span>
                      </div>
                   </div>
            
                   <div class="text">
                      <label class="user label">诊治医生</label>
                      
                         <select name="doctor" id="#" class="#">
                                <option value="">--请选择--</option>
                                <option value="肖钦文">肖钦文</option>
                                <option value="胡定邦">胡定邦</option>
                                <option value="郭佼">郭佼</option>
                            </select>
                     
                   </div>
                   
                   <div class="text">
                      <div class="text-input">
                        <input class="btn" type="submit" value="确认" />
                         <button class="btn" href="#" id="myfault" onClick="document.getElementById('popup').style.display='none';">取消</button>                      
                         </div>
                   </div>
   				
    			  </form>
                      
    </div>
  </div>
</div>
<!-------------------------------------popup结束------------------------------------------>
<div style="display:none"></div>
</body>


}
</html>
