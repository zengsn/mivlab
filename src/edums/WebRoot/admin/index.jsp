<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>仿真教学中心后台</title>
    <style type="text/css">
        body
        {
            font-family: "宋体";
            font-size: 9pt;
            margin: 100px auto auto auto;
        }
        table
        {
            font-family: "宋体";
            font-size: 9pt;
        }
    </style>
</head>
<script type="text/javascript" src="<%=basePath %>js/jquery-1.4.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(window).resize(Resize);
        Resize();
    });
    function Resize() {
        var wintop = ($(window).height() - 400) / 2;
        var winleft = ($(window).width() - 600) / 2;
        if (wintop > 0) {
            $("#win").css("top", wintop + "px");
        }
        if (winleft > 0) {
            $("#win").css("left", winleft + "px");
        }
        $("#div1").offset({ top: $("#td1").offset().top + 31, left: $("#td1").offset().left + 1 });
        $("#div2").offset({ top: $("#td1").offset().top + 30, left: $("#td1").offset().left });
        $("#div3").offset({ top: $("#td2").offset().top + 16, left: $("#td2").offset().left + 1 });
        $("#div4").offset({ top: $("#td2").offset().top + 15, left: $("#td2").offset().left });
        $("#div5").offset({ top: $("#td1").offset().top + 100, left: $("#td1").offset().left + 1 });
        $("#div6").offset({ top: $("#td1").offset().top + 102, left: $("#td1").offset().left + 1 });
        $("#div7").offset({ top: $("#td1").offset().top + 101, left: $("#td1").offset().left });
        $("#div8").offset({ top: $("#td1").offset().top + 101, left: $("#td1").offset().left + 2 });
        $("#div9").offset({ top: $("#td1").offset().top + 101, left: $("#td1").offset().left + 1 });
    }
    var dX, dY, _top, left;
    function dragStart(e) {
        dX = e.clientX - $("#win").offset().left;
        dY = e.clientY - $("#win").offset().top;
        $(document).bind("mousemove", dragMove);
        $(document).bind("mouseup", dragStop);
    }
    function dragMove(e) {
        _top = e.clientY - dY;
        left = e.clientX - dX;
        if (left + 622 >= $(window).width()) {
            left = $(window).width() - 622;
        }
        if (_top + 422 >= $(window).height()) {
            _top = $(window).height() - 422;
        }
        if (_top < 20) _top = 20;
        if (left < 20) left = 20;
        $("#win").css({ "left": left + "px", "top": _top + "px" });
    }
    function dragStop() {
        $(document).unbind("mousemove", dragMove);
        $(document).unbind("mouseup", dragStop);
    }
    function lgtj(){
    	var uname=$("#uname").val();
    	var upassword=$("#upassword").val();
    	if(uname==""||upassword==""){
    		alert("请输入完整的登录信息");
    		return;
    	}
    	$.ajax({
    		url:'LoginSvlt',
    		type:'post',
    		data:{"uname":uname,"upassword":upassword,"utype":"gly"},
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
</script>
<body id="bd">
    <div id="win" style="width: 600px; height: 400px; -moz-user-select: none; -webkit-user-select: none;
        filter: progid:DXImageTransform.Microsoft.Shadow(color=#808080,direction=135,strength=10);
        -moz-box-shadow: 2px 2px 20px #808080; -webkit-box-shadow: 2px 2px 20px #808080;
        box-shadow: 2px 2px 20px #808080; border-radius: 0px 0px 0px 0px; 
        background-image: url('<%=basePath%>images/login.jpg');
        border: none; position: absolute; left: -600px;">
        <table id="table1" style="width: 600px; border: 0px; border-spacing: 0px;">

            <tr onmousedown="dragStart(event)" onselectstart="return false;">
                <td id="td1" style="height: 300px">
                    <div id="div1" style="position: absolute; text-align: center; left: 0px; top: 0px; width: 600px; height: 60px; vertical-align: middle; font-family: 隶书; font-size:20pt; color:#800000; cursor:default;" >
                        
                    </div>
                    <div id="div2" style="position: absolute; text-align: center; left: 0px; top: 0px; width: 600px; height: 60px; vertical-align: middle; font-family: 隶书; font-size:20pt; color:#FF8000; cursor:default;" >
                        
                    </div>
                     <div id="div5" style="position: absolute; text-align: center; left: 0px; top: 0px; width: 600px; height: 150px; vertical-align: middle; font-family: 隶书; font-size:36pt; color:#FFFFFF; cursor:default;" >
                     仿真教学中心后台
                    </div>
                    <div id="div6" style="position: absolute; text-align: center; left: 0px; top: 0px; width: 600px; height: 150px; vertical-align: middle; font-family: 隶书; font-size:36pt; color:#FFFFFF; cursor:default;" >
                      仿真教学中心后台
                    </div>
                    <div id="div7" style="position: absolute; text-align: center; left: 0px; top: 0px; width: 600px; height: 150px; vertical-align: middle; font-family: 隶书; font-size:36pt; color:#FFFFFF; cursor:default;" >
                      仿真教学中心后台
                    </div>
                    <div id="div8" style="position: absolute; text-align: center; left: 0px; top: 0px; width: 600px; height: 150px; vertical-align: middle; font-family: 隶书; font-size:36pt; color:#FFFFFF; cursor:default;" >
                      仿真教学中心后台
                    </div>
                    <div id="div9" style="position: absolute; text-align: center; left: 0px; top: 0px; width: 600px; height: 150px; vertical-align: middle; font-family: 隶书; font-size:36pt; color:#FF0000; cursor:default;" >
                      仿真教学中心后台
                    </div>
                 </td>
            </tr>
            <tr>
                <td style="text-align: center; width: 100%; height: 40px; margin-top: 0; background-color: #EEEEEE;">
                    <table style="height: 40px; border-spacing: 0px; margin: 0px auto 0px auto;">
                        <tr>
                            <td>
                               &nbsp;账号:
                            </td>
                            <td>
                                <input id="uname" name="uname" type="text" style="width: 120px;"/>
                            </td>
                            <td>
                                &nbsp; 密码:
                            </td>
                            <td>
                                <input id="upassword" name="upassword" type="password" style="width: 120px;"/>
                            </td>
                            <td>
                                &nbsp;<input type="button" value=" 登 录 " onclick="lgtj();"/>
                            </td>
                            
                        </tr>
                    </table>
                </td>
            </tr>
            <tr onmousedown="dragStart(event)" onselectstart="return false;">
                <td id="td2" style="height: 60px; text-align: center;">
                    <div id="div3" style="position: absolute; left: 0px; top: 0px; width: 600px; height: 60px; font-family:Comic Sans MS; color: #000000;">
                        <br/>
                    </div>
                    <div id="div4" style="position: absolute; left: 0px; top: 0px; width: 600px; height: 60px; font-family:Comic Sans MS; color: #FFFFFF;">
                        <br/>
                    </div>
                </td>
            </tr>
        </table>
    </div> 
</body>
</html>
