<%-- 
    Document   : CustSignUp
    Created on : 2 May, 2019, 11:38:43 PM
    Author     : Kuldeep Raj Tiwari
--%>
<html>
<%@page contentType="text/html" pageEncoding="UTF-8" import="kuldeep.*,Interface.*,SupportClass.*;"%>
<%! ManagementImpl mngt=new ManagementImpl(); 
%>
<head>
    <link rel="icon" type="image/ico" href="image/icon.png">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Customer Login</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
article{
margin-top:2%;
width:100%;
height:25%;
float:left;
background-color:white;
border-top: 1px dotted #888A8A;
border-radius:10px;
}
</style>

</head>

<body oncontextmenu="return false;">
    <%
            if(session.getAttribute("uDetail")!=null){
            response.sendRedirect("CustomerWelcome.jsp");
           }
            if(session.getAttribute("cDetail")!=null){
            response.sendRedirect("CWelcome.jsp");
           }
        %>
<p><img border="0" src="image/onlinelogo.jpg" width="349" height="106;"></p>
<form style="">
        &nbsp;&nbsp;
        <button type="button" onclick="location.href='index.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">Home</button>
        <button type="button" onclick="location.href='CustomerLogin.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">Customer Login</button>
        <button type="button" onclick="location.href='CorLogin.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">Corporate Login</button>	
        <button type="button" onclick="location.href='AboutUs.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">About Us</button>
        <button type="button" onclick="CustomerLogin.jsp" style="font-family: Tempus Sans ITC; font-weight: bold">Contact Us</button>
	<hr>
</form>  
<div style=" width:19.3%;height:auto;background-color:#A9A9A9;margin-left:0.5%;float: left;">
<div style=" background-color:#3E4164;height:auto;width:100%;font-size:20px;margin-left:0.5%;">
    <font color="white" face="Bell MT" size="5">&nbsp;&nbsp;&nbsp;&nbsp;Customer Login<img border="0" src="image/Lock.gif" width="22" height="22"></font></div>
<form method="post" action="authenticate">
    <%   
        if(session.getAttribute("locked")!=null){
            out.println("<p style=\"color: #FF0000\">&nbsp;&nbsp;&nbsp;&nbsp;User temporarily Locked.Try after 1 &nbsp;&nbsp;&nbsp;&nbsp;minute</p>");
            
        }
         else if(session.getAttribute("loginStatus")!=null&&session.getAttribute("loginStatus").equals("0")){
               int attempt=3-(Integer)session.getAttribute("attempt");
               out.println("<p style=\"color: #FF0000\">&nbsp;&nbsp;&nbsp;&nbsp;Login Failed. "+attempt+" attempt remaining </p>");
         }
    %>
	<!--webbot bot="SaveResults" U-File="_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" startspan --><input TYPE="hidden" NAME="VTI-GROUP" VALUE="1"><!--webbot bot="SaveResults" i-checksum="43406" endspan -->
	<p style="margin-bottom:-17px">&nbsp;&nbsp;&nbsp;&nbsp;User Id</p><br>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;<input disabled="disabled" type="text" name="uname" size="20" style="width:70%;"></p><br>
	<p style="margin-bottom:-17px">&nbsp;&nbsp;&nbsp;&nbsp;PayJnu password</p><br>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<input disabled="disabled" type="password" name="pwd" size="20" style="width:70%;"></p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<input disabled="disabled" type="submit" value="Login"></p>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;<a style="text-decoration: underline; color: #FF0000" href="">
	Problem with login?</a></p>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;New to PayJnu? <a style="color: #0000FF" href="">Sign up</a></p>
</form>
        <hr>
        <div style=" width:100%;height:auto;margin-left: 1%;margin-left: 4%;"><br>
        <p style=""><font face="Arial Narrow" size="5">Get to Know PayJnu</font></p>
        <nav style="margin-left:1.3%">
        <a href="#" style="color:#336699">How PayJnu Works</a><font color="#336699"><br><br>
        </font>
        <a href="#" style="color:#336699">Getting Started</a><font color="#336699"><br><br>
        </font>
        <a href="#" style="color:#336699">Managing Your Account</a><font color="#336699"><br><br>
        </font>
        <a href="#" style="color:#336699">GreatWays to Use PayJnu</a><font color="#336699"><br><br>
        </font>
        <a href="#" style="color:#336699">Top 10 Things to Know about PayJnu</a>
        </nav><br>
        </div> 
</div>
<div style="width:60.7%;height:auto;background-color:#3E4164;margin-left:25%;float: top;;"> 
    <b><font size="6" face="Segoe MDL2 Assets" color="#FFFFFF">&nbsp;
