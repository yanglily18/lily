<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="inc/check.jsp"%>
<%
	session.invalidate();
	out.print("<script language='javascript'>window.alert('确认退出')</script>");
	out.print("<script language='javascript'>window.open('login.jsp')</script>");
	out.print("<script language='javascript'>window.parent.opener=null</script>");
	out.print("<script language='javascript'>window.parent.close()</script>");
%>
