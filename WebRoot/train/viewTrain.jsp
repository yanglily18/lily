<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../inc/tittle.jsp" %>
<%@ include file="..\inc\checks.jsp"%>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope="page" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title><%=tittlestr %>_培训详细信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="${pageContext.request.contextPath}/inc/css1.css" rel="stylesheet" type="text/css">
<link href="../inc/css1.css" rel="stylesheet" type="text/css">
</head>

<body class="login_body">
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td><%@ include file="../inc/top.jsp"%>
			</td>
		</tr>

		<tr>
		  <td>
		<%
        
      try{
        String id = "";
		id = request.getParameter("id");		
		String strSql="SELECT * FROM train where TrainNO=" + id;
		ResultSet rs=bd.getRs(strSql);
		while(rs.next()){
		String employeeid =  rs.getString("EmployeeID");
		String trainname = rs.getString("TrainName");
		String trainwhat =  rs.getString("TrainWhat");
		String startdate =  rs.getString("StartDate");
		String enddate =  rs.getString("EndDate");
		String trainorgan = rs.getString("TrainOrgan") ;
		String trainresult = rs.getString("TrainResult") ;
		String remark =rs.getString("Remark") ;		
     %>
			
		
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="150" align="center" valign="top">
						<%@ include file="left.jsp"%></td>
					  <td height="500" valign="top"><table width="500" border="1" align="center" cellpadding="4" cellspacing="0" class="default_table">
			            <tr>
				            <td height="40" colspan="2" bgcolor="#CCCCCC" class="login_tittle">查看员工培训记录详细信息：</td>
		                </tr>
				          <tr>
				            <td width="35%" height="30" align="right">员工编号：</td>
				            <td height="30" align="left"><%=employeeid %></td>
		                </tr>
				          <tr>
				            <td height="30" align="right">培训名称：</td>
				            <td height="30" align="left"><%=trainname %></td>
		                </tr>
				          <tr>
				            <td height="30" align="right">培训内容：</td>
				            <td height="30" align="left"><%=trainwhat %></td>
		                </tr>
				          <tr>
				            <td height="30" align="right">开始日期：</td>
				            <td height="30" align="left"><%=startdate %></td>
		                </tr>
				          <tr>
				            <td height="30" align="right">结束日期：</td>
				            <td height="30" align="left"><%=enddate %></td>
		                </tr>
				          <tr>
				            <td height="30" align="right">培训单位：</td>
				            <td height="30" align="left"><%=trainorgan %></td>
		                </tr>
				          <tr>
				            <td height="30" align="right">培训结果：</td>
				            <td height="30" align="left"><%=trainresult %></td>
		                </tr>
				          <tr>
				            <td height="30" align="right">备注：</td>
				            <td height="30" align="left"><%=remark %></td>
		                </tr>
				          <tr>
				            <td height="30" colspan="2" align="center"><input name="button" type="button" id="button" value="返回" onClick="javascript:history.back()"></td>
		                </tr>
			            </table>
			          <p>&nbsp;</p></td>
					</tr>
				</table>
	   <%
    	}
		rs.close();
		bd.closeCon();
	}catch(SQLException e)
	{
		out.println(e.getMessage());
	}
 %></td>
		</tr>


		<tr>
			<td><%@ include file="../inc/bottom.jsp"%>
			</td>
		</tr>
		
	</table>
</body>
</html>
