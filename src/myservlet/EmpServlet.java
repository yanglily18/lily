package myservlet; 
/* *��¼���� */ 
import java.io.*;
import javax.servlet.*; 
import javax.servlet.http.*;
import java.sql.*;//����
import mybean.BaseDAO;//��������ݿ�����ķ�װ�� BaseDAO 
public class EmpServlet extends HttpServlet { 
	public void doGet(HttpServletRequest request, HttpServletResponse response) 	
			 throws ServletException, IOException {//jsp ҳ��������� get �ύ��ʽ�������� ������ 
		doPost(request,response);//���� doPost �ķ��� 
	}
	 public void doPost(HttpServletRequest request, HttpServletResponse response) 
			 throws ServletException, IOException { 
		 response.setContentType("text/html;charset=utf-8");//����ҳ��ı���Ϊ utf-8 
		 PrintWriter out = response.getWriter();//�õ� out ���� 
		  try { 
			  
			  String username = null ;//����һ���û������ַ���    
			  String password = null ;//����һ��������ַ���    
			  HttpSession session = null ; //���� session ���� 
			  session = request.getSession(true);//�õ� session ���� 
			  username = request.getParameter("username");//��ȡ����������û���   
			  password = request.getParameter("password"); //��ȡ������������� 
			  BaseDAO bd=new BaseDAO();//�������ݿ�������� bd  
			  String sql="select * from users where UserName='"+username+"' and Password='"+password+ "'";  //��ѯ���ݿ����Ƿ��м�¼������������л���������һ��     
			  ResultSet rs= bd.getRs(sql); //������������� rs   
			  if(rs.next()){       
				  session.setAttribute("userName", username); // �� username �� �� �� userName   
				  //response.sendRedirect("default.jsp");    
        RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");  // ת���� index.jsp ҳ��    
        dispatcher.forward(request, response); 
			  }else{   
				  out.print("<script Lanuage='JavaScript'>window.alert('�û�����������û���  �Ͳ���ȷ���������ص�¼ҳ��')</script>"); //��������
				   out.print("<script Lanuage='JavaScript'>window.location ='login.jsp'</script>");//ʹҳ��ת�� login.jsp ҳ��     
				   
				   }  
			  bd.closeCon(); //���� closeCon()�������رն����ͷ���Դ    
			  }  
			  
			  catch(SQLException e)   {    out.println(e.getMessage());  
			  } 
		  } 
		  } 
	 