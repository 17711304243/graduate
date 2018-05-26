<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>注册 - 就诊系统</title>
    <link rel="stylesheet" type="text/css" href="css/register-login.css">
    <style>
        #username,#realname,#number,#newsex,#one,#two{
            padding: 1em .8em;
            width: 100%;
            box-sizing: border-box;
            border: 0;
            border-radius: 0;
            box-shadow: none;
            background: rgba(255,255,255,0.5);
            font-family: 'Microsoft Yahei';
            color: #666;
            position: relative;
        }
        #register{
            width: 100%;
            background: #0f88eb;
            box-shadow: none;
            border: 0;
            border-radius: 3px;
            line-height: 41px;
            color: #fff;
            display: block;
            font-size: 15px;
            cursor: pointer;
            font-family: 'Microsoft Yahei';
        }
    </style>


</head>
<body>
<div id="box"></div>
<div class="cent-box register-box">
    <div class="cent-box-header">

        <br><br><br>
        <class="sub-title"><h1>您好，请注册</h1>
    </div>

    <div class="cont-main clearfix">
        <div class="index-tab">
            <div class="index-slide-nav">
                <a href="login.jsp">登录</a>
                <a href="sign.jsp">注册</a>
                <div class="slide-bar slide-bar1"></div>
            </div>
        </div>

        <form action="../../user/Sign.do" method="post" id="form1">

            <div id='name' class='outerDiv'>

                <label for="name">用户名:</label>
                <input id="username" type="text"  placeholder="请输入您的用户名" name="username" style="font-size:12px;width:81% "  />
                <span id="namespan" style="width:120px;margin:0 20px;font-size:12px;height:39px;line-height:30px;"></span>

            </div>
            <div class='clearfix'></div>
            <div  class='outerDiv'>
                <label for="number">姓名:</label>
                <input type="text" id="realname" name="name"  placeholder="请输入您姓名" style="font-size:12px;width:87%"/>

            </div>
            <div class='clearfix'></div>

            <div id='age' class='outerDiv'>
                <label for="age">年龄:</label>
                <input type="text"id="number" name="age"  placeholder="请输入1-3位数字" style="font-size:12px;width:87%"/>
            </div>
            <div class='clearfix'></div>

            <div id='sex' class='outerDiv'>
                <label for="sex">性别:</label>
                <input type="text" id="newsex" name="sex"  placeholder="请输入男或女" style="font-size:12px;width:87%"/>
            </div>
            <div class='clearfix'></div>

            <div id='password' class='outerDiv'>
                <label for="password">密码:</label>
                <input type="password" name="onepassword" id="one" placeholder="请输入6-10位数字，字母组合密码" style="font-size:12px;width:87%" />
            </div>
            <div class='clearfix'></div>

            <div id='password' class='outerDiv'>
                <label for="password">确认密码:</label>
                <input type="password" name="twopassword" id="two" placeholder="请确认您输入的密码" style="font-size:12px;width:77%" />
                <span id="pwdspan" style="width:120px;margin:0 20px;font-size:12px;height:39px;line-height:30px;"></span>
            </div>
            <div class='clearfix'></div>
            <div id='submit' class='outerDiv'>
                <input type="submit"id="register" value="立即注册" />
            </div>
            
            <label class="forgot-password">
			<a href="../../index.jsp">返回主页？</a>
			</label>
            <div class='clearfix'></div>
        </form>
        <script type="text/javascript">
            window.onload=function(){
                document.getElementById("username").onblur=function(){
                    var xhr = createXmlHttpRequest();
                    xhr.onreadystatechange=function(){
                        if(xhr.readyState==4){
                            if(xhr.status==200||xhr.status==304){
                                var data = xhr.responseText;
                                document.getElementById("namespan").innerHTML=data;
                            }
                        }
                    }
                    xhr.open("POST","../../user/ajaxSign.do?time="+new Date().getTime());

                    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");

                    var username = document.getElementById("username").value;
                    /* 	alert("该用户名已被注册");
                     location.reload(); */
                    xhr.send("username="+username);
                }
            }
            document.getElementById("two").onblur=function(){
                
                var one = document.getElementById("one").value;
                var two = document.getElementById("two").value;
                if(one!==two)
                {
                    document.getElementById("pwdspan").innerHTML="两次输入的密码不一致";
                    alert("密码输入不一致");
                    location.reload();

                }
                else{document.getElementById("pwdspan").innerHTML="ok";}
                alert("注册成功，请登陆");

            }
            function createXmlHttpRequest(){
                var xmlHttp;
                try{    //Firefox, Opera 8.0+, Safari
                    xmlHttp=new XMLHttpRequest();
                }catch (e){
                    try{    //Internet Explorer
                        xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
                    }catch (e){
                        try{
                            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                        }catch (e){}
                    }
                }
                return xmlHttp;
            }
        </script>
        <script type="text/javascript">

        </script>
        <div class="clearfix"></div>
    </div>
</div>
<br>




<div class="footer">
    <p style="font-weight:bold;font-size:14px;">Copyright &copy; 2018.6 from 中医专家系统 All rights reserved. </p>
</div>
<script src='js/particles.js' type="text/javascript"></script>
<script src='js/background.js' type="text/javascript"></script>
<script src='js/jquery.min.js' type="text/javascript"></script>
<script src='js/layer/layer.js' type="text/javascript"></script>
<script src='js/index.js' type="text/javascript"></script>
</body>
</html>