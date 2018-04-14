package myservlet; 
/* *登录控制 */ 
import java.io.*;
import javax.servlet.*; 
import javax.servlet.http.*;
import java.sql.*;//导包
import mybean.BaseDAO;//导入对数据库操作的封装类 BaseDAO 
public class EmpServlet extends HttpServlet { 
	public void doGet(HttpServletRequest request, HttpServletResponse response) 	
			 throws ServletException, IOException {//jsp 页面如果采用 get 提交方式，调用这 个方法 
		doPost(request,response);//调用 doPost 的方法 
	}
	 public void doPost(HttpServletRequest request, HttpServletResponse response) 
			 throws ServletException, IOException { 
		 response.setContentType("text/html;charset=utf-8");//设置页面的编码为 utf-8 
		 PrintWriter out = response.getWriter();//得到 out 对象 
		  try { 
			  
			  String username = null ;//定义一个用户名的字符串    
			  String password = null ;//定义一个密码的字符串    
			  HttpSession session = null ; //创建 session 对象 
			  session = request.getSession(true);//得到 session 对象 
			  username = request.getParameter("username");//获取表单中输入的用户名   
			  password = request.getParameter("password"); //获取表单中输入的密码 
			  BaseDAO bd=new BaseDAO();//创建数据库操作对象 bd  
			  String sql="select * from users where UserName='"+username+"' and Password='"+password+ "'";  //查询数据库中是否有记录与我们输入的有户名与密码一致     
			  ResultSet rs= bd.getRs(sql); //创建结果集对象 rs   
			  if(rs.next()){       
				  session.setAttribute("userName", username); // 把 username 存 放 到 userName   
				  //response.sendRedirect("default.jsp");    
        RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");  // 转发到 index.jsp 页面    
        dispatcher.forward(request, response); 
			  }else{   
				  out.print("<script Lanuage='JavaScript'>window.alert('用户名、密码或用户类  型不正确，即将返回登录页面')</script>"); //弹出警告
				   out.print("<script Lanuage='JavaScript'>window.location ='login.jsp'</script>");//使页面转向到 login.jsp 页面     
				   
				   }  
			  bd.closeCon(); //调用 closeCon()方法，关闭对象，释放资源    
			  }  
			  
			  catch(SQLException e)   {    out.println(e.getMessage());  
			  } 
		  } 
		  } 
	 