WELCOME TO PayJnu</font></b><i><br><br></i><font size="5" face="SimSun-ExtB" color="#FFFFFF">&nbsp; The world most-loved way to pay and get 
paid.</font>
</div> 
<div style="width:60.7%;height:auto;margin-left:25%;float:top;background-color:#F5F5F5;text-align: center;"><br><br>
  <p style="font-size:25px; color:green">New Registration</p>
  <% if(request.getParameter("MobNo")==null){
      if(session.getAttribute("OTP")!=null){
          session.removeAttribute("OTP");
      }
      if(session.getAttribute("status")!=null){
       String status=(String)session.getAttribute("status");
       session.removeAttribute("status");
       %>
       <p style="margin-left:0%;color: green"><% out.print(status); %></p>
       <%
      }
   %>
   <form action="CustSignUp.jsp" onsubmit="return validateMob()" method="post">
        <input type="text" name="MobNo" autocomplete="off" placeholder="Enter Mobile No" id="MobNo" style="margin-top:20px;"><br><span id="usermob" class="text-danger"></span><br>
        <input type="submit" name="submit" value="submit"  style="margin-top:20px;"><br><br>   
    </form>
    <% } %>
    <% if(request.getParameter("MobNo")!=null){
             if(!CheckMobile.UserCheck(request.getParameter("MobNo"))){
                 if(request.getParameter("reqotp")!=null){
                    if(!(CheckMobile.CheckUserName(request.getParameter("uid")))){
                    String otp=mngt.SendOtp(request.getParameter("MobNo"));
                    session.setAttribute("OTP",otp);
                    session.setAttribute("cotp","0");
                    }
                    else
                    {
                        session.setAttribute("status"," UserName already exist. Please Select other Username.");
                    }
                 } 
                 if(session.getAttribute("OTP")!=null){ %>
                    <form style="padding: 0 8px;background: #F5F5F5;" action="CustSignUp.jsp" method="post">
                    Please Do not Refresh Page While Transaction<br>Only 3 attempt allowed.<br>
                    <%    if(request.getParameter("otp")!=null){
                                String otp1=request.getParameter("otp");
                                String otp2=(String)session.getAttribute("OTP");
                                if(otp1.equals(otp2)){
                                session.removeAttribute("OTP");
                                System.out.println("OTP Match");
                                RequestDispatcher rd=request.getRequestDispatcher("CustSignUp");
                                rd.forward(request, response);
                                }
                                else{
                                %>
                                <script>
                                        alert("Wrong OTP");
                                </script>
                                <%
                                String n=(String)session.getAttribute("cotp");
                                n+=1;
                                session.setAttribute("cotp",n);
                                if(n.length()==4){
                                    session.removeAttribute("OTP");
                                    response.sendRedirect("CustSignUp.jsp");
                                }
                                }
                     }
                     if(request.getParameter("MobNo")==null){
                      session.removeAttribute("OTP");
                      response.sendRedirect("CustSignUp.jsp");
                    }
                %>
                <input type="hidden" name="Name" value="<%out.print(request.getParameter("Name"));%>">
                <input type="hidden" name="uid" value="<%out.print(request.getParameter("uid"));%>">
                <input type="hidden" name="pwd" value="<%out.print(request.getParameter("pwd"));%>">
                <input type="hidden" name="MobNo" value="<%out.print(request.getParameter("MobNo"));%>">
                <input type="hidden" name="dob" value="<%out.print(request.getParameter("dob"));%>">
                <input type="hidden"  name="address" value="<%out.print(request.getParameter("address"));%>">
                <input type="hidden"  name="email" value="<%out.print(request.getParameter("email"));%>"><br><br>
                Enter OTP:
                <input type="password" name="otp" style=""><br>
                <input type="submit" style="margin-top:5px;" value="submit"><br><br><br>
                </form>
                <% }
                else{
                        if(session.getAttribute("status")!=null){
                           String status=(String)session.getAttribute("status");
                           session.removeAttribute("status");
                           %>
                           <p style="margin-left:0%;color: green"><% out.print(status); %></p>
                           <%
                              }
                           %>
    <form  action="CustSignUp.jsp" onsubmit="return validation()" style="margin-left:0%; padding: 0 8px;line-height:23px; background: #F5F5F5;" method="post">
        Name:
        <input type="text" name="Name" autocomplete="off" id="name" style="margin-top:6px;margin-left:78px;"><span id="username" class="text-danger"></span> <br> 
        User Id:
        <input type="text" name="uid" autocomplete="off" id="uid" style="margin-top:6px;margin-left:70px"><span id="userid" class="text-danger"></span> <br>
        Password:
         <input type="password" name="pwd" 
                            id="pwd" autocomplete="off" style="margin-top:6px;margin-left:53px"> <span id="userpass" class="text-danger"></span> <br>
        Confirm Password:
         <input type="password" name="cnfpwd" 
                            id="cnfpwd" autocomplete="off" style="margin-top:6px;"> <span id="cnfuserpass" class="text-danger"></span> <br>
        DOB:                   
        <input type="date" name="dob" 
                 id="dob" autocomplete="off" style="margin-top:6px;margin-left:83px"><span id="userdob" class="text-danger"></span> <br>
        Address:
          <input type="text"  name="address"
                            id="address"   style="margin-top:6px;margin-left:62px; height:40px"> <span id="useraddress" class="text-danger"></span><br>
        Email:
          <input type="text"  name="email"
                            id="email"   style="margin-top:6px;margin-left:78px"> <span id="useremail" class="text-danger"></span><br>
          <input type="hidden" name="MobNo" value="<% out.print(request.getParameter("MobNo"));%>"> 
        <input type="hidden" name="reqotp" value="1">   
        <input type="submit" name="submit" value="submit"  style="margin-top:20px;"><br><br><br>
    </form>
    <%   }
       }
       else{
        session.setAttribute("status","Mobile Number Already have Associated Account.");
        response.sendRedirect("CustSignUp.jsp");
       }
      }
    %>
