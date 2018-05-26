<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <title>中医专家系统</title>
    <script type="text/javascript" src="assets/js/jquery-1.6.js"></script>
    <script type="text/javascript">
 $(function(){ 
    var xx=$('#relname').text();
     if (xx=="") {
		alert("您当前未登录，请登录!");
		window.location.href="welcome.jsp";
	} 
}); 

<%-- <%
if(session.getAttribute("user")==null || session.getAttribute("user").toString().equals("")){
	response.sendRedirect(request.getContextPath()+"/welcome.jsp");
	return;
}
%> --%>

</script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/main-min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="assets/js/bui.js"></script>
<script type="text/javascript" src="assets/js/common/main-min.js"></script>
<script type="text/javascript" src="assets/js/config-min.js"></script>

</head>

<body>

<div class="header">

    <div class="dl-title">
        <!--<img src="/chinapost/Public/assets/img/top.png">-->
    </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user" id="relname">${rname}</span>
	
	<a href="welcome.jsp" title="退出系统" class="dl-log-quit">[注销退出]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">中医专家系统</div></li>

		</ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">
    </ul>
</div>

<script>
    BUI.use('common/main',function(){
        var config = [
			{id:'1',menu:[
				
		{text:'快速通道',items:[
		
		{id:'2',text:'挂号信息管理',href:'RegisterAction?action=FindRegPage&uid=${userid}'},
		{id:'3',text:'中医专家管理',href:'DoctorAction?action=FindDoctorPage&uid=${userid}'},
		{id:'4',text:'中药管理',href:'DrugAction?action=FindDrugPage&uid=${userid}'},
		{id:'5',text:'住院办理',href:'HospitalAction?action=FindHosPage&uid=${userid}'},
		{id:'6',text:'费用管理',href:'FeeAction?action=FindFeePage&uid=${userid}'},
		{id:'7',text:'医生配药',href:'DispAction?action=FindDispPage&uid=${userid}'},
		 {id:'8',text:'辩证治疗',href:'Knowedge/record.jsp'}, 
		//{id:'9',text:'月营业额统计',href:''},
		{id:'9',text:'病例管理',href:'RecordAction?action=FindRecPage&uid=${userid}'},
		{id:'11',text:'用户管理',href:'UserAction?action=FindUserPage&uid=${userid}'},
		{id:'12',text:'权限管理',href:'RoleAction?action=FindRolePage&uid=${userid}'},
		{id:'13',text:'资源管理',href:'ResourcesAction?action=FindResPage&uid=${userid}'},
		{id:'14',text:'辩证思想',href:'Knowedge/bianzheng.jsp'},
		{id:'15',text:'中药功效',href:'Knowedge/zhongyao.jsp'},
		{id:'16',text:'疾病查询',href:'Knowedge/illness.jsp'},
		{id:'17',text:'案例查询',href:'Knowedge/cure.jsp'},
	/* 	{id:'17',text:'辩证治疗',href:'Knowedge/record.jsp'},
		{id:'18',text:'病例管理',href:'Knowedge/example.jsp'}, */
		//{id:'14',text:'密码设置	',href:'Resource/index.html'}
		
		]}

			
			]}
		
		];
        new PageUtil.MainPage({
            modulesConfig : config
        });
    });
</script>

</body>
</html>
