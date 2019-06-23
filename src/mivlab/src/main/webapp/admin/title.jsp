<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%	request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="<%=basePath%>">
	
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Language" content="en" />
    <meta name="msapplication-TileColor" content="#2d89ef">
    <meta name="theme-color" content="#4188c9">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <link rel="icon" href="./favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" type="image/x-icon" href="./favicon.ico" />
    <!-- Generated: 2018-04-06 16:27:42 +0200 -->
    <title>基于GitHub的教学管理系统——页面风格管理</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!--    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext"> --> 
    <script src="<%=basePath%>assets/js/require.min.js"></script>
   
    <!-- Dashboard Core -->
    <link href="<%=basePath%>assets/css/dashboard.css" rel="stylesheet" />
    <script src="<%=basePath%>assets/js/dashboard.js"></script>
    <!-- c3.js Charts Plugin -->
    <link href="<%=basePath%>assets/plugins/charts-c3/plugin.css" rel="stylesheet" />
    <script src="<%=basePath%>assets/plugins/charts-c3/plugin.js"></script>
    <!-- Google Maps Plugin -->
    <link href="<%=basePath%>assets/plugins/maps-google/plugin.css" rel="stylesheet" />
    <script src="<%=basePath%>assets/plugins/maps-google/plugin.js"></script>
    <!-- Input Mask Plugin -->
    <script src="<%=basePath%>assets/plugins/input-mask/plugin.js"></script>
    <!-- angular.js -->
    <script src="https://cdn.bootcss.com/angular.js/1.4.6/angular.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
   
