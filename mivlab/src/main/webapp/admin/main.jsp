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
		<title>管理员首页</title>
		
		<link rel="stylesheet" href="<%=basePath%>assets/css/amazeui.css" />
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=basePath%>assets/css/core.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/menu.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/index.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/admin.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/page/typography.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/page/form.css" />
		
	<!-- 头部底部 -->
		<link rel="stylesheet" href="<%=basePath%>css/titleFooter.css" />	
		
		<script type="text/javascript" src="<%=basePath%>js/jquery.min.js.下载"></script>
		<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js.下载"></script>
<style> 
  .banner, .footer {
      background-color: ${other.bgColor};
   /*   background-image:${other.imgPath};  
      background-image:url(/allProjUpload/mivlab2/LogoImage/banner.jpg) ;*/
      color: ${other.wordColor};     
    }
  .teamanage ,.stumanage, .classmanage, .fnav, .ssnav :hover{
  	cursor:pointer;
  	
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
$(document).ready(function(){
  $(".fnav").click(function(){
	  window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=fnav";
  });
  $(".ssnav").click(function(){
	  window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=snav";
  });
  $(".teamanage").click(function(){
	  window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=teacher";
  });
  $(".classmanage").click(function(){
	  window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=classinfo";
  });
  $(".stumanage").click(function(){
	  window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=students";
  });
  $(".ssnav").hover(
		  function (){
			  $(".ssnav").css("cursor","pointer") ;
		  }
		  
  );
});
</script>		
</head>
<body>	

	<header class="am-topbar am-topbar-fixed-top">		
			<!-- 顶部标题栏 -->
			<div class="banner" id="banner" >				        
		    	<div class="banner-title">${other.title }</div>        
			</div>
			<div class="am-topbar-left am-hide-sm-only">
                <a href="index.html" class="logo"><span>Ad</span><i class="zmdi zmdi-layers"></i></a>              
            </div>
	
			<div class="contain">
				 
				<ul class="am-nav am-navbar-nav am-navbar-left">
					
					<li><h4 class="page-title">首页</h4></li>
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
						<div class="am-u-md-3">
							<div class="card-box">
								<h4 class="header-title m-t-0 m-b-30">前端页面</h4>
								<div class="widget-chart-1 am-cf">
                                    <div id="widget-chart-box-1" class="fnav" style="height: 110px;width: 110px;float: left;">
                                    
                                        <h2 class="p-t-10 m-b-0"> ${fnavSize} 项</h2>
                                        <p class="text-muted">一级标题</p>
                                    
                                    </div>
									
									<div class="widget-chart-box-1 ssnav"  style="float: right;">
                                        <h2 class="p-t-10 m-b-0 "> ${snavSize} 项</h2>
                                        <p class="text-muted">二级标题</p>
                                    </div>
									
                                    
                                </div>
							</div>
						</div>
						<!-- col end -->
						<div class="am-u-md-3 teamanage">
							<div class="card-box">
								<h4 class="header-title m-t-0 m-b-30">教师管理</h4>
								<div class="widget-chart-1 am-cf">
                                    
									
                                    <div class="widget-detail-1" style="float: right;">
                                        <h2 class="p-t-10 m-b-0"> ${teaSize} 人</h2>
                                        <p class="text-muted">教师总数</p>
                                    </div>
                                </div>
							</div>
						</div>
						<!-- col end -->
						<div class="am-u-md-3 classmanage" >
							<div class="card-box">
								<h4 class="header-title m-t-0 m-b-30">班级管理</h4>
								<div class="widget-chart-1 am-cf">
									
                                    <div class="widget-detail-1" style="float: right;">
                                        <h2 class="p-t-10 m-b-0"> ${classSize} </h2>
                                        <p class="text-muted">班级总数</p>
                                    </div>
                                </div>
							</div>
						</div>
						<!-- col end -->
						<div class="am-u-md-3 stumanage">
							<div class="card-box">
								<h4 class="header-title m-t-0 m-b-30">学生管理</h4>
								<div class="widget-chart-1 am-cf">
                                    <div class="widget-detail-1" style="float: right;">
                                        <h2 class="p-t-10 m-b-0"> ${stuSize} 人</h2>
                                        <p class="text-muted">学生总数</p>
                                    </div>
                                </div>
							</div>
						</div>
					<!-- Row end -->
				</div>
				
				<div class="am-g">
					<!-- Row start -->
					<div class="am-u-md-12" >
						<!-- 柱状图 -->
						<div class="card-box">
							<div  id="columnar1"   style="width: 100%;height: 400px;"></div>
						</div>
					</div>
					<!-- 快速链接   
					<div class="am-u-md-6">
						
						<div class="card-box">
							<div  id="" style="width: 100%;height: 400px;">
							
							</div>
						</div>
					</div>
					-->
					<!-- Row end -->
				</div>
					</div>
					<!-- Row end -->
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
		
</div>
    
		
		<!-- navbar -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
		<!-- 柱状图 -->
		
		<script type="text/javascript" src="<%=basePath%>assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="<%=basePath%>assets/js/amazeui.min.js"></script>
		<script type='application/javascript' src='<%=basePath%>assets/js/fastclick.js'></script>
		<script type="text/javascript" src="<%=basePath%>assets/js/app.js" ></script>
		<script type="text/javascript" src="<%=basePath%>assets/js/blockUI.js" ></script>
		<script type="text/javascript" src="<%=basePath%>assets/js/charts/echarts.min.js" ></script>
<!--  		<script type="text/javascript" src="<%=basePath%>assets/js/charts/columnarChart.js" ></script>-->
<script type="text/javascript">
		(function(){
	
var columnar1 = echarts.init(document.getElementById("columnar1"));

option = {
	
	title: {
		text: "师资队伍",
		x:'left'
	},
	
    color: ['#3398DB'],
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            data : ['助教', '讲师', '副教授', '教授'],
            axisTick: {
                alignWithLabel: true
            }
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'人数',
            type:'bar',
            barWidth: '30%',
            data:['${zhujiao}', '${jiangshi}', '${fujiaoshou}', '${jiaoshou}']
        }
    ]
};

columnar1.setOption(option);
})();
		</script>
	</body>
	
</html>