</div>    
<br><br><br><br><br><br><br>
<%@include file="NewFooter.jsp" %>
</body>
<script>
 function validation(){
            var name=document.getElementById("name").value;
            var uid=document.getElementById("uid").value;
            var pwd=document.getElementById("pwd").value;
	    var cnfpwd=document.getElementById("cnfpwd").value;
            var dob=document.getElementById("dob").value;
            var address=document.getElementById("address").value;
            var email=document.getElementById("email").value;
            
            if(name==""){
                document.getElementById("username").innerHTML="* Enter Name";
                return false;
            }
            else
                document.getElementById("username").innerHTML="";
             if((name.length<=3)||(name.length>20)){
                document.getElementById("username").innerHTML="*Must be a valid name";
                return false;
            }
            else
                document.getElementById("username").innerHTML="";
            if(!isNaN(name)){
                document.getElementById("username").innerHTML="*only characters are allowed";
                return false;
            }            
            else
                document.getElementById("username").innerHTML="";
    
            
	    if(uid==""){
                document.getElementById("userid").innerHTML="* fill this field";
                return false;
            }
            else
               document.getElementById("userid").innerHTML=""; 
            if((uid.length<6)||(uid.length>10)){
                document.getElementById("userid").innerHTML="*length will be between 6 to 10";
                return false;
            }
            else
               document.getElementById("userid").innerHTML=""; 
	    if(pwd==""){
                document.getElementById("userpass").innerHTML="* fill this field";
                return false;
            }
            else
               document.getElementById("userpass").innerHTML=""; 
            if((pwd.length<=4)||(pwd.length>15)){
                document.getElementById("userpass").innerHTML="*length will be between 5 to 15";
                return false;
            }    
            else
               document.getElementById("userpass").innerHTML="";  
             
	    if(cnfpwd==""){
                document.getElementById("cnfuserpass").innerHTML="* fill this field";
                return false;
            }
            else
                document.getElementById("cnfuserpass").innerHTML="";
            if(pwd!=cnfpwd){
                document.getElementById("cnfuserpass").innerHTML="* Password not matched";
                return false;
            }  
            else
               document.getElementById("cnfuserpass").innerHTML="";
	    if(dob==""){
                document.getElementById("userdob").innerHTML="* fill this field";
                return false;
            }
            else
               document.getElementById("userdob").innerHTML="";
            if(address==""){
                document.getElementById("useraddress").innerHTML="* fill this field";
                return false;
            }
            else
                document.getElementById("useraddress").innerHTML="";
            if(email==""){
                document.getElementById("useremail").innerHTML="* fill this field";
                return false;
            }
            else
                document.getElementById("useremail").innerHTML="";
            if(email.indexOf("@")<=0){
                document.getElementById("useremail").innerHTML="* invalid Email";
                return false;
            }
            else
               document.getElementById("useremail").innerHTML=""; 
            if((email.charAt(email.length-4)!=".")&&(email.charAt(email.length-3)!=".")){ 
                 document.getElementById("useremail").innerHTML="*.invalid Email";
                return false;
            }
            else
               document.getElementById("useremail").innerHTML="";
             if(otp==""){
                document.getElementById("userotp").innerHTML="*otp required";
                return false;
            }
        }
    function validateMob(){
            var mobile=document.getElementById("MobNo").value;
            if(mobile==""){
                document.getElementById("usermob").innerHTML="* Enter Mobile Number Please";
                return false;
            }
            else
               document.getElementById("usermob").innerHTML="";
            if(isNaN(mobile)){
                document.getElementById("usermob").innerHTML="* Not A Valid Mobile Number";
                return false;
            }
            else
               document.getElementById("usermob").innerHTML="";  
            if(mobile.length!=10){
                document.getElementById("usermob").innerHTML="* Length Must be of 10 digits ";
                return false;
            }
            else
               document.getElementById("usermob").innerHTML=""; 
            if(parseInt(mobile)<5555555555){
                document.getElementById("usermob").innerHTML="* Please Enter Valid Mobile Number";
                return false;
            }
            else
               document.getElementById("usermob").innerHTML="";
    }
</script>
</html>

