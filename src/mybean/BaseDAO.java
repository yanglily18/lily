package mybean;//�ļ����ڵİ� 
import java.sql.*; 
import javax.naming.Context; 
import javax.naming.InitialContext; 
import javax.sql.*;//����
 public class BaseDAO { 
    Connection con;//����һ�����Ӷ���
    Statement stm = null;//����һ�����ݿ��������
    ResultSet rs = null;//����һ�����������
    String connstr;//����һ���������ݿ�� URL ����     
String strUser = "";//����һ���������ݿ���û���   
  String strPassword="";//����һ���������ݿ������ 
public Connection getConnection() throws Exception 
{ 
 try 
{ 
	 connstr="jdbc:mysql://localhost:3306/hrms";
	 //���� mysql ���ݿ� hrms �� URL 
	 strUser="root"; 
	 strPassword=""; 

Class.forName("com.mysql.jdbc.Driver");//���� mysql ����������
 con = DriverManager.getConnection(connstr,strUser,strPassword); 
 } 
   catch (Exception e) { 
  System.out.println(e) ; 
 } 
 return con;//���� con
 }   
 public int Exec(String sql){
	 //���������Ӧ��ӡ�ɾ�����޸ĵĲ���   
  int n = 0;// ����ִ����Ӱ��������ı���    
  try{      
	  con=getConnection();  
	  stm = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
// �� һ��������ʾ��������α���������ƶ��������ݿ�仯ʱ����ǰ��������䣬�ڶ������� ��ʾ�����ý�����������ݿ��еı�       
  n = stm.executeUpdate(sql);  //ִ�� sql ���   
   }
catch(Exception e){         
  System.out.print(e.toString());  
     }     
  return n;//������Ӱ�������
  } 
public ResultSet getRs(String sql) throws SQLException{//���������Ӧ��ѯ�Ĳ���  
        try{         
  con=getConnection();   
  stm = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY); 
  rs=stm.executeQuery(sql);//ִ�� sql ���      
     return rs;//���ؽ�������� 
     }    
   catch(Exception e){      
    System.out.print(e);      
    return null;    
   }  }  
public void closeCon() {//���պ���ȳ�ԭ��ر������Ķ��� 
 try  {  
 if (rs!=null)   
 rs.close();//�رս�������� 
 } 
 catch(Exception e)  { 
  e.printStackTrace();//����쳣����ջ�켣 
 }  try  {   
if (stm!=null) stm.close();//�ر����ݿ�������� 
 } 
 catch(Exception e) 
 {  
 e.printStackTrace();
  }  
 try 
 {   
if (con!=null)   
	con.close();//�ر����ݿ����Ӷ��� 
 }  
 catch(Exception e) 
 {  
 e.printStackTrace(); 
 }
 }
 } 
