<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8" />
<title>中医专家诊断系统</title>

<link rel="stylesheet" type="text/css" href="page/main/css/lib.css" />

<link rel="stylesheet" type="text/css" href="page/main/css/style1.css" />

<link rel="stylesheet" type="text/css" href="page/main/css/999.css" />

<script type="text/javascript" src="page/main/js/jquery-1.11.3.min.js"></script>

<script type="text/javascript" src="page/main/js/org1470120033.js" data-main="indexMain"></script>

<script type="text/javascript">if(window.location.toString().indexOf('pref=padindex') != -1){}else{if(/AppleWebKit.*Mobile/i.test(navigator.userAgent) || (/MIDP|SymbianOS|NOKIA|SAMSUNG|LG|NEC|TCL|Alcatel|BIRD|DBTEL|Dopod|PHILIPS|HAIER|LENOVO|MOT-|Nokia|SonyEricsson|SIE-|Amoi|ZTE/.test(navigator.userAgent))){if(window.location.href.indexOf("?mobile")<0){try{if(/Android|Windows Phone|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)){window.location.href="/m/index.php";}else if(/iPad/i.test(navigator.userAgent)){}else{}}catch(e){}}}}</script>

<script>

       window.onload=function (){

		   var aId = document.getElementById('newslist')

           var aLi=aId.getElementsByTagName('li');

           for(var i=0;i<aLi.length;i++){

               if(i%2==0){

                   // 0/2余数0  1/2余数1 2/2余数0 3/2余数1

                  aLi[i].className='wow newstitem right' //增加CSS名

               }

               else{

                   aLi[i].className='wow newstitem left' //增加CSS名

               }

           }

       }    

    </script>

</head>

<body>

<div id="header">

  <div class="content"> <h1 id="logo"><a href="page/main/login.jsp"><font color="#7373B9">您好，请先登录</a></h2></font>

    <ul id="nav">

      <li class="navitem"><a  class='active' href="index.jsp">首页</a></li>

      <li class="navitem"><a>产品中心</a>

        <ul class="subnav">

          <li><a href="page/main/homeqt.jsp">家用医疗设备</a></li>

          <li><a href="page/main/homeqt.jsp">专业医疗仪器</a></li>

        </ul>

      </li><li class="navitem"><a  href="page/main/time.jsp" >中医特色</a>

        <ul class="subnav">
          
        </ul>

      </li><li class="navitem"><a>系统简介</a>

        <ul class="subnav">
          
          <li><a href="page/main/introd.jsp">专家系统</a></li>
         
          <li><a href="page/main/introd.jsp">发展历程</a></li>
         
        </ul>

      </li><li class="navitem"><a  href="page/main/team.jsp" >医师团队</a>

        <ul class="subnav">
         
        </ul>

      </li><li class="navitem"><a  href="page/main/news.jsp" >新闻动态</a>

      </li><li class="navitem"><a  href="http://wpa.qq.com/msgrd?v=3&uin=1446653159&site=qq&menu=yes" target="_blank" >在线咨询</a>
      </li><li class="navitem"><a  href="page/main/contact.jsp" >关于我们</a>

        <ul class="subnav">

        </ul>

      </li>

    </ul>

    <div class="clear"></div>

  </div>

  <a id="headSHBtn" href="javascript:;"><i class="fa fa-bars"></i></a> 
</div>

<div id="sitecontent">

  <div id="indexPage">

    <div id="mslider" class="module"> 

      <script type="text/javascript">$(function(){$("#mslider li video").each(function(index, element) {element.play();});})</script>

      <ul class="slider" data-options-height="660" data-options-auto="1" data-options-mode="0" data-options-pause="6" data-options-ease="ease-out">

        <li style="background-image:url(page/main/images/m2.jpg)" class="active"></li>

<li style="background-image:url(page/main/images/m4.jpg)" class="active"></li>

      </ul>

    </div>

    <div id="mindex" data-options-ease="Expo.easeInOut" data-options-speed="1" data-options-sscreen="0"></div>

    <div id="mservice" class="module">

      <div class="bgmask"></div>

      <div class="content layoutnone">

        <div class="header wow fw" data-wow-delay=".1s">

          <p class="title">医疗特色</p>

          <p class="subtitle"></p>

        </div>

        <div class="module-content fw" id="servicelist">

          <div class="wrapper">

            <ul class="content_list" data-options-sliders="3" data-options-margin="10" data-options-ease="1" data-options-speed="1">

              <li id="serviceitem_0" class="serviceitem wow"><a href="page/main/time.jsp" target="_blank"><img src="page/main/images/1-1F5041F041314.png" height="120" />

                <div>

                  <p class="title">中医疗法</p>

                  <p class="description">最新的中医疗法和技术...</p>

                </div>

                </a> <a href="page/main/time.jsp" target="_blank" class="details">more<i class="fa fa-angle-right"></i></a> </li>

<li id="serviceitem_1" class="serviceitem wow"><a href="page/main/time.jsp" target="_blank"><img src="page/main/images/1-1F5041AP10-L.png" height="120" />

                <div>

                  <p class="title">中医专家门诊</p>

                  <p class="description">专家门诊排班表...</p>

                </div>

                </a> <a href="page/main/time.jsp" target="_blank" class="details">more<i class="fa fa-angle-right"></i></a> </li>

