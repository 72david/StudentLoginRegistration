<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.util.* ,java.sql.*" %>
  
<!DOCTYPE html>
<html>
<head>
<style>
	body{
		background-color:white;
	}
     td,th,table{
        border:1px solid;
      }
      td{
      padding:5px;
      }
      th{
      padding:10px;
      }
    table{
    background-color:lightgrey;
        width:75%;
        margin:50px 10%;
        border-collapse: collapse;
      }
       a{
           text-decoration: none;
           curser:none;
            }
      .back{
      	
      	
      	margin:0 0 5mm 80%;
      	font-wieght:800;
      }
        </style>
<meta charset="ISO-8859-1">
<title>Student-info</title>
</head>
<body>

<h1 align="center">Student Information</h1>

 <table>
 	 <tr>
 	 <!-- Student Data  Headings -->
 	 	<th>S.No</th>
        <th>Name</th>
        <th>Father Name</th>
        <th>Date Of Birth</th>
        <th>Mobile Number</th>
        <th>City</th>
        <th>Gender</th>
     </tr>
<%
final String url="jdbc:mysql://localhost:3306/mydb";
final String user="admin";
final String pass="4013";
Connection con;
Statement st;
ResultSet rs;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	
	 con=DriverManager.getConnection(url,user,pass);
	  st=con.createStatement();
	 rs=st.executeQuery("select * from student");
	 int s_no=0;//serial number for the table 
	 //getting value from database
	 while(rs.next()) {
		 
		 if(rs.getString("Profession").equals("admin"))
			 continue;
		 String Name,FatherName,City,Gender,Profession;
		 
		 Name=rs.getString("Name");
		 FatherName=rs.getString("FatherName");
		 City=rs.getString("City");
		 Gender=rs.getString("Gender");
		 String no=rs.getString("MobileNumber");
		 String dob=rs.getString("DateOfBirth");
		 
		 s_no++;
		 //values are displayed in the web table
		 %>
		 <tr>
		 	<td><%=s_no %></td>
            <td><%=Name %></td>
            <td><%=FatherName %></td>
             <td><%=dob %></td>
            <td><%=no %></td>
            <td><%=City %></td>
            <td><%=Gender %></td>
         </tr>
        
	<% }
	 
	} catch (Exception e) {
		out.print("error in display data");
	}
%>

</table>
 <a href="loginpage.jsp"><div class="back">Back</div></a>     
</body>
</html>