<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.regex.* ,java.sql.*,java.util.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <style>
        input{
        padding-left:10px;
        }
            input,select{
                margin-left: 10px;
                height: 20px;
                border-radius: 20px;
            }
           .form_container{
            display:flex;
            flex-direction: column;
            width:70%;
            margin-left: 15%;
            align-items: center;
            justify-content: center;
            padding:20px;
            border-radius: 10px;
            background-color: rgb(86, 182, 214);
           }
           .labels{
                margin-top: 25px;
           }
           #ufname,#ulname{
            margin-left: 55px;
           }
           .date_label_container{
                display:flex;
                flex-direction: row;
                }
           #udob{
           	display:flex;
            flex-direction: row;
            margin-left: 40px;
           }
           #ufathername{
            margin-left: 40px;
           }
           #umobileno{
            margin-left: 20px;
           }
           #ugender{
            margin-left: -30px;
           }
           #ucity{
            margin-left: 94px;
           }
           #input_submit{
            color: rgb(240, 242, 255);
            border-color:rgb(26, 26, 238) ;
            background-color: rgb(56, 56, 221);
            height: 30px;
            padding: 0 15px;
           }
            .back{
	      	margin:20px 0 5mm 85%;
	      	font-wieght:800;
	      	font-size:25px;
      }
        </style>
        <title>Register</title>
    </head>
    <body>
   
    
        <div id="container">
            <h1 align="center">Student Registration</h1>
            <form action="#">
                <div class="form_container">
                <div id="ufname" class="labels">
                    <label for="uname">First Name</label>
                     <input id="input_uid" type="text" name="ufname" >
                    
                  </div>
                  <div class="labels" id="ulname">
                    <label for="ulname">Last Name</label>
                    <input id="input_uid" type="text" name="ulname" >
                </div>
                   <div class="labels" id="udob">
                    <div class="date_label_contanier">
                    <div><label >Date of Birth</label></div>
                <div><label style="font-size:12px;">(DD-MM-YYYY)</label></div></div>
                    <div><input type="text" name="dob" id="input_dob"></div>
                  </div>
                  <div id="ufathername" class="labels">
                    <label for="fathername">Father Name</label>
                     <input id="input_fname" type="text" name="fathername">
                </div> 
               
                <div class="labels" id="ugender">
                    <label>Gender</label>
                	<select for="ugender" name="gender">
                        <option></option>
                		<option>Male</option>
                        <option>Female</option>
                        <option>Other</option>
                	</select>
                </div>
                <div class="labels" id="umobileno">
                    <label>Mobile Number</label>
                    <input type="text" name="mobilenumber" id="input_mobileno">
                </div>
                <div id="ucity" class="labels">
                    <label for="ucity">City</label>
                     <input id="input_uid" type="text" name="ucity" >
                </div>
                <div id="submit" class="labels"><input  id="input_submit" type="submit" name="submit" value="Register"></div>             
            </div>
            </form>
			<%
			    if(request.getParameter("submit")!=null){
			    	
					String fname,lname,city,fathername,mobileno,gender,dob,name,day,month,year;//string variables
					fname=request.getParameter("ufname");
					lname=request.getParameter("ulname");
					fathername=request.getParameter("fathername");
					city=request.getParameter("ucity");
					gender=request.getParameter("gender");
					mobileno=(String)request.getParameter("mobilenumber");
					dob=(String)request.getParameter("dob");
					
					name=(!lname.equals(""))?fname+" "+lname:fname;//first name+last name
					
					//pattern for validate the information
                	Pattern p=Pattern.compile("[^a-zA-Z\\s]");
                	Pattern pm=Pattern.compile("[6-9][0-9]{9}");
                	Pattern pdob=Pattern.compile("([0-3][0-9])-([0-1][0-9])-([2][0][0-2][0-9])");
                	
                	Matcher mname,mfather,mcity,mmobile,mdob;//matcher variables
                	//matcher for validate the data
                	mname=p.matcher(name);
                	mfather=p.matcher(fathername);
                	mcity=p.matcher(city);
                	mmobile=pm.matcher(mobileno);
                	mdob=pdob.matcher(dob);
                	
                	if(mmobile.find() &&  mobileno.length()==10){};  //identify valid mobile no 
  
                	if(mdob.find()){}else dob=null;//date of birth is not valid date of birth will be null
                	
                	/**
                	* if all data become invalid then alert message displayed for the first data and the page refreshed
                	* if the if-else condition not used alert message displayed one by one
                	* the condition for if and if-else the condition becomes true the data is invalid
                	* all the condition are failed entered value are valid then else part execute 
                	*/
                 	if(mname.find() || name.length()>25 || name.length()<2){
                 		name=null;
                 		//response.sendRedirect("register.jsp");
                 		%><script >alert("!Invalid Name")</script>
                 		<%
                 	}
                 	else if(dob==null){
                 		%><script >alert("!Invalid Date Of Birth")</script>
                 		<%
                 	}
                 	else if(mfather.find() || fathername.length()>25 || fathername.length()<2){
                 		fathername=null;
                 		%><script >alert("!Invalid Father Name")</script>
                 		<%
                 	}
                 	else if(gender.equals("")){
                 		gender=null;
                 		%><script >alert("!Select your gender")</script>
                 		<%
                 	}
                 	else if(mobileno==null){
                 		%><script >alert("!Invalid Mobile Number")</script>
                 		<%
                 	}
                 	else if(mcity.find() || city.length()>25 || city.length()<2){
                 		city=null;
                 		%><script >alert("!Invalid City Name")</script>
                 		<%
                 	}             	
                 	else{
                
                 //insert value in data base
				final String url="jdbc:mysql://localhost:3306/mydb";
				final String user="admin";
				final String pass="4013";
				Connection con;
				Statement st;
				
				boolean next=false;
				String no="";
				
				day=dob.substring(0,2);
				month=dob.substring(3, 5);
				year=dob.substring(6);
				String dateofbirth=year+"-"+month+"-"+day;
				try{
				Class.forName("com.mysql.cj.jdbc.Driver");}catch(Exception e){ out.print("driver error");}
				con=DriverManager.getConnection(url,user,pass);
			    st=con.createStatement();
					
				//checking the entered name in the data base. name in the DB get the mobilenumber 
				try{
					 
				ResultSet rs=st.executeQuery("select * from student where Name='"+name+"'");
				if(rs.next())
				no=rs.getString("MobileNumber");
				}catch(Exception e){out.print("name error");}
				//if the entered mobilenumber and name already in DB alert message displayed
				if(next){
	    		  	if(no.equalsIgnoreCase(mobileno))
	    			  	%><script >alert("!Already Registered")</script><%
	    			else{
	    				//name in DB and mobile number not in then this statement executed
	    	    			 String query="insert into student(Name,DateOfBirth,MobileNumber,FatherName,City,Gender,Profession)"
	    	    		                + "values(?,?,?,?,?,?,'Student')";
	    	    			  PreparedStatement ps=con.prepareStatement(query);
	    	    			  ps.setString(1,name);
	    	    			  ps.setString(2,dateofbirth);
	    	    			  ps.setString(3, mobileno);
	    	    			  ps.setString(4, fathername);
	    	    			  ps.setString(5, city);
	    	    			  ps.setString(6,gender);
	    	    			  ps.executeUpdate();
	    	    			 
	    	    		  }
	    		  	
	    		  		}
	    		 else{
	    			 
	    			 //if name is not in DB then this set of condition executed
	    			  String query="insert into student(Name,DateOfBirth,MobileNumber,FatherName,City,Gender,Profession)"
	    	    		                + "values(?,?,?,?,?,?,'Student')";
	    	    			  PreparedStatement ps=con.prepareStatement(query);
	    	    			 
	    			  try{
	    				  ps.setString(1,name);
    	    			  ps.setString(2,dateofbirth);
    	    			  ps.setString(3, mobileno);
    	    			  ps.setString(4, fathername);
    	    			  ps.setString(5, city);
    	    			  ps.setString(6,gender);
    	    			  System.out.print(query);
    	    			  ps.executeUpdate();
	    			 
	    			  }catch(Exception e){out.print("errror");}
	    			  finally{
	    				  response.sendRedirect("loginpage.jsp");
	    			  }
	    		   }		
				
				}    	
			}
				
			%>
			
        </div>
        <a href="loginpage.jsp"><div class="back">Back</div></a>
    </body>
</html>