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
<title>Transfer Money</title>
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
    if(request.getParameter("reqOTP")!=null&&request.getParameter("reqOTP").equals("4")){
            System.out.print("Hello test 1");
            session.setAttribute("OTP","1234");
            session.setAttribute("PageRequest","4");
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
    <p style="font-size:25px;margin-left:32%;">Welcome To Onlne Transfer Money</p>
    <%if(!(session.getAttribute("OTP")!=null&&session.getAttribute("PageRequest")!=null&&session.getAttribute("PageRequest").equals("4"))){%>
    <form style="margin-left:25%; padding: 0 8px;line-height:23px; background: #F5F5F5;" action="CustTransMoney.jsp" method="post" onsubmit="return validation();">
       <input type="hidden" name="reqOTP" value="4">
       <input type="hidden" name="PageRequest" value="4">
        Enter Reciever Mobile No:
       <input type="text" name="rmobile" style="margin-top:6px;margin-left:23px;" id="Mob">
        <br>
        <span id="sMob" class="text-danger"></span> <br>
         Confirm Reciever Mobile No:
       <input type="password" name="crmobile" style="margin-top:8px; margin-left:7px;" id="cMob"> <br>
       <span id="scMob" class="text-danger"></span> <br>
         Enter Amount:
       <input type="text" name="amount" style="margin-top:6px;margin-left:97px;" id="amt"><br>
       <span id="samt" class="text-danger"></span> <br>  
       <input type="submit" style="margin-left:243px;margin-top:20px;" value="Get OTP"><br>
    </form>
    <%}%>
    <%if(session.getAttribute("OTP")!=null&&session.getAttribute("PageRequest")!=null&&session.getAttribute("PageRequest").equals("4")){%>
    <form style="margin-left:25%; padding: 0 8px;line-height:23px; background: #F5F5F5;" action="CustTransMoney.jsp" method="post">
            Please Do not Refresh Page While Transaction<br>Only 3 attempt allowed.<br>
        <%    if(request.getParameter("otp")!=null){
                        String otp1=request.getParameter("otp");
                        String otp2=(String)session.getAttribute("OTP");
                        if(otp1.equals(otp2)){
                        System.out.println("OTP Match");
                        RequestDispatcher rd=request.getRequestDispatcher("CustTrans");
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
                            response.sendRedirect("CustTransMoney.jsp");
                        }
                        }
             }
             if(request.getParameter("rmobile")==null){
              session.removeAttribute("OTP");
              session.removeAttribute("PageRequest");
              response.sendRedirect("CustTransMoney.jsp");
            }
        %>
        <input type="hidden" name="rmobile" value="<% out.print(request.getParameter("rmobile")); %>">
        <input type="hidden" name="amount" value="<% out.print(request.getParameter("amount")); %>">
        Enter OTP:
        <input type="password" name="otp" style="margin-top:8px; margin-left:116px;"><br>
        <input type="submit" style="margin-left:243px;margin-top:20px;" value="Submit"><br>
    </form>
    <%}%>
 </div> 
<br><br><br><br>
<%@include file="NewFooter.jsp" %>
<script>
function validation(){
            var Mob=document.getElementById("Mob").value;
            var cMob=document.getElementById("cMob").value;
            var amt=document.getElementById("amt").value;
            if(isNaN(Mob)){
                document.getElementById("sMob").innerHTML="* Not a Mobile Number.";
                return false;
            }
            else
            {
              document.getElementById("sMob").innerHTML="";  
            }
            if(Mob.length!==10){
                document.getElementById("sMob").innerHTML=" * Not a valid Mobile Number.";
                return false;
            }
            else
            {
              document.getElementById("sMob").innerHTML="";  
             }
            if(Mob!==cMob){
              document.getElementById("scMob").innerHTML="* Mobile Number do'not matched. ";
              return false;
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

