<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>欢迎您，请登陆！</title>
<!-- Meta-Tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="Instant Sign In Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Meta-Tags -->

<!-- Custom Theme files -->
<link href="Css/popup-box.css" rel="stylesheet" type="text/css" media="all" />
<link href="Css/style1.css" rel='stylesheet' type='text/css' />

<!-- font-awesome-icons -->
<link href="Css/font-awesome.css" rel="stylesheet"> 
	
<!-- //font-awesome-icons -->

<!--fonts--> 
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700,800" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<!--//fonts--> 
 <script type="text/javascript" src="<%=path%>/Js/jquery-1.6.4.min.js"></script>
    <script type="text/javascript" src="<%=path%>/Js/form/jquery.form.js"></script>
	<script type="text/javascript" src="<%=path%>/Js/form/jquery.validate.defined.js"></script>
	<script type="text/javascript" src="<%=path%>/Js/form/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=path%>/Js/form/jquery.validation.assist.js"></script>
 	<script type="text/javascript" src="<%=path%>/Js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=path %>/Js/ckeditor/ckeditor.js"></script>
 
    <script type="text/javascript">
	$(document).ready(init);
	function init() {
		$("#frm1").validate( {
			rules : {
				"name" : {
					required : true,
					maxlength : 10
				},
				"identifier" : {
					required : true,
					maxlength : 30
				},
				"insuranceNumber" : {
					required : true,
					maxlength : 30
				},
				"regfee" : {
					required : true,
					number : true,
					maxlength : 15
				},
				"phoneNumber" : {
					required : true,
					maxlength : 20
				},
				"age" : {
					required : true,
					number : true,
					maxlength : 3
				},
				"profession" : {
					required : true,
					maxlength : 20
				}
			},
			success : function(label) {
				label.html("&nbsp;").addClass("checked");
			}
		});
	}
	</script>
    <script type="text/javascript">
    $(function () {       
		$('#backid').click(function(){
				window.location.href="RegisterAction?action=FindRegPage";
		 });
    });
    </script>
   <script type="text/javascript">
   $(function(){
	 	$.ajax({
			type : "POST",
			url : "RegisterAction?action=findDocList",
			data : "depid=1",
			success : function(msg) {
				$("#ss").html(" ");
				var list=eval(msg);
				$.each(list,function(index, user){
				 	$("#ss").append("<option value="+user.id+">"+user.name+"</option>");
				});
			}
		});  
	 	
	 });
   
	 $(function(){
			$("#depId").change(function(){
	 	  	var depid=$("#depId").val();
	 	 	$.ajax({
				type : "POST",
				url : "RegisterAction?action=findDocList",
	 			data : "depid="+depid,
				success : function(msg) {
					$("#ss").html(" ");
					var list=eval(msg);
					$.each(list,function(index, user){
					 	$("#ss").append("<option value="+user.id+">"+user.name+"</option>");
					});
				}
			});  
	 	 	});
	 	 });
    </script>
</head>
<script type="text/javascript">
	function resetValue(){
		document.getElementById("userName").value="";
		document.getElementById("password").value="";
	}
	
	function loadimage(){
		document.getElementById("randImage").src = "image.jsp?"+Math.random();
	}
</script>
 <script type="text/javascript">
    function yanz(){
    	var yanzm=$('#yy').val();
    	$.ajax({
			type : "POST",
			url : "<%=path%>/Verify?action=yzma",
 			data : "verify="+yanzm,
			success : function(msg) {
				if (msg==1) {
					$("#yzm").html("<font color='green'>正确</font>");
					$('#subm').attr("disabled", false);
				}else{
					$("#yzm").html("<font color='red'>错误</font>");
					$('#subm').attr("disabled", true);
					alert("请填写正确的验证码！")
					location.reload();	
				}
			}
		});
    }
   
    $('#subm').click(function (event) {
    	event.preventDefault();
    	$('form').fadeOut(500);
    	//$('.wrapper').addClass('form-success');
    });
    </script>
    <script type="text/javascript">
	$(document).ready(init);
	function init() {
		$("#frm1").validate( {
			rules : {
				"username" : {
					required : true,
					maxlength : 10
				},
				"password" : {
					required : true,
					maxlength : 30
				}
			},
			success : function(label) {
				label.html("&nbsp;").addClass("checked");
			}
		});
	}
	</script> 
