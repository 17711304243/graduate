<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>辩证治疗</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/Css/style.css" />
<style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }
        textarea{
        	resize:none;
        	width:500px;
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
            function myfunction()  
            {  
                if(document.getElementById("rname").value=="")  
                {  
                    alert("请填写患者姓名");  
                    return false;                     
                }  
                if(document.getElementById("rdesc").value=="")  
                {  
                    alert("请填写病情描述");  
                    return false;                     
                }  
                if(document.getElementById("rview").value=="")  
                {  
                    alert("请填写辩证治疗");  
                    return false;                     
                }  
                if(document.getElementById("rpresc").value=="")  
                {  
                    alert("请填写处方信息");  
                    return false;                     
                } 
                if(document.getElementById("rname").value!="" && document.getElementById("rdesc").value!="" 
                		&& document.getElementById("rview").value!="" && document.getElementById("rpresc").value!=""){
                	alert("处方更新成功"); 
                }
                return true;  
                
                
            }  
        </script>  
    
</head>
<body>

	<form action="<%=path%>/RecordAction?action=EditRec&recid=${rec.rid}" method="post"  class="definewidth m20">
<table class="table table-bordered table-hover definewidth m10">

    <tr>
        <td width="10%" class="tableleft">患者姓名</td>
        <td><input type="text" name="rname" value="${rec.rname}"/></td>
        
    </tr>    
    <tr>
          <td width="10%"  class="tableleft">病情概述</td>
           
           <td>
           <textarea  name="rdesc" id="rdesc" rows="13" >${rec.rdesc}</textarea>
           </td>
           
    </tr>
    <tr>
          <td width="10%"  class="tableleft">中医辩证</td>
         
           <td>
           <textarea  name="rview" id="rview" rows="13" >${rec.rview}</textarea>
           </td>
         
    </tr> 
    <tr>
          <td width="10%"  class="tableleft">撰写处方</td>
           
           <td>
           <textarea  name="rpresc" id="rpresc" rows="13" >${rec.rpresc}</textarea>
           </td>
    </tr>
     <tr>
          <td width="10%"  class="tableleft">治疗结果</td>
           <td>
           <textarea  name="rcure" id="rcure" rows="10" >${rec.rcure}</textarea>
           </td>
    </tr>
    <tr>
        <td colspan="2">
			<center>
				<button type="submit" class="btn btn-primary"  value="保存" onclick="return myfunction()">更新</button> &nbsp;&nbsp;
				<button type="button" class="btn btn-primary" ><a href="javascript:history.back(-1)">返回</a></button>
			</center>
		</td>
    </tr>
</table>
</form>
	


<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