<li id="serviceitem_2" class="serviceitem wow"><a href="page/main/time.jsp" target="_blank"><img src="page/main/images/1-1F5041AA20-L.png" height="120" />

                <div>

                  <p class="title">中医药材</p>

                  <p class="description">常见中药功效及作用...</p>

                </div>

                </a> <a href="page/main/time.jsp" target="_blank" class="details">more<i class="fa fa-angle-right"></i></a> </li>
            </ul>

          </div>

        </div>

        <div class="clear"></div>

        <!--<!--<a href="/" class="more wow">MORE<i class="fa fa-angle-right"></i></a>--> </div>

    </div>
    <!--project-->

    <div id="mteam" class="module">

      <div class="bgmask"></div>

      <div class="content layoutslider">

        <div class="header wow">

          <p class="title">医师团队</p>

          <p class="subtitle"></p>

        </div>

        <div class="module-content fw">

          <div class="wrapper">

            <ul class="content_list" data-options-sliders="1" data-options-margin="40" data-options-ease="1" data-options-speed="0.5">

              <li id="teamitem_0" class="wow">

                <div class="header wow" data-wow-delay=".4s"> <a href="page/main/team.jsp" target="_blank"><img src="page/main/images/d4.png" width="180" height="180" /></a> </div>

                <div class="summary wow">

                  <p class="title"><a href="page/main/team.jsp">郭佼</a></p>

                  <p class="subtitle"></p>

                  <p class="description wow">郭佼，北京中医药大学硕士，师从著名肿瘤专家王笑民教授，主攻肿瘤及其并发症调治。曾于北京中医医院参加住院医师规范化培训三年，系统学习各科常见病诊疗技术。</p>

                </div>

                <a href="page/main/team.jsp" target="_blank" class="details"><font size="4" color="white">more</font><i class="fa fa-angle-right"></i></a> </li>

<li id="teamitem_1" class="wow">

                <div class="header wow" data-wow-delay=".4s"> <a href="page/main/team.jsp" target="_blank"><img src="page/main/images/1-1F5041Z0100-L.png" width="180" height="180" /></a> </div>

                <div class="summary wow">

                  <p class="title"><a href="team.jsp">肖钦文</a></p>

                  <p class="subtitle"></p>

                  <p class="description wow">成都中医药大学博士，师从四川省名中医何成诗教授，攻读中西医结合临床专业（呼吸系统方向），本科及硕士毕业于北京中医药大学中医临床七年制（中医儿科学方向），师从国家级名老中医徐荣谦教授，并担任中华小儿推拿国际联合会“徐氏摩按法”分会委员。</p>

                </div>

                <a href="page/main/team.jsp" target="_blank" class="details"><font size="4" color="white">more</font><i class="fa fa-angle-right"></i></a> </li>

<li id="teamitem_2" class="wow">

                <div class="header wow" data-wow-delay=".4s"> <a href="page/main/team.jsp" target="_blank"><img src="page/main/images/1-1F5041301570-L.png" width="180" height="180" /></a> </div>

                <div class="summary wow">

                  <p class="title"><a href="page/main/team.jsp">胡定邦</a></p>

                  <p class="subtitle"></p>

                  <p class="description wow">国第一批师承人员，享受国务院政府津贴。在临床上采取辨证、辨病、辨药、辨体质的四辨方法。尤其对各种炎症、痛症、过敏性疾病有自己的独特见解。</p>

                </div>

               <!--  <a href="page/main/team.jsp" target="_blank" class="details"><font size="4" color="white">more</font><i class="fa fa-angle-right"></i></a> </li>

<li id="teamitem_3" class="wow">

                <div class="header wow" data-wow-delay=".4s"> <a href="page/main/team.jsp" target="_blank"><img src="page/main/images/1-1F5041253290-L.png" width="180" height="180" /></a> </div>

                <div class="summary wow">

                  <p class="title"><a href="page/main/team.jsp">赵欣</a></p>

                  <p class="subtitle"></p>

                  <p class="description wow">擅长于治疗乳腺疾病和妇科疾病。针对女性生理特点,辩证与辨病相结合,“肝、脾、肾”三脏同调,对于月经不调、痛经、经前综合证、围绝经期综合症、慢性盆腔炎、带下病等。</p>

                </div>

                <a href="page/main/team.jsp" target="_blank" class="details"><font size="4" color="white">more</font><i class="fa fa-angle-right"></i></a> </li>

            </ul> -->

          </div>

        </div>

        <div class="clear"></div>

        </div>

    </div>

    <div id="mnews" class="module">

      <div class="bgmask"></div>

      <div class="content layoutnone">

        <div class="header wow">

          <p class="title">新闻动态</p>

          <p class="subtitle">News Center</p>

        </div>

        <div class="module-content" id="newslist">

          <div class="wrapper">

            <ul class="content_list" data-options-sliders="3" data-options-margin="40" data-options-ease="1" data-options-speed="0.5" data-options-mode="horizontal" data-options-wheel="0">

              <li id="newsitem_0" class='wow newstitem left'><a class="newscontent" target="_blank" href="page/main/news.jsp">

                <div class="news_wrapper">

                  <div class="newsbody">

                    <p class="date"><span class="md">2018<span>-</span></span><span class="year">02-04</span></p>

                    <p class="title">传承中医中药文化，要从娃娃抓起</p>

                    <div class="separator"></div>

                    <p class="description">全国人大代表、湖南时代阳光药业股份有限公司执行董事唐纯玉认为，实施健康中国战略，对于中华瑰宝中医中药的传承和发展，应该从娃娃抓起，让孩子们在接受教育时就了解祖国中医中药的博大精深。</p>

                  </div>

                </div>

                <div class="newsimg" style="background-image:url(page/main/images/1-1F504192020423.jpg)"></div>

                </a> <a href="page/main/news.jsp" target="_blank" class="details">more<i class="fa fa-angle-right"></i></a> </li>

