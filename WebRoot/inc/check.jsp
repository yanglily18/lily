<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("userName")==null||session.getAttribute("userName")=="")
{
response.sendRedirect("login.jsp");

}


%>