<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>students</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/demo.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/icon.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/syscss.css">
		<script type="text/javascript" src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/syssmp.js"></script>
		<script type="text/javascript">
		$(function(){
			$("#dlg").dialog({closable: false});
		})
	</script>
</head>
<body>	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td style="width: 100%;" align="center">
				<div id="dlg" class="easyui-dialog" title="学生信息"  style="width:100%;max-width:400px;padding:30px 60px;">
					<form id="ff" method="post">
						<div style="margin-bottom:20px">
							<input id="gsno" disabled="disabled" value="${userinfo.sno }" class="easyui-textbox" name="gsno" style="width:100%"  data-options="label:'学号:'"/>
						</div>
						<div style="margin-bottom:20px">
							<input id="gsname" disabled="disabled" value="${userinfo.sname }" class="easyui-textbox" name="gsname" style="width:100%"  data-options="label:'姓名:'"/>
						</div>
						<div style="margin-bottom:20px">
							<input id="gsname" disabled="disabled" value="${userinfo.sgender }" class="easyui-textbox" name="gsname" style="width:100%"  data-options="label:'性别:'"/>
						</div>
						<div style="margin-bottom:20px">
							<input id="gsname" disabled="disabled" value="${userinfo.classname }" class="easyui-textbox" name="gsname" style="width:100%"  data-options="label:'班级:'"/>
						</div>
						<div style="margin-bottom:20px">
							<input id="gsphone" disabled="disabled" value="${userinfo.sphone }" class="easyui-textbox" name="gsphone" style="width:100%"  data-options="label:'电话:'"/>
						</div>
						<div style="margin-bottom:20px">
							<input id="gspassword" disabled="disabled" value="${userinfo.spassword }" class="easyui-textbox" name="gspassword" style="width:100%"  data-options="label:'密码:'"/>
						</div>
					</form>
				</div>
			</td>
		</tr>
	</table>
		<input type="hidden" id="hrownums" value="${rownums }" />
		<input type="hidden" id="hpagenum" value="${pagenum }" />
		<input type="hidden" id="hpagenums" value="${pagenums }" />
		<input type="hidden" id="idi" value="" />
		<input type="hidden" id="flagi" value="" />
		<div style="display: none;">
			<form id="fm" action="" method="post">
				<input id="pt" name="tbname"/>
			</form>
		</div>
	</body>
</html>
