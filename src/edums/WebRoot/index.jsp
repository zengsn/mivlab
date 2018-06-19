<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>移动互联网虚拟实验仿真教学平台</title>
	<link rel="stylesheet" href="css/default.css" />
	<!--[if (gte IE 9)|!(IE)]><!-->
	<script type="text/javascript" src="lib/jquery/jquery.min.js"></script>
	<!--<![endif]-->
	<!--[if lte IE 8 ]>
	<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
	<script src="lib/amazeui/amazeui.ie8polyfill.min.js"></script>
	<![endif]-->
	<script type="text/javascript" src="lib/handlebars/handlebars.min.js"></script>
	<script type="text/javascript" src="lib/iscroll/iscroll-probe.js"></script>
	<script type="text/javascript" src="lib/amazeui/amazeui.min.js"></script>
	<script type="text/javascript" src="lib/raty/jquery.raty.js"></script>
	<script type="text/javascript" src="js/main.min.js?t=1"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/easyui.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery.easyui.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#me li{
			margin-left: 0px;
			margin-right: 0px;
			padding-left: 0px;
			padding-left: 0px;
		}
		.dialog-init {
		    display: none;
		}
		.w-header::after {
			content: '';
			display: block;
			clear: both;
		}
		.hd {
			padding: 30px 0;
		}
		.hd-nav {
			margin-top: 0;
		}
		.footer, .hd {
			background: darkred;
			color: #fff;
		}
		
		.hd-nav {
			background: #fff;
		}
		
		.hd-nav .hd-navul li {
			padding: 1.2rem 1.8rem;
			padding-left: 1.8rem !important;
		}
		
		.hd-nav nav li a {
			color: black;
			text-shadow: none;
			font-size: 1.4rem;
		}
		
		#me li {
			text-align: center;
		}
		
		#me li:hover {
			background: #b3080a;
			color: #fff !important;
			text-shadow: none !important;
		}
		
		.hd-nav nav li:hover a {
			text-shadow: none;
			color: #fff;
		}
		
		.footer h2 span {
			color: #fff;
		}
		
		.cm-page li.on a, .cm-type li.on {
			background: #b3080a !important;
		}
		
		.cm-type li {
			border: none;
			background: #fff;
		}
		
		.cm-type li:hover {
			background: #d8d8d8;
			cursor: pointer;
			color: red;
		}
		
	</style>
	<script type="text/javascript">
		function lgbt(){
			$(".dialog-init").css("display","block");
			$("#dlg").dialog('open');
		}
		function lgtj(){
			var uname=$("#uname").textbox('getValue');
			var upassword=$("#upassword").textbox('getValue');
			var utype=$("#utype").combobox('getValue');
			if(uname==""||upassword==""){
				alert("请输入账号和密码");
				return;
			}
			$.ajax({
				url:'LoginSvlt',
				type:'post',
				data:{"uname":uname,"upassword":upassword,"utype":utype},
				dataType:'json',
				success:function(data){
					if(data.msg==1){
						window.location.href="<%=basePath%>admin/main.jsp";
					}else{
						alert(data.msg);
					}
				}
			});
		}
		function showmenu(id){
			$.ajax({
				url:'GetttSvlt',
				type:'post',
				dataType:'json',
				data:{"id":id},
				success:function(data){
					var oti=data.ot;
					var tlist=oti.ttlist;
					var html="<li class=\"on\"><a href=\"#\" onclick=\"return false;\">"+oti.otname+"</a></li>";					
					$("#con").html("");
					$(tlist).each(function(i,t){
						html+="<li><a href=\"javascript:void(0);\" onclick=\"showcon('"+t.id+"');return false;\">"+t.ttname+"</a></li>";
						if(i==0){
							$("#con").html(t.ttmark);
						}
					});
					$("#menulist").html(html);
				}
			});
			
		}
		function showcon(id){
			$.ajax({
				url:'GettSvlt',
				type:'post',
				dataType:'json',
				data:{"id":id},
				success:function(data){
					$("#con").html(data.tt.ttmark);
				}
			});
		}
		$(function(){
			$("#dlg").dialog('close');
		});
	</script>
  </head>
  
  <body>
    ﻿<header class="hd">
    <div class="cml-g w-header">
        <div style="padding-top: 20px;display: block">
            <div>
                <a href="SyInitSvlt">
                    <img height="104" width="291" src="http://www.hzu.edu.cn/_upload/site/00/03/3/logo.png" />
                </a>
            </div>
            <div class="hd-company">
                <span style="padding-left: 70px; font-family: "Helvetica Neue",Helvetica,Arial,sans-serif; line-height: 1.42857143; font-size: 24px;">移动互联网虚拟实验仿真教学中心</span>
            </div>   
        </div>
    </div>
