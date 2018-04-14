package myservlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import mybean.BaseDAO;
public class ModTrain extends HttpServlet {
public void doGet(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {
doPost(request,response);
}
public void doPost(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {
response.setContentType("text/html;charset=utf-8");
PrintWriter out = response.getWriter();
request.setCharacterEncoding("utf-8");
try {
String TrainNO = request.getParameter("TrainNO") ;
String employeeid = request.getParameter("employeeid") ;
String trainname = request.getParameter("trainname") ;
String trainwhat = request.getParameter("trainwhat") ;
String startdate = request.getParameter("startdate") ;
String enddate = request.getParameter("enddate") ;
String trainorgan = request.getParameter("trainorgan") ;
String trainresult = request.getParameter("trainresult") ;
String remark = request.getParameter("remark") ;
BaseDAO bd = new BaseDAO();
String sql = "update train set TrainName='" + trainname
+ "',TrainWhat='" + trainwhat + "',StartDate='"
+ startdate + "',EndDate='" + enddate + "'";
sql += ",TrainOrgan='" + trainorgan + "',TrainResult='" +
trainresult + "'";
sql += ",Remark='" + remark + "'where TrainNO=" + TrainNO;
int n = bd.Exec(sql);
if (n == 1) {
out.print("<script Lanuage='JavaScript'>window.alert(' 修改成功，即将返回员工培训管理页面')</script>");
out.print("<script Lanuage='JavaScript'>window.location='train/manageTrain.jsp'</script>");
} else {
out.print("<script Lanuage='JavaScript'>window.alert(' 修改失败，即将返回修改员工培训记录页面')</script>");
 out.print("<script Lanuage='JavaScript'>window.location='train/modTrain.jsp?id=" + TrainNO + "'</script>");
}
bd.closeCon();
} catch (Exception e) {
throw new ServletException(e.toString());
}
}
}