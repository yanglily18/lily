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

<title><%=tittlestr %>_培训管理</title>

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
     try
     {
     String strsql="select * from train";
     ResultSet rs=bd.getRs(strsql);//分页
     %>
			
		
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="150" align="center" valign="top">
						<%@ include file="left.jsp"%></td>
						<td height="500" valign="top">
						<table width="90%" border="1" align="center" cellpadding="0" cellspacing="0" class="default_table">
								<tr>
									<td width="16%" height="40" align="center">员工编号</td>
									<td width="16%" height="40" align="center">培训名称</td>
									<td width="16%" height="40" align="center">开始日期</td>
									<td width="16%" height="40" align="center">结束日期</td>
									<td width="16%" height="40" align="center">培训单位</td>
									<td width="16%" height="40" align="center">操作</td>
								</tr>

<%	
							
        int p; 
        int pagecount=4;
        int p2=1;
        int rowcount; 
        int intpagecount;
        String page1=request.getParameter("page");
       if(page1==null){          
        p=1;                 
         }                  
         else          {          
          p=Integer.parseInt(page1);          
                    }     
                     rs.last();        
                      rowcount = rs.getRow();        
                       intpagecount = (rowcount + pagecount - 1)/pagecount;         
                       if(p>intpagecount) p=intpagecount;         
                       if(p<1) p=1;        
                        rs.beforeFirst();    
                        while(rs.next()){  
                        if(p2>(p-1)*pagecount&&p2<=p*pagecount){ 
         %>


			<tr>
			<td width="16%" height="30" align="center"><%=rs.getString("EmployeeID") %></td>
			<td width="16%" height="30" align="center"><%=rs.getString("TrainName") %></td>
			<td width="16%" height="30" align="center"><%=rs.getString("StartDate") %></td>
			<td width="16%" height="30" align="center"><%=rs.getString("EndDate") %></td>
			<td width="16%" height="30" align="center"><%=rs.getString("TrainOrgan") %></td>
			<td width="16%" height="30" align="center"><a href="${pageContext.request.contextPath}/train/viewTrain.jsp?id=<%=rs.getString("TrainNO") %>">详细</a>&nbsp; <a href="${pageContext.request.contextPath}/train/modTrain.jsp?id=<%=rs.getString("TrainNO")%>">修改</a></a>&nbsp; <a href="#">删除</a>
									
						  </tr>

								<%
        }
        p2++;
        }
         %>




							</table> <br>
							
	                        <form action="" method="post" name="form1" id="form1">
	                          <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0">
	                            <tr>
	                              <td width="65%" align="right">第<%=p %>页  共<%=intpagecount %>页
	                              <% if(p>1){ %>
	                                <a  href="${pageContext.request.contextPath}/train/manageTrain.jsp?page=1">  第 一 页 </a> 
	                                <a href="${pageContext.request.contextPath}/train/manageTrain.jsp?page=<%=p-1%>">上一页</a>   
	              <% } %>
	                               <%if(p<intpagecount){ %>  
	                               <a href="${pageContext.request.contextPath}/train/manageTrain.jsp?page=<%=p+1%>">下一页</a>    
	                             <a href="${pageContext.request.contextPath}/train/manageTrain.jsp?page=<%=intpagecount %>">最后一页</a></td>    
	                               <%} %>        
	                               <td align="left">&nbsp;&nbsp;&nbsp;转到第          
	                                 <input name="page" type="text" id="page" size="3">         
	                                                                                                         页         
	                                 <input name="button" type="submit" class="manageTrain_go" id="button" value="GO">
	                              
	                              </td>
	                              
                                </tr>
                              </table>
                          </form></td>
					</tr>
				</table>
				<%
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
