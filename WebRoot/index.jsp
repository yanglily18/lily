<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="inc/tittle.jsp"%>
<%@ include file="inc/check.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><%=tittlestr%>_首页</title>
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
  
  <body class="index_body">
  <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr><td>
   <%@ include file="inc/top.jsp"%>
      </td></tr>
    <tr>
      <td>
      <%@ include file="inc/main.jsp"%>
      </td>
    </tr>
    <tr><td>
   <%@ include file="inc/bottom.jsp"%>
      </td></tr>
  </table>
  </body>
</html>
