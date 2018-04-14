package mybean;//文件所在的包 
import java.sql.*; 
import javax.naming.Context; 
import javax.naming.InitialContext; 
import javax.sql.*;//导包
 public class BaseDAO { 
    Connection con;//声明一个连接对象
    Statement stm = null;//声明一个数据库操作对象
    ResultSet rs = null;//声明一个结果集对象
    String connstr;//定义一个连接数据库的 URL 变量     
String strUser = "";//定义一个连接数据库的用户名   
  String strPassword="";//定义一个连接数据库的密码 
public Connection getConnection() throws Exception 
{ 
 try 
{ 
	 connstr="jdbc:mysql://localhost:3306/hrms";
	 //连接 mysql 数据库 hrms 的 URL 
	 strUser="root"; 
	 strPassword=""; 

Class.forName("com.mysql.jdbc.Driver");//加载 mysql 的驱动程序
 con = DriverManager.getConnection(connstr,strUser,strPassword); 
 } 
   catch (Exception e) { 
  System.out.println(e) ; 
 } 
 return con;//返回 con
 }   
 public int Exec(String sql){
	 //这个方法适应添加、删除、修改的操作   
  int n = 0;// 定义执行所影响的行数的变量    
  try{      
	  con=getConnection();  
	  stm = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
// 第 一个参数表示结果集的游标可以上下移动，当数据库变化时，当前结果集不变，第二个参数 表示不能用结果集更新数据库中的表       
  n = stm.executeUpdate(sql);  //执行 sql 语句   
   }
catch(Exception e){         
  System.out.print(e.toString());  
     }     
  return n;//返回所影响的行数
  } 
public ResultSet getRs(String sql) throws SQLException{//这个方法适应查询的操作  
        try{         
  con=getConnection();   
  stm = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY); 
  rs=stm.executeQuery(sql);//执行 sql 语句      
     return rs;//返回结果集对象 
     }    
   catch(Exception e){      
    System.out.print(e);      
    return null;    
   }  }  
public void closeCon() {//按照后进先出原则关闭声明的对象 
 try  {  
 if (rs!=null)   
 rs.close();//关闭结果集对象 
 } 
 catch(Exception e)  { 
  e.printStackTrace();//输出异常跟踪栈轨迹 
 }  try  {   
if (stm!=null) stm.close();//关闭数据库操作对象 
 } 
 catch(Exception e) 
 {  
 e.printStackTrace();
  }  
 try 
 {   
if (con!=null)   
	con.close();//关闭数据库连接对象 
 }  
 catch(Exception e) 
 {  
 e.printStackTrace(); 
 }
 }
 } 