<body>
<div class="agileinfo-dot">
<!--background-->
<!-- login -->
<h1>中医专家诊断系统</h1>

	<div class="login-section">
	    <div class="login-w3l">
		<i class="fa fa-medkit" aria-hidden="true"></i>
		<form class="form-signin" method="post" id="frm1" action="<%=path%>/Verify">
		<h2 class="sub-head-w3-agileits">欢迎您，请登陆 ！</h2>	
			<div class="login-form">			
					<div class="input">
						<i class="fa fa-user" ></i> <input type="text"  name="username" class="input-block-level" placeholder="请输入您的用户名"  />
					</div>
					<div class="input">
						<i class="fa fa-unlock-alt" ></i> <input type="password" name="password" class="input-block-level" placeholder="请输入您的密码"  />
					</div>	
						<div class="input">
							<i class="fa fa-unlock-alt" ></i> <input type="text" id="yy" name="verify" onblur="yanz();" class="input-medium" placeholder="请输入您的验证码" />
							<img src="<%=path%>/yzm.jsp" align="right"  alt="验证码" height="30" align="bottom" style="cursor:pointer;" title="看不清可单击图片刷新" onclick="this.src='yzm.jsp?d='+Math.random();"/>&nbsp;&nbsp;&nbsp;&nbsp;
	        <font color="red"  value=""><span id="yzm"></span></font>
						</div>			
					<div class="signin-rit">
						<span class="checkbox1">
							<label class="checkbox"><input type="checkbox" name="checkbox" checked="">记住密码</label>
						</span>
						<a class="forgot" href="welcome.jsp">返回主页?</a>
						<div class="clear"> </div>
					</div>
					<input type="submit" value="登陆">
				</form>	
				<p><a class="book popup-with-zoom-anim button-isi zoomIn animated" data-wow-delay=".5s" href="#small-dialog2">点击注册？<a class="book popup-with-zoom-anim button-isi zoomIn animated" data-wow-delay=".5s" href="#small-dialog">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;免注册快速挂号？</a></p>
			</div>
			<!-- //login -->
			
		</div> 	
		<div class="profile-agileits bg-color-agile">
			<!-- <h3>Expert system of traditional Chinese Medicine</h3>
			<h2>1.医生和管理员凭账号密码进入该系统</h2>
			<h2>2.用户点击下方免登陆快读挂号</h2>
			<h2>3.可以点击下方注册注册相应角色</h2>
			<p></p> -->
		</div> 
		<div class="clear"></div>
	</div>	
			<p class="footer">© 2018 All Rights Reserved | Design by YangRuize</p>
			<!--//login-->
			<div class="pop-up"> 
	<div id="small-dialog" class="mfp-hide book-form">
		<h3 class="sub-head-w3-agileits">用户挂号</h3>	
		 <div class="login-form">			
			<form id="frm1" action="SignAction?action=AddRegB" method="post" class="definewidth m20">
				<div class="input">
					<i class="fa fa-user" ></i> <input type="text" class="tableleft" name="name" placeholder="请输入用户名" />
				</div>
				<div class="input">
				<font color="white">选择身份证类型</font><select name="identifierType" /><option value="1">身份证</option><option value="2">护照</option><option value="3">军人证</option></select>
				</div>
				<div class="input">
					<i class="fa fa-unlock-alt" ></i> <input type=text name="identifier" class="tableleft" placeholder="请输入身份证号"/>
				</div>
				<div class="input">
					<i class="fa fa-user" ></i> <input type="text" class="tableleft" name="insuranceNumber" placeholder="请输入社保卡号"  />
				</div>
				<div class="input">
					<i class="fa fa-user" ></i> <input type="text" class="tableleft" name="regfee" placeholder="请输入挂号费用" />
				</div>
				<div class="input">
					<i class="fa fa-user" ></i> <input type="text" class="tableleft" name="phoneNumber" placeholder="请输入联系电话"  />
				</div>
				<div class="input">
					<font color="white">是否自费</font><input type="radio" name="expenseFlag" value="1" checked/><font color="white">是</font>&nbsp;&nbsp;&nbsp;<input type="radio" name="expenseFlag" value="0"/><font color="white">否</font>
				</div>
				<div class="input">
					<font color="white">性别</font> <input type="radio" name="gender" value="1" checked/><font color="white">男</font>&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="0"/><font color="white">女</font>
				</div>
				<div class="input">
					<i class="fa fa-user" ></i> <input type="text" class="tableleft" name="age" placeholder="请输入年龄" />
				</div>
				<div class="input">
					<i class="fa fa-user" ></i> <input type="text" class="tableleft" name="profession" placeholder="请输入职业" required="" />
				</div>
				<div class="input">
					<font color="white">初复诊情况</font> <input type="radio" name="czflag" value="0" checked/><font color="white">初诊</font>&nbsp;&nbsp;&nbsp;<input type="radio" name="czflag" value="1"/><font color="white">复诊</font>
				</div>
				<tr>
				<div class="input">
               <td width="10%" class="tableleft"><font color="white">诊断方向</font></td>
               <td>
	           <select name="depId" id="depId">
	           <c:forEach items="${depList}" var="dep">
	           <option value="${dep.id}">${dep.depName}</option>
	           </c:forEach>
	           </select>
               </td>
               </tr>
               </div>
      <div class="input">
        <tr>
        <td width="10%" class="tableleft"><font color="white">指定医生</font></td>
        <td>
        <select name="docId" id="ss">
         <c:forEach items="${docList}" var="doc">
	           <option value="${doc.id}">${doc.name}</option>
	           </c:forEach>
        </select>      
        </td>
        </tr>
       </div>
       
      	<div class="input">
				<font color="white">请填写病情描述</font> <input type="textarea" style="width:300px; height:50px" name="remarks" />
				</div>
			<input type="submit" value="提交" />
			
			</form>
		</div> 
		
	</div>