</header>

<div class="hd-nav">
    <button class="am-show-sm-only am-collapsed" data-am-collapse="{target: '.hd-navul'}">&#xe68b;</button>
    <nav>
        <ul id="me" class="hd-navul am-collapse" style="height: 0px;">
     		<c:forEach varStatus="index" var="a" items="${alist }">
	     		<li><a href="javascript:void(0);" onclick="showmenu('${a.id}');">${a.otname }</a></li>
     		</c:forEach>
     		<li><a href="javascript:void(0);" onclick="lgbt();return false;">平台入口</a></li>
        </ul>
    </nav>
</div>
    <div class="cm-mian">
        <div class="cml-g">
            <div class="am-u-sm-3 am-u-md-3 am-u-lg-3">
                <div class="cm-type">
                    <ul id="menulist">
                	<c:forEach varStatus="st" var="a" items="${alist }">
                		<c:if test="${st.index==0 }">
	                        <li class="on"><a href="#" onclick="return false;">${a.otname }</a></li>
	                        <c:forEach var="aa" items="${a.ttlist }">
		                        <li><a href="javascript:void(0);" onclick="showcon('${aa.id}');return false;">${aa.ttname }</a></li>
	                        </c:forEach>
                		</c:if>
                	</c:forEach>
                    </ul>
                </div>
            </div>
            <div class="am-u-sm-9 am-u-md-9 am-u-lg-9">
                   <div class="cm-article">
                       <div id="con" class="cm-new-list cm-content" style="min-height: 400px;">
	                  	<c:forEach var="a" items="${alist }">
	                  		<c:forEach varStatus="st" var="aa" items="${a.ttlist }">
	                  			<c:if test="${st.index==0 }">
	                         ${aa.ttmark }
	                  			</c:if>
	                  		</c:forEach>
	                  	</c:forEach>
                       </div>
                   </div>
            </div>
        </div>
		<div id="dlg" class="easyui-dialog dialog-init" title="平台入口"  style="width:100%;max-width:400px;padding:30px 60px;">
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="uname" name="uname" label="账 号：" style="width:100%;height:30px;font-size: 14px;" data-options="prompt:'输入账号',iconCls:'icon-man',iconWidth:28">
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-passwordbox" id="upassword" name="upassword" label="密 码：" style="width:100%;height:30px;font-size: 14px;" data-options="prompt:'输入密码',iconCls:'icon-lock',iconWidth:28">
			</div>	
			<div style="margin-bottom:10px;">
				<select class="easyui-combobox" id="utype" name="utype" label="角 色：" style="width:100%;height:30px;font-size: 14px;">
					<option value="gly">管理员</option>
					<option value="tea">教师</option>
					<option value="stu">学生</option>
				</select>
			</div>		
			<div>
				<a href="#" onclick="lgtj();return false;" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:100%;">
					<span style="font-size:18px;">登&nbsp;&nbsp;录</span>
				</a>
			</div>
		</div>
    </div>
    ﻿<footer class="footer">
    <div class="cml-g">
        <h2>
            <span>建设单位</span>
            <span>惠州学院</span>
            <span>惠州市惠城区演达大道46号</span>
        </h2>
    </div>
	</footer>
  </body>
</html>
