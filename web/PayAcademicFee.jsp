<%-- 
    Document   : PayAcademicFee
    Created on : 29 Mar, 2019, 1:14:49 AM
    Author     : Kuldeep Raj Tiwari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="kuldeep.*,Interface.*,SupportClass.*;"%>
<%! ManagementImpl mngt=new ManagementImpl(); 
    UserDetails u=new UserDetails();
%>
<html>

<head>
    <link rel="icon" type="image/ico" href="image/icon.png">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Academic Fee Payment</title>
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
<% response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
           if(session.getAttribute("uDetail")==null){
            response.sendRedirect("CustomerLogin.jsp");
           }
        else{
            u=(UserDetails)session.getAttribute("uDetail");
            u=mngt.getDetails(u.uname, 1);
            session.setAttribute("uDetail", u);
        }
 %>
 <% 
    if(request.getParameter("reqOTP")!=null&&request.getParameter("reqOTP").equals("2")){
            //System.out.print("Hello test 1");
            String otp=mngt.SendOtp(u.mno);
            session.setAttribute("OTP",otp);
            session.setAttribute("PageRequest","2");
            session.setAttribute("cotp","0");
    }
 %>
<p>&nbsp;
<img border="0" src="image/onlinelogo.jpg" width="349" height="106" /></p>
<form action="logout">        
    <input type="submit" name="B6" style="font-family: Tempus Sans ITC; font-weight: bold ;margin-left:50%;margin-top:-55px;margin-right: 22px; color:red;float: right;" value="Logout">
    <hr>
</form>

<%@include file="CustButtontab.jsp"%>
<div style="width:60.7%;height:85px ;background-color:#3E4164;margin-left:25%;float: top;;"> 
    <b><font size="5" face="Segoe MDL2 Assets" color="#FFFFFF">&nbsp;
WELCOME TO PayJnu</font></b><i><br><br></i><font size="4" face="SimSun-ExtB" color="#FFFFFF">&nbsp; The world most-loved way to pay and get 
paid.</font>
</div> 

<div style="width:60.7%;height:auto;margin-left:25%;float:top;background-color:#F5F5F5;"> 
   <br><br>
    <% if(session.getAttribute("status")!=null){
       String status=(String)session.getAttribute("status");
       session.removeAttribute("status");
       %>
       <p style="margin-left: 25%;color: green"><% out.print(status); %></p>
       <%
      }
   %>
    <p style="font-size:25px;margin-left:32%;">Pay Academic Fees</p>
    <%if(!(session.getAttribute("OTP")!=null&&session.getAttribute("PageRequest")!=null&&session.getAttribute("PageRequest").equals("2"))){%>
    <form style="margin-left:25%; padding: 0 8px;line-height:23px; background: #F5F5F5;" action="PayAcademicFee.jsp" method="post" onsubmit="return validation();">
        Select School:
        <select name="School" id="school" style="padding:6px; width:auto;"> 
            <option value="none">select</option>
            <option value="kuldeep">SC&SS</option> 
            <option value="sps">SPS</option> 
            <option value="sis">SIS</option> 
            <option value="sss">SSS</option> 
            <option value="scis">SCIS</option> 
            <option value="ses">SES</option> 
        </select><br>
        <span id="sschool" class="text-danger"></span> <br> 
        <input type="hidden" name="reqOTP" value="2">
        <input type="hidden" name="PageRequest" value="2">
        Enter Amount:
        <input type="text" name="Amount" style="margin-top:6px;" id="amt">
        <br>
        <span id="samt" class="text-danger"></span> <br> 
        <input type="submit" style="margin-left:145px;margin-top:20px;" value="Get OTP"><br>
        </form>
        <%}%>
        <%if(session.getAttribute("OTP")!=null&&session.getAttribute("PageRequest")!=null&&session.getAttribute("PageRequest").equals("2")){%>
        <form style="margin-left:25%; padding: 0 8px;line-height:23px; background: #F5F5F5;" action="PayAcademicFee.jsp" method="post">
            Please Do not Refresh Page While Transaction<br>Only 3 attempt allowed.<br>
        <%    if(request.getParameter("otp")!=null){
                        String otp1=request.getParameter("otp");
                        String otp2=(String)session.getAttribute("OTP");
                        if(otp1.equals(otp2)){
                        System.out.println("OTP Match");
                        RequestDispatcher rd=request.getRequestDispatcher("PayAcademic");
                        rd.forward(request, response);
                        }
                        else{
                        %>
                        <script>
                                alert("Wrong OTP");
                        </script>
                        <%
                        String n=(String)session.getAttribute("cotp");
                        System.out.print(n);
                        n+=1;
                        session.setAttribute("cotp",n);
                        if(n.length()==4){
                            session.removeAttribute("OTP");
                            session.removeAttribute("PageRequest");
                            response.sendRedirect("PayAcademicFee.jsp");
                        }
                        }
             }
             if(request.getParameter("School")==null){
              session.removeAttribute("OTP");
              session.removeAttribute("PageRequest");
              response.sendRedirect("PayAcademicFee.jsp");
            }
        %>
        <input type="hidden" name="School" value="<%out.print(request.getParameter("School"));%>">
        <input type="hidden" name="Amount" value="<%out.print(request.getParameter("Amount"));%>"><br>
        Enter OTP:
        <input type="password" name="otp" style="margin-top:8px; margin-left:19px;"><br>
        <input type="submit" style="margin-left:145px;margin-top:20px;" value="submit">
        </form>
        <%}%>
 </div> 
<br><br><br><br>
<%@include file="NewFooter.jsp" %>
<script>
function validation(){
            var school=document.getElementById("school").value;
            var amt=document.getElementById("amt").value;
            if(school==="none"){
                document.getElementById("sschool").innerHTML="* Please Select School";
                return false;
            }
            else
            {
              document.getElementById("sschool").innerHTML="";  
            }
            if(amt===""){
                document.getElementById("samt").innerHTML="* This field Can't be empty."; 
                return false;
            }
            else{
                document.getElementById("samt").innerHTML=""; 
            }
            if(isNaN(amt)){
              document.getElementById("samt").innerHTML="* Not a Valid Amount."; 
              return false;
            }
    }
</script>
 </body>
 </html>
