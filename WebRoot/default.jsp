<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="inc/tittle.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'default.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <link href="inc/css1.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  <table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="default_table">
    <tr>
      <td height="80" colspan="2" align="left"><font color="#FF0000"> <%= session.getAttribute("userName")%></font>，欢迎你使用使用人事管理系统</td>
    </tr>
    <tr>
      <td width="24" height="30"><img src="images/134.gif" alt="" width="20" height="20"></td>
      <td width="576" height="30" class="login_font1">员工档案管理：添加,管理,查询员工档案信息</td>
    </tr>
    <tr>
      <td height="30"><img src="images/134.gif" alt="" width="20" height="20"></td>
      <td height="30" class="login_font1">员工培训管理：添加,管理,查询员工培训记录</td>
    </tr>
    <tr>
      <td height="30"><img src="images/134.gif" alt="" width="20" height="20"></td>
      <td height="30" class="login_font1">员工职称管理：添加,管理,查询员工职称信息</td>
    </tr>
    <tr>
      <td height="30"><img src="images/134.gif" alt="" width="20" height="20"></td>
      <td height="30" class="login_font1">员工奖惩管理：添加,管理,查询员工奖惩记录</td>
    </tr>
    <tr>
      <td height="30"><img src="images/134.gif" alt="" width="20" height="20"></td>
      <td height="30" class="login_font1">员工调动管理：添加,管理,查询员工调动情况</td>
    </tr>
    <tr>
      <td height="30"><img src="images/134.gif" alt="" width="20" height="20"></td>
      <td height="30" class="login_font1"><a href="exit.jsp">退出系统</a></td>
    </tr>
  </table>
  <br>
  </body>
</html>
