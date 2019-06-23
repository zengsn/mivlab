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
    <title>基于GitHub的教学管理系统——实验记录>详情</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!--    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext"> --> 
    <!-- 引入web在线文本编辑器的配置文件 -->
    <script src="<%=basePath%>ckeditor5/ckeditor.js"></script>	
    <!--require.min.js -->
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
    
    
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
   	
</head>
<body class="">
<div class="page">
      <div class="page-main">
        <div class="header py-4">
          <div class="container">
            <div class="d-flex">
              <a class="header-brand" href="<%=basePath %>InitSvlt?flgs=1&tbname=stucourse">
                <img src="${other.logoPath }" class="header-brand-img" alt="tabler logo">
                <!-- 惠州学院logo -->
                <span class="other_title">${other.title }<span class="other_title">
              </a>
              <div class="d-flex order-lg-2 ml-auto">
                <div class="nav-item d-none d-md-flex">
                  <a href="" class="btn btn-sm btn-outline-primary" target="_blank">前端主页</a>
                  <!-- 点击前往前端主页面 -->
                </div>
               
                <div class="dropdown">
                  <a href="#" class="nav-link pr-0 leading-none" data-toggle="dropdown">
                    <span class="avatar" style="background-image:url(./images/avatar-6.jpg)"></span>
                    <span class="ml-2 d-none d-lg-block">
                      <span class="text-default">${userinfo.sname }</span><!-- 用户名 -->
                      <small class="text-muted d-block mt-1">学生</small><!-- 用户身份 -->
                    </span>
                  </a>
                  <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                    
                    <a class="dropdown-item" href="<%=basePath %>InitSvlt?flgs=1&tbname=studentInfo">
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
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=stucourse" class="nav-link active"><i class="fe fe-home"></i> 我的课程</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=stutaskinfo" class="nav-link"><i class="fe fe-file"></i> 实验任务</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=mstutask" class="nav-link"><i class="fe fe-file"></i> 实验记录</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=Sscore" class="nav-link"><i class="fe fe-file"></i> 查看成绩</a>
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
		                 <a href="<%=basePath %>InitSvlt?flgs=1&tbname=mstutask"><i class="fe fe-corner-up-left" ></i></a>
		                	实验记录>详情
		              </h1>
		          </div>
                  <div class="card-body">
                    <div class="row ">
                      <div class="col-md-12 col-lg-12 card">
                      	
                        <div class="card-body">
	                    <div class="row"> 
	                      <div class="col-sm-6 col-md-6 col-lg-4">
	                    
		                    <div class="form-group">
	                          <label class="form-label">学期</label>
	                          <input type="text" disabled="" value="${a.termname}"/>	                              	                         
	                        </div>
	                      </div>
	                      <div class="col-sm-6 col-md-6 col-lg-4">
	                        <div class="form-group">
	                          <label class="form-label">班级</label>
	                          <input type="text" disabled="" value="${a.classname}"/>	                              	                         
	                        </div>
	                      </div>
	                       <div class="col-sm-6 col-md-6 col-lg-4">
	                        <div class="form-group">
	                          <label class="form-label">课程名称</label>
	                          <input type="text" disabled="" value="${a.cname}"/>	                              	                         
	                        </div>
	                       </div>
	                       
	                        <div class="col-sm-6 col-md-6 col-lg-4">
	                        <div class="form-group">
	                          <label class="form-label">发布时间</label>
	                          <input type="text" disabled="" value="${a.time}"/>	                              	                         
	                        </div>
	                       </div>
	                        <div class="col-sm-6 col-md-6 col-lg-4">
	                        <div class="form-group">
	                          <label class="form-label">最后期限</label>
	                          <input type="text" disabled="" value="${a.deadline}"/>	                              	                         
	                        </div>
	                       </div>
	                       <div class="col-sm-12 col-md-12 col-lg-12">
	                        <div class="form-group">
	                          <label class="form-label">作业标题</label>
	                           <textarea class="form-control" disabled="" >${a.title}</textarea>	 	                              	                         
	                        </div>
	                       </div>
	                       <div class="col-sm-12 col-md-12 col-lg-12">
	                        <div class="form-group">
	                          <label class="form-label">作业要求</label>
	                           <textarea class="form-control" disabled=""  id="remark" name="remark"></textarea>	 	                              	                         
	                        </div>
	                       </div>
	                       <div class="col-sm-12 col-md-12 col-lg-12"> 
	                        <div class="form-group">
	                          <label class="form-label">完成情况</label>
	                           <textarea class="form-control"   name="content" id="editor" ></textarea>	                        
	                        </div>	
	                       </div>
	                       <div class="col-sm-12 col-md-12 col-lg-12">                        
	                        <div class="form-footer">
		                      <button class="btn btn-primary  ml-auto" onclick="redirect()">返 回</button>
		                      <button class="btn btn-primary  ml-auto sub" onclick="onSubmit()">更 改</button>
		                    </div>  
		                   </div>                     
	                   </div>
                      </div>
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
	$(document).ready(function(){
		  var date=new Date();
		  var time=date.toLocaleDateString();
		  var deadline='${a.deadline}';
		  deadline=deadline.replace("-","/");
		  deadline=deadline.replace("-","/");
		  var date2=new Date(deadline);
		 // alert(date2);
		  if(date>date2){
			 
			  $(".sub").css("display","none");
		  }
			  
		;  
		//加载了适配器			  
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
		              url: '<%=basePath%>zyUploadSvlt',
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
		       editor.setData('${a.stusy_remark}');
		       console.log( editor );
		   } )
		   .catch( error => {
		       console.error( error );
		   } );
		});
		//配置实验要求编辑器
		 ClassicEditor
		  .create( document.querySelector( '#remark' ))
		  .then( editor => {	
		   	//配置上传文件适配器
		   	editor.plugins.get('FileRepository').createUploadAdapter = (loader)=>{
			        return new UploadAdapter(loader);
			    };
			    window.editor=editor;
		       editor.setData('${a.remark}');
		       console.log( editor );
		   } )
		   .catch( error => {
		       console.error( error );
		   } );
		/*返回按钮*/
		function redirect(){
			  window.location.href="<%=basePath%>InitSvlt?flgs=1&tbname=mstutask";
		};
	
		/*提交按钮*/
		function onSubmit(){
			   var editor=window.editor;
		     
		     //获取值
		 	if (editor) {
		 		//设置值 editor.setData(htmlStr);
		 		var stutask_id=${a.id};
		 		var remark=editor.getData();//获取文本编辑器中的值  		
		 		if( remark=="" ){
					alert('作业信息不完整。');
					return;
				}
		 		$.ajax({
						url:'<%=basePath%>UpdSvlt',
						type:'post',
						data:{"tbname":"stutask","stutask_id":stutask_id,"remark":remark},
						dataType:'json',
						success:function(data){
							alert(data.msg);
						}
					});
					
		 	}else{
		 		alert("error");
		 	}	
		};
	$(document).ready(function(){
		  $(".backward").click(function(){
			  window.location.href="<%=basePath%>InitSvlt?flgs=1&tbname=mstutask";
		  });
	});
	</script>

  </body>
</html>