</head>
<body class="">
<div class="page">
      <div class="page-main">
        <div class="header py-4">
          <div class="container">
            <div class="d-flex">
              <a class="header-brand" href="<%=basePath %>InitSvlt?flgs=1&tbname=homepage">
                <img src="${other.logoPath }" class="header-brand-img" alt="tabler logo">
                <!-- 惠州学院logo -->
                <span class="other_title">${other.title }</span>
              </a>
              <div class="d-flex order-lg-2 ml-auto">
                <div class="nav-item d-none d-md-flex">
                  <a href="" class="btn btn-sm btn-outline-primary" target="_blank">前端主页</a>
                  <!-- 点击前往前端主页面 -->
                </div>
               
                <div class="dropdown">
                  <a href="#" class="nav-link pr-0 leading-none" data-toggle="dropdown">
                    <span class="avatar" style="background-image: url(./images/avatar-8.jpg)"></span>
                    <span class="ml-2 d-none d-lg-block">
                      <span class="text-default">${userinfo.name }</span><!-- 用户名 -->
                      <small class="text-muted d-block mt-1">Administrator</small><!-- 用户身份 -->
                    </span>
                  </a>
                  <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                    
                    <a class="dropdown-item" href="<%=basePath %>InitSvlt?flgs=1&tbname=adminInfo">
                      <i class="dropdown-icon fe fe-settings"></i> 设 置
                    </a>
                    
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="<%=basePath %>teacher/help.html" target="_blank">
                      <i class="dropdown-icon fe fe-help-circle"></i> 帮 助
                    </a>
                    <a class="dropdown-item" href="<%=basePath %>loginOut.jsp">
                      <i class="dropdown-icon fe fe-log-out"></i> 退 出
                    </a>
                  </div>
                </div>
              </div>
              <a href="#" class="header-toggler d-lg-none ml-3 ml-lg-0" data-toggle="collapse" data-target="#headerMenuCollapse">
                <span class="header-toggler-icon"></span>
              </a>
            </div>
          </div>
        </div>
        <div class="header collapse d-lg-flex p-0" id="headerMenuCollapse">
          <div class="container">
            <div class="row align-items-center">
             
              <!-- 导航栏 start -->
              <div class="col-lg order-lg-first">
                <ul class="nav nav-tabs border-0 flex-column flex-lg-row">
                  <li class="nav-item">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=homepage" class="nav-link active"><i class="fe fe-home"></i> 首页</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=title" class="nav-link"><i class="fe fe-file"></i> 页面风格管理</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=fnav" class="nav-link"><i class="fe fe-file"></i> 一级标题管理</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=snav" class="nav-link"><i class="fe fe-file"></i> 二级标题管理</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=courseplan" class="nav-link"><i class="fe fe-file"></i> 课程安排</a>
                  </li>
                 
                  <li class="nav-item ">
                    <a href="javascript:void(0)" class="nav-link" data-toggle="dropdown"><i class="fe fe-box"></i> 教学管理</a>
                    <div class="dropdown-menu dropdown-menu-arrow">
                      <a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacher" class="dropdown-item "> 教师信息管理</a>
                      <a href="<%=basePath %>InitSvlt?flgs=1&tbname=terms" class="dropdown-item "> 学期信息管理</a>
                      <a href="<%=basePath %>InitSvlt?flgs=1&tbname=classinfo" class="dropdown-item "> 班级信息管理</a>
                      <a href="<%=basePath %>InitSvlt?flgs=1&tbname=students" class="dropdown-item "> 学生信息管理</a>
                      <a href="<%=basePath %>InitSvlt?flgs=1&tbname=course" class="dropdown-item "> 课程信息管理</a>                     
                    </div>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="javascript:void(0)" class="nav-link" data-toggle="dropdown"><i class="fe fe-box"></i> GitHub实验管理</a>
                    <div class="dropdown-menu dropdown-menu-arrow">
                      <a href="<%=basePath %>InitSvlt?flgs=1&tbname=allshiyan" class="dropdown-item "> 教师实验记录</a>
                      <a href="<%=basePath %>InitSvlt?flgs=1&tbname=adminstutask" class="dropdown-item "> 学生提交实验记录</a>
                      <a href="<%=basePath %>InitSvlt?flgs=1&tbname=allGitDate" class="dropdown-item "> 统计GitHub实验信息</a>
                      <a href="<%=basePath %>InitSvlt?flgs=1&tbname=allGitmana" class="dropdown-item ">GitHub实验信息管理</a>
                      <a href="<%=basePath %>InitSvlt?flgs=1&tbname=gitRawdate" class="dropdown-item "> 原始实验数据</a>
                    </div>
                  </li>
                  
                </ul>
              </div>
              <!-- 导航栏 end -->
            </div>
          </div>
        </div>
        <div class="my-3 my-md-5">
          <div class="container">
            <div class="row row-cards">
              <div class="col-12 card">              
                  <div class="page-header">
		              <h1 class="page-title">
		                	页面风格管理
		              </h1>
		          </div>
                  <div class="card-body">
                    <div class="row ">
                      <div class="col-md-6 col-lg-12 card">
                      	<div class="card-header">
		                    <h3 class="card-title"></h3>
		                </div>
                        <div class="card-body">
		                   <div class="form-label">选择LOGO</div>
	                        <div class="custom-file">
	                          <form class="fileForm"  enctype="multipart/form-data" >
	                          <input type="file" class="custom-file-input" name="uploadFile">
	                          <label class="custom-file-label">格式为：290*80px.png</label>
	                          </form>
	                        </div>
	                        <div class="form-footer text-right">
			                      <button class="btn btn-primary ml-auto upload"   >更  新</button>
			                </div>
                       </div>
                       <div class="card-body">
		                   <div class="form-label">选择背景图片</div>
	                        <div class="custom-file">
	                          <form class="fileFormbg"  enctype="multipart/form-data" >
	                          <input type="file" class="custom-file-input" name="uploadFile" >
	                          <label class="custom-file-label">格式为：1680*1050px.jpg</label>
	                          </form>
	                        </div>
	                        <div class="form-footer text-right  ">
	                        	  <button class="btn btn-primary removebgimg"  >移除原有背景</button>
			                      <button class="btn btn-primary ml-auto uploadbg"  >更  新</button>
		
			                </div>
                       </div>
        			 </div>
        			  <div class="col-md-6 col-lg-12 card">
                        	                  
			            <div class="card-body">
			            	<form class="am-form" ng-app="myApp" ng-controller="myCtrl">		                   			                  	
		                    <fieldset class="form-fieldset">
		                    	
		                        <div class="form-group">
		                          <label class="form-label"> 站名</label>
		                          <input type="text" name='websiteTitle' id="websiteTitle" min="0" max="120" value="${other.title }"  class="form-control" />
		                        </div>
		                        <div class="form-group">
		                          <label class="form-label">建设单位</label>
		                          <input type='text' name='organization' id="organization" size="50" value="${other.footer_name }" class="form-control" />
		                        </div>
		                        <div class="form-group">
		                          <label class="form-label">单位地址</label>
		                          <input type='text' name='address' id="address"  size="50" value="${other.footer_Addr }"  class="form-control" />
		                        </div>
		                        <div class="form-group mb-0">
		                          <label class="form-label">背景颜色</label>
		                          <input type='text' name='bgColorCode' id="bgColorCode" value={{Tcolor}} class="form-control" />
		                          <input  type="color"   ng-model="Tcolor" style="height:50px;width:50px;">
		                        </div>
		                        <div class="form-group mb-0">
		                          <label class="form-label">文字颜色</label>
		                          <input type='text' name='wordColorCode' id="wordColorCode" value={{Fcolor}} class="form-control" />
		                          <input  type="color"  ng-model="Fcolor"  style="height:50px;width:50px;">
		                        </div>
		                        <div class="form-footer">
			                      <button class="btn btn-primary btn-block" onclick="submit2()">更  新</button>
			                    </div>		                        
		                      </fieldset>
		                    </form>			
		                  </div>
		                </div>  
        			  </div>
        			</div>
        		   </div>        		 
        		 </div>
        		</div>
        	   </div>
        	 
               				     
      <footer class="footer">
        <div class="container">
          <div class="row align-items-center flex-row-reverse">
            <div class="col-auto ml-lg-auto">
              <div class="row align-items-center">
                
                <div class="col-auto">
                   <a href="." target="_blank">基于GitHub的实验教学系统</a>
                </div>
              </div>
            </div>
            <div class="col-12 col-lg-auto mt-3 mt-lg-0 text-center">
               建设单位：<a href="" target="_blank" title="建设单位">${other.footer_name}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 地址： <a href="" title="addr" target="_blank"> ${other.footer_Addr }</a> 
            </div>
          </div>
        </div>
      </footer>
    </div>
    

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
	    $scope.Tcolor ="${other.bgColor}";
	    $scope.Fcolor ="${other.wordColor}";
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