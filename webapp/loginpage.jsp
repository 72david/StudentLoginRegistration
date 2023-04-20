<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body{
                background-image: linear-gradient(to right, #DECBA4, #3E5151);
                font-family:serif;
            }
            #container{
                display:flex;
                align-items: center;
                justify-content: center;
                margin-top:50px;
            }
            form{
                border-radius:25px ;
                width:40%;
                padding:10px 25px;
                background-image: linear-gradient(-20deg, #00cdac 0%, #8ddad5 100%);
            }
            #submit,#uid,#pass{
                display:flex;
                align-items: center;
                justify-content: center;
                margin:30px 0;
            }
            #input_uid, #input_pass{
                padding:0 0 0 5px;
                border-radius: 10px;
                height: 25px;
                width:200px;
            }
            #pass{
            	margin-left:-3mm;
            }
            #input_submit{
                font-size: 13px;
                font-weight: 700;
                color:white;
                background-color: rgb(94, 94, 228);
                width:60px;
                border:none;
                padding:10px;
                border-radius: 25px;
                margin-bottom:-20px;
            }
            #register{
                font-size: 19px;
                font-weight: 700;
                color:rgb(17, 94, 238);
            }
            a{
                text-decoration: none;
            }
            label{
                margin:0 10px 0 0;
            }
        </style>
        <title>LoginPage</title>
    </head>
    <body>
    <h1 align="center">Student Login</h1>
        <div id="container">
        
            <form action="backend" method="post">
                <div id="uid" style="margin-left: 50px;">
                    <label for="uid">Name</label>
                     <input id="input_uid" type="text" name="uid" >
                </div>
                <div id="pass">
                    <label for="pass">Mobile Number</label>
                     <input id="input_pass" name="pass">
                </div> 
                <div id="submit"><input  id="input_submit" type="submit" name="submit" value="Login"></div>             
                <div style="margin:10px;" align="center">or</div>
                
                <a href="register.jsp" ><div id="register" align="center">Register</div></a>     
                
            </form>
        </div>
    </body>
</html>