<li id="newsitem_1" class='wow newstitem left'><a class="newscontent" target="_blank" href="page/main/news.jsp">

                <div class="news_wrapper">

                  <div class="newsbody">

                    <p class="date"><span class="md">2018<span>-</span></span><span class="year">03-03</span></p>

                    <p class="title">中医药是精准医疗，发展离不开“药和医”</p>

                    <div class="separator"></div>

                    <p class="description">中医中药是最符合当前精准医疗概念的，以感冒为例，中医将之区分为风寒感冒、风热感冒，还会考虑到个人的体质差异，由此中医给出的治疗方案因人而异、各不相同的。</p>

                  </div>

                </div>

                <div class="newsimg" style="background-image:url(page/main/images/1-1F504191949109.jpg)"></div>

                </a> <a href="page/main/news.jsp" target="_blank" class="details">more<i class="fa fa-angle-right"></i></a> </li>

<li id="newsitem_2" class='wow newstitem left'><a class="newscontent" target="_blank" href="page/main/news.jsp">

                <div class="news_wrapper">

                  <div class="newsbody">

                    <p class="date"><span class="md">2018<span>-</span></span><span class="year">03-23</span></p>

                    <p class="title">坚持科学规范标准种植，提高中药药品质量</p>

                    <div class="separator"></div>

                    <p class="description">因为农药残留超标，有部分药品面临出口困难，中医药要解决好这一问题，实现高质量发展，一定要在中药的种植、炮制、创新等各个方面严格要求，政府要依法管理，保证源头无污染。</p>

                  </div>

                </div>

                <div class="newsimg" style="background-image:url(page/main/images/1-1F504191PS16.jpg)"></div>

                </a> <a href="page/main/news.jsp" target="_blank" class="details">more<i class="fa fa-angle-right"></i></a> </li>

            </ul>

          </div>

        </div>

        <div class="clear"></div>

        <a href="page/main/news.jsp" class="more wow">MORE<i class="fa fa-angle-right"></i></a>

        <div style="height:0"> &nbsp; </div>

      </div>

    </div>
<!-- 
    <div id="mpage" class="module">

      <div class="bgmask"></div>

      <div class="content">

        <div class="module-content">

          <div class="wrapper">

            <ul class="slider one">

              <li>

                <div class="header wow" data-wow-delay=".2s">

                  <p class="title">系统简介</p>

                  <p class="subtitle"></p>

                </div>

                <div class="des-wrap">

                  <p class="description wow" data-wow-delay=".3s">专家系统主要目的是要使计算机在各个领域中起人类专家的作用。它是一种智能程序子系统，内部具有大量中医的知识。它是一种计算机程序，可以帮助医生完成对病人的诊断，并与这个问题所特有的大量实际知识和经验知识结合起来。</p>

                </div>

                <a href="page/main/introd.jsp" class="more wow" data-wow-delay=".5s">MORE<i class="fa fa-angle-right"></i></a>

                <div class="fimg wow" style="background-image:url(page/main/images/jianjie.png)"></div>

              </li>

            </ul>

          </div>

        </div>

      </div>

    </div> -->

    <div id="mcontact" class="module">

      <div class="bgmask"></div>

      <div class="content">

        <div class="header wow fadeInUp fw" data-wow-delay=".1s">

          <p class="title">联系我们</p>

          <p class="subtitle">Contact us</p>
  
        </div>

        <div id="contactlist" class="fw">
          <div id="contactinfo" class="fl wow" data-wow-delay=".2s">
          
            <p class="ellipsis add"><span>地址：</span>四川省成都市</p>

            <p class="ellipsis tel"><span>电话：</span>4008-8823-888</p>

            <p class="ellipsis fax"><span>Q Q：</span>23324324334</p>

            <p class="ellipsis email"><span>邮箱：</span>23423432432@qq.com</p>             
		</div> 

          </div>
        </div>
      </div>
      	
    </div>
  </div>
 <p style="font-weight:bold;font-size:14px;text-align:center">Copyright &copy; 2018.6 from 中医专家系统 All rights reserved. </p>
</body>

</html>