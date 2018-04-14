<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../inc/tittle.jsp" %>
<%@ include file="..\inc\checks.jsp"%>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope="page" />
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title><%=tittlestr %>_员工培训记录修改</title>

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
  if (theForm.trainname.value == "")
  {
    alert("请输入培训名称。");
    theForm.trainname.focus();
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
     try{
        String id = "";
		id = request.getParameter("id");		
		String strSql="SELECT * FROM train where TrainNO='" + id + "'";
		ResultSet rs=bd.getRs(strSql);
		while(rs.next()){
		String employeeid =  rs.getString("EmployeeID");
		String trainname = rs.getString("TrainName");
		String trainwhat =  rs.getString("TrainWhat");
		String startdate =  rs.getString("StartDate");
		String enddate =  rs.getString ("EndDate");
		String trainorgan = rs.getString("TrainOrgan") ;
		String trainresult = rs.getString("TrainResult") ;
		String remark =rs.getString("Remark") ;		
     
     %>	
     
     
			
		
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="150" align="center" valign="top">
						<%@ include file="left.jsp"%></td>
						<td height="500" align="center" valign="top"><form name="form1" method="post" action="ModTrain" onSubmit="return check_input(this)">
						  <table width="500" border="1" align="center" cellpadding="4" cellspacing="0" class="default_table">
						    <tr>
						      <td height="48" colspan="2" bgcolor="#CCCCCC" class="login_tittle">查看员工培训记录详细信息( &nbsp;<span class="modTrain_text">*</span>表示必填)：</td>
					        </tr>
						    <tr>
						      <td width="35%" height="30" align="right">员工编号：</td>
						      <td height="30" align="left"><input name="employeeid" type="text" id="employeeid" value="<%=employeeid %>" size="10" maxlength="6" readonly></td>
					        </tr>
						    <tr>
						      <td height="30" align="right">培训名称：</td>
						      <td height="30" align="left"><input name="trainname" type="text" id="trainname" value="<%=trainname %>" size="20" maxlength="20">
					         &nbsp;<span class="modTrain_text">*</span></td>
					        </tr>
						    <tr>
						      <td height="30" align="right">培训内容：</td>
						      <td height="30" align="left"><input name="trainwhat" type="text" id="trainwhat" value="<%=trainwhat %>" size="20" maxlength="20">
&nbsp;<span class="modTrain_text">*</span></td>
					        </tr>
						    <tr>
						      <td height="30" align="right">开始日期：</td>
						      <td height="30" align="left"><input name="startdate" type="text" id="startdate" value="<%=startdate %>" size="20" maxlength="20">
					         &nbsp;<span class="modTrain_text">*</span></td>
					        </tr>
						    <tr>
						      <td height="30" align="right">结束日期：</td>
						      <td height="30" align="left"><input name="enddate" type="text" id="enddate" value="<%=enddate %>" size="20" maxlength="20">
					        &nbsp;<span class="modTrain_text">*</span></td>
					        </tr>
						    <tr>
						      <td height="30" align="right">培训单位：</td>
						      <td height="30" align="left"><input name="trainorgan" type="text" id="trainorgan" value="<%=trainorgan %>" size="20" maxlength="20">
					         <span class="modTrain_text">&nbsp;*</span></td>
					        </tr>
						    <tr>
						      <td height="30" align="right">培训结果：</td>
						      <td height="30" align="left"><select name="trainresult" id="trainresult">
						        <option value="优">优</option>
						        <option value="良">良</option>
						        <option value="及格">及格</option>
						        <option value="差">差</option>
						        <option value="<%=trainresult %>" selected="selected"><%=trainresult %></option>
					          </select></td>
					        </tr>
						    <tr>
						      <td height="30" align="right">备注：</td>
						      <td height="30" align="left"><textarea name="remark" cols="30" rows="4" id="remark"><%=remark %></textarea></td>
					        </tr>
						    <tr>
						      <td height="30" colspan="2" align="center"><input name="TrainNO" type="hidden" id="TrainNO" value="<%=id %>">
						        <input name="button" type="submit" id="button" value="修改" > 
					          &nbsp;
					          <input name="button2" type="reset" id="button2" value="放弃" ></td>
					        </tr>
					      </table>
					    </form></td>
					</tr>
				</table>
	     <%
				}
				
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