<!-- 用户注册 -->
<!--//login-->
			<div class="pop-up"> 
	<div id="small-dialog2" class="mfp-hide book-form">
		<h3 class="sub-head-w3-agileits">用户注册</h3>	
		<div class="login-form">			
			<form action="<%=path%>/UseregAction?action=AddUser" method="post">
				<div class="input">
					<i class="fa fa-user" aria-hidden="true"></i> <input type="text" name="username" placeholder="设置您的登录名" required="" />
				</div>	
				<div class="input">
					<i class="fa fa-envelope" aria-hidden="true"></i> <input type="password" name="password"  placeholder="填写密码" required=""/>
				</div>
				<div class="input">
					<i class="fa fa-unlock-alt" aria-hidden="true"></i> <input type="text" name="realname" placeholder="您的真实姓名" required=""/>
				</div>
				<div class="input">
					<i class="fa fa-unlock-alt" aria-hidden="true"></i> <input type="text" name="email"  placeholder="填写邮箱地址" required=""/>
				</div>		
				<!-- <div class="input">	
				<tr>
            <td class="tableleft"><font color="white">状态(您的访问权限！)</font></td>
            <td>
                <input type="radio" name="status" value="0" checked/><font color="white">禁用</font>
              	<input type="radio" name="status" value="1" /><font color="white">启用</font>
            </td>
              </tr>	
              </div> -->
             <%--  <div class="input">	
              <tr>
            <td class="tableleft"><font color="white">选择角色(当前注册只对用户开放！)</font></td>
            <td>
            	<select  id="roleid" name="roleid">
	            	<c:forEach items="${roleList}" var="role">
	        			
	        			<c:if test="${role.roleId==8}"> 
	        			<option value="${role.roleId}">
	        			${role.roleName}
	        			</c:if >  
	        			
	        			
	            	</c:forEach>
       			 </select>
        	</td>
            </tr>
            </div> --%>
				<input type="submit" value="点击注册">
			</form>
		</div>
	</div>
</div>	
</div>
<!-- //用户注册 -->
<!--js-->
<script type="text/javascript" src="Js/jquery-2.1.4.min1.js"></script>
<!--//js-->
<!--popup-js-->
<script src="Js/jquery.magnific-popup.js" type="text/javascript"></script>
 <script>
						$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type: 'inline',
							fixedContentPos: false,
							fixedBgPos: true,
							overflowY: 'auto',
							closeBtnInside: true,
							preloader: false,
							midClick: true,
							removalDelay: 300,
							mainClass: 'my-mfp-zoom-in'
						});
																						
						});
</script>
<!--//popup-js-->

</body>
</html>	