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
    <title>基于GitHub的教学管理系统——我的课程>发布作业</title>
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
              <a class="header-brand" href="<%=basePath %>InitSvlt?flgs=1&tbname=teacourse">
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
                    <span class="avatar" style="background-image: url(./images/avatar-7.jpg)"></span>
                    <span class="ml-2 d-none d-lg-block">
                      <span class="text-default">${userinfo.tName }</span><!-- 用户名 -->
                      <small class="text-muted d-block mt-1">教师</small><!-- 用户身份 -->
                    </span>
                  </a>
                  <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                    
                    <a class="dropdown-item" href="<%=basePath %>InitSvlt?flgs=1&tbname=teacherInfo">
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
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacourse" class="nav-link active"><i class="fe fe-home"></i> 我的课程</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=tshiyan" class="nav-link"><i class="fe fe-file"></i> 实验管理</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=tGitmana" class="nav-link"><i class="fe fe-file"></i> 统计GitHub实验信息</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=tGitDate" class="nav-link"><i class="fe fe-file"></i> GitHub实验信息管理</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=TeagitRawdate" class="nav-link"><i class="fe fe-file"></i> 原始实验数据</a>
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
	                	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacourse"><i class="fe fe-corner-up-left" ></i></a>
	                	我的课程>发布作业
		              </h1>
		          </div>
                  <div class="card-body">
                    <div class="row ">
                      <div class="col-md-6 col-lg-12 card">
                      	
                        <div class="card-body">
	                    <fieldset class="form-fieldset">
		                    <div class="form-group">
	                          <label class="form-label">学期：${a.termname}</label>	                         
	                          <input type="hidden" value="${a.terms_id}" id="termid">
	                        </div>
	                        <div class="form-group">
	                          <label class="form-label">班级：${a.classname}</label>	                         
	                          <input type="hidden" value="${a.classinfo_id}" id="classid">
	                        </div>
	                        <div class="form-group">
	                          <label class="form-label">课程名称：${a.cname}</label>	                         
	                          <input type="hidden" value="${a.course_id}" id="courseid">
	                        </div>
	                        <div class="form-group">
	                          <label class="form-label">作业标题</label>	                         
	                           <textarea class="form-control" name='title' id="title"  maxlength="200" class="form-control" ></textarea>
	                        </div>
	                        <div class="form-group">
	                          <label class="form-label">最后期限</label>	                         
	                          <input type="date" name="deadline" id="deadline" class="form-control">
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="form-label">作业内容：（每段的开头无需缩进）</label>
	                           <textarea class="form-control" name="content" id="editor" ></textarea>	                        
	                        </div>	                        
	                        <div class="form-footer">
	                          <button class="btn btn-primary ml-auto" onclick="redirect()">返 回</button>
		                      <button class="btn btn-primary ml-auto" onclick="onSubmit()">发 布</button>
		                    </div>                       
	                      </fieldset>
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
	
  </body>
</html>