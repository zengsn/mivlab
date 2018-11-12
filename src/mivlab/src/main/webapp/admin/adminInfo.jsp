<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		
		<link rel="stylesheet" href="<%=basePath%>assets/css/amazeui.css" />
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=basePath%>assets/css/core.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/menu.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/index.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/admin.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/page/typography.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/page/form.css" />
		
		
			
		<script type="text/javascript" src="<%=basePath%>js/jquery.min.js.下载"></script>
		<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js.下载"></script>
		<!-- 翻页-->
		<script type="text/javascript" src="<%=basePath %>js/syssmp.js"></script>
		<!-- 头部底部 -->
		<link rel="stylesheet" href="<%=basePath%>css/titleFooter.css" />
<script src="https://cdn.bootcss.com/angular.js/1.4.6/angular.min.js"></script>
<title>管理员个人信息</title>
<style>
	.box1{
		width:100%;
		padding:3% 10%;
		border-top:10px solid #eee;	 
	
		
	}	
	.btn{
		 background-color: #6274f8;
	    border: none;
	    color: white;
	    padding: 5px 10px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	    margin: 4px 2px;
	    cursor: pointer;
	    border-radius: 8px;
	   
	}
	p{
		text-align:center;
	}
/*表单*/
	.form{
		width:85%;
		margin-left:auto;
		margin-right:auto;
		padding:30px 50px;
		background:#f3f4fc;
		border-radius:25px;
		box-shadow: 5px 5px 2px #d9dbdc;
		
	}
	.hiddenli{
  display:none !important;
  
  }
  @media screen and (max-width: 640px) {
   .hiddenli{
  display:block !important;
  
  }
</style>

<script>


  
//检查是否知道原始密码
function ckOldPwd(e){
	var ckPwd=$("#pwd").val();
	var pwd=$("#oldPwd").val();
	if(pwd!=ckPwd){
		alert("与原密码不一致");
		return ;
	}			
};

function Submit(){

var num=$("#num").val();
var name=$("#name").val();		
var pwd=$("#pwd").val();	//初始密码对照值
var oldpwd=$("#oldPwd").val();
var newpwd=$("#newPwd").val();
var ckNewPwd=$("#ckNewPwd").val();
if(name=="" || oldpwd=="" || newpwd=="" || ckNewPwd==""){
	alert("请将信息填写完整");
	return ;
}
if(pwd==newpwd){
	alert("新密码不能与原密码相同");
	return ;			
}
var regx =/^(?!([a-zA-Z]+|\d+)$)[a-zA-Z\d]{6,20}$/;
if((newpwd.match(regx)==null) || newpwd.length<6  || newpwd.length>16){
	alert("新密码应含有字母、数字，且长度为6-16个字符");
	return ;
}
if(newpwd!=ckNewPwd){
	alert("新密码与确认密码不一致");
	return;
}
$.ajax({
	url:'<%=basePath %>UpdSvlt',
	type:'post',
	dataType:'json',
	data:{"tbname":"adminInfo","id":num,"name":name,"newpwd":newpwd},
	success:function(data){	
		if(data.msg=="修改成功"){
			alert("修改成功,请重新登录");
			//window.location.href="./login.jsp";
			window.parent.frames.location.href="<%=basePath %>/admin/login.jsp" 
		}else{
			alert("请重新提交");
		}
		
	}
});

};

</script>
<style> 
  .banner, .footer {
      background-color: ${other.bgColor};
     /* background-image:${other.imgPath};   */
      color: ${other.wordColor};     
    }
  
</style>

</head>
<body>	
	<header class="am-topbar am-topbar-fixed-top">	
			<!-- 顶部标题栏 -->
			<div class="banner" id="banner" >				        
		    	<div class="banner-title">${other.title }</div>        
			</div>	
			<div class="am-topbar-left am-hide-sm-only">
                <a href="index.html" class="logo"><span>Admin<span>to</span></span><i class="zmdi zmdi-layers"></i></a>
            </div>
	
			<div class="contain">
				<ul class="am-nav am-navbar-nav am-navbar-left">

					<li><h4 class="page-title">管理员基本信息</h4></li>
				</ul>
				
				
			</div>
		</header>
		<!-- end page -->
		
		
		<div class="admin">
			<!--<div class="am-g">-->
		<!-- ========== Left Sidebar Start ========== -->
		<!--<div class="left side-menu am-hide-sm-only am-u-md-1 am-padding-0">
			<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 548px;">
				<div class="sidebar-inner slimscrollleft" style="overflow: hidden; width: auto; height: 548px;">-->
                  <!-- sidebar start -->
				  <div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas">
				    <div class="am-offcanvas-bar admin-offcanvas-bar">
				    	<!-- User -->
						<div class="user-box am-hide-sm-only">
	                        <div class="user-img">
	                            <img src="<%=basePath%>assets/img/avatar-8.jpg" alt="user-img" title="${userinfo.name }" class="img-circle img-thumbnail img-responsive">
	                            <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
	                        </div>
	                        <h5>${userinfo.name } </h5>
	                        <ul class="list-inline">
	                            <li>
	                                <a href="<%=basePath %>InitSvlt?flgs=1&tbname=adminInfo" class="text-custom">
	                                    <i class="fa fa-cog" aria-hidden="true">设置</i>
	                                </a>
	                            </li>
								<li>
	                                <a href="<%=basePath %>admin/loginOut.jsp" class="text-custom">
	                                    <i class="fa fa-sign-out" aria-hidden="true">退出</i>
	                                </a>
	                            </li>
	
	                            
	                        </ul>
	                    </div>
	                    <!-- End User -->
	            
						<ul class="am-list admin-sidebar-list">
						    <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=homepage"><span class="am-icon-home"></span> 首页</a></li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-th-list"></span> 前端页面管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=title" class="am-cf"> 页面风格管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=fnav"> 一级标题管理</a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=snav"> 二级标题管理</a></li>
						      </ul>
						    </li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><i class="am-icon-th-list" aria-hidden="true"></i> 教学管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav2">
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacher" class="am-cf"> 教师信息管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=terms"> 学期信息管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=classinfo" class="am-cf"> 班级信息管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=students" class="am-cf"> 学生信息管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=course" class="am-cf"> 课程信息管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=courseplan" class="am-cf"> 课程安排</span></a></li>
						      </ul>
						    </li>
						    <li class="hiddenli"><a href="<%=basePath %>InitSvlt?flgs=1&tbname=adminInfo"> 个人设置</a></li>
					        
					        <li class="hiddenli"><a href="<%=basePath %>admin/loginOut.jsp"> 退出登录</a></li>
						    
						  </ul>
				</div>
				  </div>
				  <!-- sidebar end -->
    
				<!--</div>
			</div>
		</div>-->
		<!-- ========== Left Sidebar end ========== -->
		<!--	<div class="am-g">-->
		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="am-g">
					<!-- Row start -->
						<div class="am-u-sm-12">
							<div class="card-box">								
							<form >	
								  <input type='hidden' name='num' id="num" value="${userinfo.id}" >
								  <input type='hidden' name='pwd' id="pwd" value="${userinfo.password}" >
								  <p>  用&nbsp;&nbsp;户&nbsp;&nbsp;名：<input type='text' name='name' id="name" value="${userinfo.name}" > </p>
								  <p>  原始密码：<input type='password' name='oldPwd' id="oldPwd" onblur="ckOldPwd(this)"> </p>	  
								  <p>  新&nbsp;&nbsp;密&nbsp;&nbsp;码：<input type='password' name='newPwd'  id="newPwd" >  </p>	 
								  <p>  确认密码：<input type='password' name='ckNewPwd' id="ckNewPwd"  > </p>	 	 
								  <p style="text-align:center;"><input type='button' value='更新' onclick="Submit()">&nbsp;&nbsp;&nbsp;&nbsp;
								  </p>	    
							 </form>
																
							</div>
						</div>
					<!-- Row end -->			      
				
			    </div>  			
			   </div>	
			   <div class="am-g">
					<!-- 底部信息 -->
					<div class="footer">
					    <span class="school">建设单位：${other.footer_name}</span>
					    <span class="address">${other.footer_Addr }</span>
					</div>
			   </div>		
			</div>
			</div>
		<!-- end right Content here -->
		<!--</div>-->
		
		
		<!-- navbar -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
		
		<script type="text/javascript" src="<%=basePath%>assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="<%=basePath%>assets/js/amazeui.min.js"></script>
		<script type='application/javascript' src='<%=basePath%>assets/js/fastclick.js'></script>
		<script type="text/javascript" src="<%=basePath%>assets/js/app.js" ></script>
		<script type="text/javascript" src="<%=basePath%>assets/js/blockUI.js" ></script>
		


<script>
//上传logo
$(function () { 
	 $(".upload").click(function () { 
	  var formData = new FormData($('.fileForm')[0]); 
	 // alert(formData);
  $.ajax({ 
	  type: 'post', 
	  url: "LogoUpload",
	  dataType : 'json',
	  data: formData, 
	  cache: false, 
	  processData: false, 
	  contentType: false, 	 
	  success:function(data){		  		  
		  alert(data.msg);	
		  window.location.href="InitSvlt?tbname=indexshow";
		}			
	  })	 
	 }); 
});
//上传背景图片
$(function () { 
	 $(".uploadbg").click(function () { 
	  var formData = new FormData($('.fileFormbg')[0]); 
	 // alert(formData);
  $.ajax({ 
	  type: 'post', 
	  url: "BgImgUpload",
	  dataType : 'json',
	  data: formData, 
	  cache: false, 
	  processData: false, 
	  contentType: false, 	 
	  success:function(data){		  		  
		  alert(data.msg);	
		  window.location.href="InitSvlt?tbname=indexshow";
		}			
	  })	 
	 }); 
});
//移除背景图片
$(function(){
	$(".removebgimg").click(function(){
		
		$.ajax({ 
		url:'UpdSvlt',
		type:'post',
		dataType:'json',
		data:{"tbname":"indexshowimg"},
		success:function(data){			
			alert(data.msg);
		}	 
		}); 
	})
});

//绑定颜色
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope) {
    $scope.Tcolor = "${other.bgColor}";
    $scope.Fcolor = "${other.wordColor}";
});

//提交文字与颜色修改

function submit2(){
	var websiteTitle=$("#websiteTitle").val();
	var organization=$("#organization").val();
	var address=$("#address").val();
	var bgColorCode=$("#bgColorCode").val();
	var wordColorCode=$("#wordColorCode").val();
	//alert(websiteTitle+";"+organization+";"+address+";"+bgColorCode+";"+wordColorCode+";")
	$.ajax({
		url:'UpdSvlt',
		type:'post',
		dataType:'json',
		data:{"tbname":"indexshow","websiteTitle":websiteTitle,"organization":organization,"address":address,"bgColorCode":bgColorCode,"wordColorCode":wordColorCode},
		success:function(data){
			alert(data.msg);
			window.location.href="InitSvlt?tbname=indexshow";			
		}
	});
}


</script>	
</body>
</html>