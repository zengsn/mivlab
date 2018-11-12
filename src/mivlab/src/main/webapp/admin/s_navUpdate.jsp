<%@page import="bean.Snav"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>二级导航栏--详情与更新</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>ckeditor5/ckeditor.js"></script>		<!-- 引入web在线文本编辑器的配置文件 -->


<!-- amaze ui -->
<link rel="stylesheet" href="<%=basePath%>assets/css/amazeui.css" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/core.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/menu.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/index.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/admin.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/page/typography.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/page/form.css" />

<!--  -->	
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js.下载"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js.下载"></script>
<!-- 头部底部 -->
<link rel="stylesheet" href="<%=basePath%>css/titleFooter.css" />
<style> 
  .banner, .footer {
      background-color: ${other.bgColor};
     /* background-image:${other.imgPath};   */
      color: ${other.wordColor};     
    }
   .backward{   	
    	color:#71b6f9;
    }
   .backward:hover{
   	cursor:pointer;
   	color:blue;
   }
   .hiddenli{
  display:none !important;
  
  }
  @media screen and (max-width: 640px) {
   .hiddenli{
  display:block !important;
  
  }
</style>

<%	request.setCharacterEncoding("UTF-8");		
%>
<script>
window.onload=function(){
	//初始化父标题
	var select=$("#fid").val();
	$("select option[value='"+select+"']").attr("selected", "selected");
	
 }

//点击“提交”按钮
function onSubmit(){				
        var editor=window.editor;
        
        //获取值
    	if (editor) {
    		//设置值 editor.setData(htmlStr);
    		
    		var remark=editor.getData();//获取文本编辑器中的值
    		var name=$('#snav_name').val();
    		var fnav_id=$('#gotitle_id').val();	
    		var id=$("#sid").val();
    		if(name==""||remark=="<p>&nbsp;</p>"||fnav_id=="0"){
    			alert('二级标题信息不完整。');
    			return;
    		}      				        		 		        		 		        		 		        		 
    		 $.ajax({				
					url:'<%=basePath%>UpdSvlt',
					type:'post',
					data:{"tbname":"snav","id":id,"name":name,"remark":remark,"fnav_id":fnav_id},
					dataType:'json',
					success:function(data){
						alert(data.msg);
						if(data.msg=="修改成功"){
							window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=snav";
						}
					}
				}) 
			
    	}else{
    		alert("error");
    	}	
        
	}
//点击返回按钮，跳转到s_nav.jsp
function redirect(){
	window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=snav";
}
$(document).ready(function(){
	  $(".backward").click(function(){
		  window.location.href="InitSvlt?tbname=snav";
	  });
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
               <a href="index.html" class="logo"><span>Admin<span>to</span></span><i class="zmdi zmdi-layers"></i></a>
           </div>

		<div class="contain">
			<ul class="am-nav am-navbar-nav am-navbar-left">

				<li><h4 class="page-title"><span class="fa fa-mail-reply backward" ></span> 二级标题管理>详情</h4></li>
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
							
							<form  class="am-form" data-am-validator>
							  <fieldset>								    								
							    <div class="am-form-group">
							      <label for="gotitle_id">父标题：</label>
							      <input type="hidden" name="fid" id="fid" value="${ob.fnav_id }"/>
							      <select id="gotitle_id" name="gotitle_id" required>
							        <option value="">-=选择父标题=-</option>
								    <c:forEach var='a' items='${otitlelist}'>						
									<option value="${a.id }">${a.name }</option>
									</c:forEach>
							      </select>
							      <span class="am-form-caret"></span>
							    </div>																   
							
							    <div class="am-form-group">
							      <label for="snav_name">二级标题名称：</label>
							      <textarea name="snav_name" id="snav_name" minlength="0" maxlength="200" >${ob.snav_name}</textarea>
							      <input type="hidden" name="sid" id="sid" value="${ob.id }"/>
							    </div>
							    <div class="am-form-group">
							      <label for="editor">内容：（每段的开头无需手动缩进，提交后自动缩进两个字符）</label>
							      <textarea name="content" id="editor" ></textarea>
							    </div>
							
							    <button class="am-btn am-btn-secondary" type="button" onclick="redirect()">返回</button>
							    <button class="am-btn am-btn-secondary" type="button" onclick="onSubmit()">更新</button>
							  </fieldset>
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
		
	<!-- end right Content here -->
	<!--</div>-->
	</div>
	
	
	<!-- navbar -->
	<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
	
<script>
 				// 加载了适配器			  
			    class UploadAdapter {
			        constructor(loader) {
			            this.loader = loader;
			        }
			        upload() {
			            return new Promise((resolve, reject) => {
			            const data = new FormData();			           
			            data.append('upload', this.loader.file);
			            data.append('allowSize', 10);//允许图片上传的大小/兆
			            //alert( this.loader.file.name);	//输出上传图片 的名称
			            console.log(data);			            
			            $.ajax({
			                url: '<%=basePath%>EditorUploadSvlt',
			                type: 'POST',
			                data: data,
			                dataType: 'json',
			                processData: false,	// jQuery不要去处理发送的数据
			                contentType: false, // jQuery不要去设置Content-Type请求头s
			                success: function (data) {
			                    if (data.res) {
			                    	
			                        resolve({
			                            default: data.url
			                            
			                        });
			                    } else {
			                        reject(data.msg);
			                    }
			                }
			            });

			        });
			        }
			        abort() {
			        }
			    };
			    
			   ClassicEditor
			   .create( document.querySelector( '#editor' ))
			   .then( editor => {	
			    	//配置上传文件适配器
			    	editor.plugins.get('FileRepository').createUploadAdapter = (loader)=>{
				        return new UploadAdapter(loader);
				    };
				    window.editor=editor;
			        editor.setData('${ob.remark}');
			        console.log( editor );
			    } )
			    .catch( error => {
			        console.error( error );
			    } );
			    
</script>
<script type="text/javascript" src="<%=basePath%>assets/js/jquery-2.1.0.js" ></script>
<script type="text/javascript" src="<%=basePath%>assets/js/amazeui.min.js"></script>
<script type='application/javascript' src='<%=basePath%>assets/js/fastclick.js'></script>
<script type="text/javascript" src="<%=basePath%>assets/js/app.js" ></script>
<script type="text/javascript" src="<%=basePath%>assets/js/blockUI.js" ></script>
</body>
</html>