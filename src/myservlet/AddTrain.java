
package myservlet;
/*
*添加员工培训记录信息
*/
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import mybean.BaseDAO;

public class AddTrain extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
doPost(request, response);
}
public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
response.setContentType("text/html;charset=utf-8");
PrintWriter out = response.getWriter();
request.setCharacterEncoding("utf-8");
String employeeid = request.getParameter("employeeid") ;
String trainname = request.getParameter("trainname") ;
String trainwhat = request.getParameter("trainwhat") ;
String startdate = request.getParameter("startdate") ;
String enddate = request.getParameter("enddate") ;
String trainorgan = request.getParameter("trainorgan") ;
String trainresult = request.getParameter("trainresult") ;
String remark = request.getParameter("remark") ;
try {
BaseDAO bd = new BaseDAO(); 
 String sql3="insert into train(EmployeeID,TrainName,TrainWhat,StartDate,EndDate,TrainOrgan,TrainResult,Remark) values('";
 sql3 += employeeid + "','" + trainname + "','" + trainwhat +
"','" + startdate + "','" + enddate + "','";
 sql3 += trainorgan + "','" + trainresult + "','" + remark + "')" ;
 int n = bd.Exec(sql3);
 if(n==1){
 out.print("<scriptLanuage='JavaScript'>window.alert('添加成功，即将返回培训管理页面')</script>");
 out.print("<script Lanuage='JavaScript'>window.location='train/manageTrain.jsp'</script>");
 }
 else{
 out.print("<script Lanuage='JavaScript'>window.alert('添加失败，即将返回添加页面')</script>");
 out.print("<script Lanuage='JavaScript'>window.location='train/addTrain.jsp'</script>");
 }
bd.closeCon();
} catch (Exception e) {
throw new ServletException(e.toString());
}
}
}