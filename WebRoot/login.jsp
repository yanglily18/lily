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
    
    <title><%=tittlestr%>登录</title>
    
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
  
  <body class="login_body">
  <table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="login_table">
    <tr>
      <td height="60" class="login_top">&nbsp;</td>
    </tr>
    <tr>
      <td height="480" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="10%">&nbsp;</td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="60"><img src="images/logo_mitu_big2.gif" width="300" height="60"></td>
            </tr>
            <tr>
              <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="50%"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="login_font1">
                    <tr>
                      <td width="11"><img src="images/134.gif" width="11" height="12"></td>
                      <td height="40">员工档案管理：添加,管理,查询员工档案信息</td>
                    </tr>
                    <tr>
                      <td><img src="images/134.gif" width="11" height="12"></td>
                      <td height="40">员工培训管理：添加,管理,查询员工培训记录</td>
                    </tr>
                    <tr>
                      <td><img src="images/134.gif" width="11" height="12"></td>
                      <td height="40">员工职称管理：添加,管理,查询员工职称信息</td>
                    </tr>
                    <tr>
                      <td><img src="images/134.gif" width="11" height="12"></td>
                      <td height="40">员工奖惩管理：添加,管理,查询员工奖惩记录</td>
                    </tr>
                    <tr>
                      <td><img src="images/134.gif" width="11" height="12"></td>
                      <td height="40">员工调动管理：添加,管理,查询员工调动情况</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="30">&nbsp;</td>
                    </tr>
                  </table></td>
                  <td valign="top"><form name="form1" method="post" action="EmpServlet_login">
                    <table width="90%" border="0" cellpadding="0" cellspacing="0" class="login_font1">
                      <tr>
                        <td height="60" colspan="2" align="left" valign="middle" class="login_tittle">系统登录</td>
                      </tr>
                      <tr>
                        <td width="35%" height="35" align="right">用户名：</td>
                        <td height="35" align="left"><input name="username" type="text" id="username" size="15"></td>
                      </tr>
                      <tr>
                        <td height="35" align="right"> 密 码：</td>
                        <td height="35" align="left"><input name="password" type="text" id="password" size="15"></td>
                      </tr>
                      <tr>
                        <td height="35" colspan="2" align="center"><input name="button" type="submit" class="login_bottom" id="button" value="登录">
                          &nbsp;
                          <input name="button2" type="reset" class="login_bottom" id="button2" value="取消"></td>
                        </tr>
                    </table>
                  </form>
                  </td>
                </tr>
            </table></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
          </table></td>
          <td width="10%">&nbsp;</td>
        </tr>
      </table></td>
    </tr>
    <tr class="login_botton">
      <td height="30" align="center" class="login_botton">Copyright &nbsp;&copy;2016广州商学院</td>
    </tr>
  </table>
  </body>
</html>
