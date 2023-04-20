package backends;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.sql.*;

import java.io.*;

@WebServlet("/backend")
public class backend extends HttpServlet{
	
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
    	final String url="jdbc:mysql://localhost:3306/mydb";
		final String user="admin";
		final String pass="4013";
		
		 ResultSet rs;
		 Connection con;
		 String mno="";
		 String profession="";
		 //getting parameter from server
    		String name=request.getParameter("uid");
        	String mobile_no=request.getParameter("pass");
        	PrintWriter out=response.getWriter();
        	
    		try {
    			Class.forName("com.mysql.cj.jdbc.Driver");
    		} catch (ClassNotFoundException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		
			try {
				 con = DriverManager.getConnection(url,user,pass);
				 Statement st=con.createStatement();
				 //mainly taking name and check the name and mobile number in data base
	    		  rs=st.executeQuery("select * from student where Name='"+name+"'");
	    		  
	    		  rs.next();
	    		  
	    		  mno=rs.getString("MobileNumber");
	    		 
	    		  profession=rs.getString("Profession");
	    		  
			} catch (SQLException e){out.print(e);
			}
			
			if(mno.equals(mobile_no) )
        		response.sendRedirect("admin.jsp");//mobile number equals name match with database
        	else
        		response.sendRedirect("loginpage.jsp");//Mobile number not equal then same page displayed
        		
    }
   
}
