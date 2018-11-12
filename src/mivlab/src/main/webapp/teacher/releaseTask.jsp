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
<title>发布作业</title>
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

<style>
	/*内容布局*/
	td{
	 
	 padding:10px 0px;
	}
	/*发布作业按钮*/
	.button {
	  display: inline-block;
	  border-radius: 4px;
	  background-color: #f4511e;
	  border: none;
	  color: #FFFFFF;
	  text-align: center;
	  font-size: 14px;
	  padding: 10px;
	  width: 100px;
	  transition: all 0.5s;
	  cursor: pointer;
	  margin: 5px;
	}
	
	.button span {
	  cursor: pointer;
	  display: inline-block;
	  position: relative;
	  transition: 0.5s;
	}
	
	.button span:after {
	  content: ' ';
	  position: absolute;
	  opacity: 0;
	  top: 0;
	  right: -20px;
	  transition: 0.5s;
	}
	
	.button:hover span {
	  padding-right: 20px;
	}
	
	.button:hover span:after {
	  opacity: 1;
	  right: 0;
	}
</style>

<script>
//点击“提交”按钮
function onSubmit(){				
        var editor=window.editor;
        
        //获取值
    	if (editor) {
    		//设置值 editor.setData(htmlStr);    		
    		var remark=editor.getData();//获取文本编辑器中的值
    		var termid=$('#termid').val();
    		var classid=$('#classid').val();	
    		var courseid=$("#courseid").val();
    		var title =$("#title").val();
    		var deadline=$("#deadline").val();
    		
    		if(title =="" || remark=="<p>&nbsp;</p>" || deadline==""){
    			alert('作业信息不完整。');
    			return;
    		}
    		//alert(remark);
    		$.ajax({
				url:'<%=basePath%>AddSvlt',
				type:'post',
				data:{"tbname":"teaTask","termid":termid,"classid":classid,"courseid":courseid,"title":title,"remark":remark,"deadline":deadline},
				dataType:'json',
				success:function(data){					
					if(data.msg=="1"){
						alert("发布成功");
					}else{
						alert("发布失败");
					}
				}
			});
			
    	}else{
    		alert("error");
    	}	
        
	}
$(document).ready(function(){
	  $(".backward").click(function(){
		  window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=teacourse";
	  });
});
//点击返回按钮
function redirect(){
	window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=teacourse";
}
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

					<li><h4 class="page-title"><span class="fa fa-mail-reply backward" ></span> 我的课程>发布作业</h4></li>
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
	                            <img src="<%=basePath%>assets/img/avatar-7.jpg" alt="user-img" title="${userinfo.tName }" class="img-circle img-thumbnail img-responsive">
	                            <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
	                        </div>
	                       <h5>${userinfo.tName } </h5>
	                        <ul class="list-inline">
	                        	<li>
	                                <a href="<%=basePath %>teacher/help.html" target="_blank" class="text-custom">
	                                    <i class="fa fa-question-circle" aria-hidden="true"> 帮助</i>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacherInfo" class="text-custom">
	                                    <i class="fa fa-cog" aria-hidden="true"> 设置</i>
	                                </a>
	                            </li>
								<li>
	                                <a href="<%=basePath %>loginOut.jsp" class="text-custom">
	                                    <i class="fa fa-sign-out" aria-hidden="true"> 退出</i>
	                                </a>
	                            </li>
	
	                            
	                        </ul>
	                    </div>
	                    <!-- End User -->
	            
						<ul class="am-list admin-sidebar-list">
						    
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-th-list"></span> 教学管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacourse" class="am-cf"> 我的课程</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=tshiyan" class="am-cf"> 实验管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=tGitmana"> 统计GitHub实验信息</a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=tGitDate"> GitHub实验信息管理</a></li>
						        <li class="hiddenli"><a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacherInfo"> 个人设置</a></li>
						        <li class="hiddenli"><a href="<%=basePath %>teacher/help.html"> 帮助</a></li>
						        <li class="hiddenli"><a href="<%=basePath %>loginOut.jsp"> 退出登录</a></li>
						      </ul>
						    </li>						    
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><i class="am-icon-th-list" aria-hidden="true"></i> 系外教学 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav2">
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=tGitmana2" class="am-cf"> GitHub实验管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=tGitDate2"> 实验成绩</span></a></li>
						        
						      </ul>
						    </li>
						  </ul>
				</div>
				  </div>
				  <!-- sidebar end -->
    
				<!--</div>
			</div>
		</div>-->
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
								
								<form>
								<fieldset style="height:100%; margin:30px;">
									
									<table  border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
										<tr>
											<td>学期：</td><td>${a.termname} <input type="hidden" value="${a.terms_id}" id="termid"></td>
											
											
										</tr>
										<tr>
										<td>班级：</td><td>${a.classname} <input type="hidden" value="${a.classinfo_id}" id="classid"></td>
										</tr>
										<tr>
										<td>课程名称：</td><td>${a.cname} <input type="hidden" value="${a.course_id}" id="courseid"></td>
										</tr>
										<tr>
											<td>作业标题：</td>
											<td><input type="text" id="title" ></td>
										</tr>
										<tr>
											<td>最后期限：</td>
											<td><input type="date" name="deadline" id="deadline" ></td>
										</tr>
										<tr>
											<td>作业内容：</td>
											<td><textarea name="content" id="editor"></textarea></td>
										</tr>	
										<tr>
											<td colspan="6">
											
											<p align="center">
												<input  class="button" type="button" value="返回" onclick="redirect()"><input class="button" type="button" value="发布" onclick="onSubmit()">				
											</p>
											
											</td>
										
										</tr>
									</table>
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
			            var test="test";
			           
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
			        editor.setData('');
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