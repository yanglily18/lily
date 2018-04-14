<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../inc/tittle.jsp" %>
<%@ include file="..\inc\checks.jsp"%>
<%@ include file="..\inc\utf8.jsp"%>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope="page" />
<%

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title><%=tittlestr %>_添加员工培训记录</title>

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

<script Language="javaScript">

function check_input(theForm)
{
  if (theForm.employeeid.value == "")
  {
    alert("请选择员工编号。");
    theForm.employeeid.focus();
    return (false);
  }  
  if (theForm.trainwhat.value == "")
  {
    alert("请输入培训内容。");
    theForm.trainwhat.focus();
    return (false);
  }
  if (theForm.startdate.value == "")
  {
    alert("请输入开始日期。");
    theForm.startdate.focus();
    return (false);
  }
  if (theForm.enddate.value == "")
  {
    alert("请输入结束日期。");
    theForm.enddate.focus();
    return (false);
  }  
  if (theForm.trainorgan.value == "")
  {
    alert("请输入培训单位。");
    theForm.trainorgan.focus();
    return (false);
  }
  if (theForm.trainresult.value == "")
  {
    alert("请输入培训结果。");
    theForm.trainresult.focus();
    return (false);
  }
  
  return (true);
}

</script>

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
     
     %>	
     
     
			
		
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="150" align="center" valign="top">
						<%@ include file="left.jsp"%></td>
						<td height="500" align="center" valign="top"><form name="form1" method="post" action="addTrain" onSubmit="return check_input(this)">
						  <table width="500" border="1" align="center" cellpadding="4" cellspacing="0" class="default_table">
						    <tr>
						      <td height="48" colspan="2" bgcolor="#CCCCCC" class="login_tittle">添加员工培训记录详细信息( &nbsp;<span class="modTrain_text">*</span>表示必填)：</td>
					        </tr>
						    <tr>
						      <td width="35%" height="30" align="right">员工编号：</td>
						      <td height="30" align="left"><select name="employeeid" id="employeeid">
					            <option value="">==请选择员工编号==</option>
						         <%
 ResultSet rs=null; 
 try{
       String sql = "SELECT EmployeeID FROM employee order by EmployeeID asc";
       rs=bd.getRs(sql);
        while(rs.next()){
        String EmployeeID = rs.getString("EmployeeID");
%>
<option value=<%=EmployeeID %>><%=EmployeeID %></option>
<%}%>
				              </select></td>
					        </tr>
						    <tr>
						      <td height="30" align="right">培训名称：</td>
						      <td height="30" align="left"><input name="trainname" type="text" id="trainname" size="20" maxlength="20">
					         &nbsp;<span class="modTrain_text">*</span></td>
					        </tr>
						    <tr>
						      <td height="30" align="right">培训内容：</td>
						      <td height="30" align="left"><input name="trainwhat" type="text" id="trainwhat" size="20" maxlength="20">
&nbsp;<span class="modTrain_text">*</span></td>
					        </tr>
						    <tr>
						      <td height="30" align="right">开始日期：</td>
						      <td height="30" align="left"><input name="startdate" type="text" id="startdate" size="20" maxlength="20">
					         &nbsp;<span class="modTrain_text">*</span></td>
					        </tr>
						    <tr>
						      <td height="30" align="right">结束日期：</td>
						      <td height="30" align="left"><input name="enddate" type="text" id="enddate" size="20" maxlength="20">
					        &nbsp;<span class="modTrain_text">*</span></td>
					        </tr>
						    <tr>
						      <td height="30" align="right">培训单位：</td>
						      <td height="30" align="left"><input name="trainorgan" type="text" id="trainorgan" size="20" maxlength="20">
					         <span class="modTrain_text">&nbsp;*</span></td>
					        </tr>
						    <tr>
						      <td height="30" align="right">培训结果：</td>
						      <td height="30" align="left"><select name="trainresult" id="trainresult">
						        <option value="优">优</option>
						        <option value="良" selected>良</option>
						        <option value="及格">及格</option>
						        <option value="差">差</option>
					          </select>
					           </td>
					        </tr>
						    <tr>
						      <td height="30" align="right">备注：</td>
						      <td height="30" align="left"><textarea name="remark" cols="30" rows="4" id="remark"></textarea></td>
					        </tr>
						    <tr>
						   <td height="30" colspan="2" align="center"><input name="button" type="submit" id="button" value="添加" >
						        &nbsp;
						        <input name="button2" type="reset" id="button2" value="取消" >
					            &nbsp;
					          <input name="button3" type="button" id="button3" value="返回" onClick="javascript:history.back()"></td>
					        </tr>
					      </table>
					    </form></td>
					</tr>
				</table>
	     <%
				rs.close();
				bd.closeCon(); 
				}catch(SQLException e){ 
				out.print(e.getMessage()); 
 
				}
				 %>
				
				
			</td>
		</tr>


		<tr>
			<td><%@ include file="../inc/bottom.jsp"%>
			</td>
		</tr>
		
	</table>
</body>
</html>
