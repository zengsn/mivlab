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
    
    <title>虚拟实验仿真教学中心管理系统</title>
    <style type="text/css">
        table td {
            border: #C0C0C0 0px solid;
        }

        a:link, a:visited {
            color: #000080;
            text-decoration: none;
        }

        a:hover {
            color: #FF0000;
            text-decoration: none;
        }

        a:active {
            color: #000080;
            text-decoration: none;
        }
    </style>
</head>
<script type="text/javascript" src="<%=basePath %>js/jquery-1.4.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(window).resize(Resize);
    });
    function Resize() {
        $("#SubMenu").height(document.documentElement.clientHeight - $("#SubMenu").offset().top - 2);
        $("#SubMenu").width(document.documentElement.clientWidth - $("#SubMenu").offset().left - 30);
    }
</script>
<body style="margin: 0px; padding: 0px;">
    <table style="width: 100%; margin: 0px; border-style: none; padding: 0px; border-width: 0px; border-collapse: collapse; background-repeat: no-repeat;">
    <tr>
        <td style="width: 30px; background-image: url(<%=basePath%>images/formback_1.jpg); background-repeat: no-repeat; padding: 0px; vertical-align: top;">
        </td>
        <td style="background-image: url(<%=basePath%>images/formback_2.jpg); background-repeat:repeat-x; vertical-align: top;">
            <table style="width:100%; font-size:11pt; padding: 0px; border-width: 0px; border-collapse: collapse;">
                <tr>
                    <td colspan="2">
                        <table style="width: 100%; line-height:19px; padding: 0px; border-width: 0px; border-collapse: collapse;">
                            <tr>
                                <td id="mainTitle" style="height:36px; font-family: 微软雅黑; font-size:12pt; color: #fff; white-space: nowrap;" rowspan="2"><div style="display: inline;">虚拟实验仿真教学中心管理系统后台</div></td>
                                <td style="height:20px; font-family: 微软雅黑; font-size:9pt; color: #fff; text-align: right; white-space: nowrap;">
                                </td>
                            </tr>
                            <tr>
                                <td style="height:17px;font-family: 微软雅黑; font-size:9pt; color: #fff; text-align: right; white-space: nowrap;">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="font-family: 微软雅黑; font-size: 13pt; white-space : nowrap;">
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<c:if test="${utype=='gly' }">
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=admin" target="SubMenu">管理员信息管理</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=otitle" target="SubMenu">一级标题管理</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=ttitle" target="SubMenu">二级标题管理</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=classinfo" target="SubMenu">班级信息管理</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=course" target="SubMenu">课程信息管理</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=terms" target="SubMenu">学期信息管理</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=students" target="SubMenu">学生信息管理</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacher" target="SubMenu">教师信息管理</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=courseplan" target="SubMenu">课程安排管理</a>&nbsp;&nbsp;
                    	</c:if>  
                    	<c:if test="${utype=='tea' }">
	                    	<a href="<%=basePath %>teacher/teainfo.jsp" target="SubMenu">我的信息</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacourse" target="SubMenu">我的课程</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=syinfo" target="SubMenu">实验信息管理</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=score" target="SubMenu">成绩信息管理</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=zyinfo" target="SubMenu">作业信息管理</a>&nbsp;&nbsp;
                    	</c:if>
                    	<c:if test="${utype=='stu' }">
	                    	<a href="<%=basePath %>students/stuinfo.jsp" target="SubMenu">我的信息</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=stucourse" target="SubMenu">我的课程</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=stusyinfo" target="SubMenu">实验信息查看</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=stuscore" target="SubMenu">我的成绩</a>&nbsp;&nbsp;
	                    	<a href="<%=basePath %>InitSvlt?flgs=1&tbname=stuzyinfo" target="SubMenu">作业信息</a>&nbsp;&nbsp;
                    	</c:if>                    	
                    </td>
                    <td style="height:36px; font-family: 微软雅黑; font-size:10pt; white-space: nowrap;" align="right">
                    	<a href="<%=basePath %>LogoutSvlt">安全退出</a>&nbsp;&nbsp;                    	
                    </td>
                </tr>
                <tr><td colspan="2"><div style="height: 7px; margin: 0px;"></div></td></tr>
                <tr><td style="vertical-align: top;" colspan="2">
                    <iframe id="SubMenu" src="<%=basePath %>admin/subm.jsp" name="SubMenu" frameborder="0" style="vertical-align: middle; min-width: 800px;
                        text-align: center; width: 100%; background-color:transparent;" scrolling="auto" allowtransparency="true">
                    </iframe>
                </td></tr>
            </table>
        </td>
        <td style="width: 30px; background-image: url(<%=basePath%>images/formback_3.jpg); background-repeat: no-repeat; padding: 0px;">
        </td>
    </tr>
    </table>
</body>
</html>
<script type="text/javascript">
    if ($.browser.mozilla && navigator.userAgent.indexOf('Trident/7.0') < 0) {
        $("#mainTitle").height(32);
    }
    Resize();
</script>
