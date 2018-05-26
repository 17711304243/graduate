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
<title>处方信息</title>
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
    
 
   
</head>
<body>

	<form action="" method="post"  class="definewidth m20">
<table class="table table-bordered table-hover definewidth m10">

 <tr>
        <td width="10%" class="tableleft">患者姓名</td>
        <td><input type="text" value="${rec.rname}" readonly="readonly"/></td>
        
    </tr>    
    <tr>
          <td width="10%"  class="tableleft">病情概述</td>
           
           <td>
           <textarea   value="${rec.rdesc}" readonly="readonly" rows="13" >${rec.rdesc}</textarea>
           </td>
           
    </tr>
    <tr>
          <td width="10%"  class="tableleft">中医辩证</td>
         
           <td>
           <textarea  value="${rec.rview}" readonly="readonly" rows="13" >${rec.rview}</textarea>
           </td>
         
    </tr> 
    <tr>
          <td width="10%"  class="tableleft">处方信息</td>
           
           <td>
           <textarea  value="${rec.rpresc}" readonly="readonly" rows="13" >${rec.rpresc}</textarea>
           </td>
    </tr>
     <tr>
          <td width="10%"  class="tableleft">治疗结果</td>

           <td>
           <textarea  value="${rec.rcure}" readonly="readonly" rows="10" >${rec.rcure}</textarea>
           </td>
    </tr>

  <tr>
        <td colspan="2">
			<center>
			    <button type="button" class="btn btn-success" id="delP" onclick="javascript:window.print()">打印</button>
				<button type="button" class="btn btn-success" ><a href="javascript:history.back(-1)">返回</a></button>
			</center>
		</td>
    </tr>
</table>
</form>
	


<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
